<%@ Page Title="Compcare Wellness: Claims History" Language="C#" MasterPageFile="~/ExistingMembers/LoggedInNMP.master"
    AutoEventWireup="true" CodeBehind="ClaimsHistory.aspx.cs" Inherits="CompCare.ExistingMembers.ClaimsHistory" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
    <style type="text/css">
        .style1
        {
            width: 207px;
        }
    </style>
    <style type="text/css">
    .modalBackground
        {
            background-color: Black;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 10000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <asp:HiddenField runat="server" ID="currentView" />
    <table cellpadding="5" cellspacing="0">
        <tr>
            <td style="width: 20px">
                &nbsp;
            </td>
            <td style="width: 100%; text-align: left">
                <h3>Your Claims History</h3>
                <div class="radialShadow" style="width: 100%; height: 15px">
                </div>
                <h5>
                    Your Claims History</h5>
                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
                <fieldset title="Custom Search">
                    <table cellpadding="5" cellspacing="0">
                        <%--<tr>
                            <td colspan="3">
                                <h5>
                                    Custom Search</h5>
                            </td>
                            
                            <td style="width:200px">
                                &nbsp;</td>
                            
                            <td>
                                &nbsp;</td>
                            
                        </tr>--%>
                        <tr>
                            <td colspan="2" style="width:400px"><asp:Label ID="lblError" ForeColor="Red" runat="server" /></td>
                            <td rowspan="4">
                                <asp:Button ID="btnCurrentMonth" runat="server" CssClass="bigButton" 
                                    onclick="btnCurrentMonth_Click" Text="Current Month" /> &nbsp;
                                <asp:Button ID="btnMonthLast" runat="server" CssClass="bigButton" 
                                    onclick="btnMonthLast_Click" Text="Last Month" />&nbsp;
                                <asp:Button ID="btnMonthBeforeLast" runat="server" CssClass="bigButton" OnClick="btnMonthBeforeLast_Click" Text="Month Before Last" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width:150px">
                                Date From:
                            </td>
                            <td class="style1"><asp:TextBox ID="tbFromDate" runat="server" />
                                <asp:CalendarExtender ID="tbFromDate_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="tbFromDate">
                                </asp:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>To Date:</td>
                            <td class="style1"><asp:TextBox runat="server" ID="tbToDate" />
                                <asp:CalendarExtender ID="tbToDate_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="tbToDate">
                                </asp:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="style1"><asp:Button runat="server" ID="btnSubmit" Text="Submit" 
                                    CssClass="normalButtons" onclick="btnSubmit_Click" /></td>
                        </tr>
                    </table>
                </fieldset>
                <br />
                <div style="overflow:auto; width:900px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="dataTable"
                        CellSpacing="0" EmptyDataText="No data available." CellPadding="5" AllowPaging="true"
                        PageSize="20" PagerSettings-Mode="NextPreviousFirstLast" OnPageIndexChanging="gridView_PageIndexChanging"
                        OnSorting="gridView_Sorting">
                        <Columns>
                            <%--<asp:BoundField DataField="ClaimNumber" HeaderText="Claim Number" />--%>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Doctor Name</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Eval("Supplier.SupplierName")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>Patient</HeaderTemplate>
                                <ItemTemplate>
                                  <%#Eval("Dependant.DependantName")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ServiceDate" HeaderText="Treatment Date" DataFormatString="{0:d}"
                                HtmlEncode="false" />
                            <asp:BoundField DataField="Tariff" HeaderText="Tariff Code" />
                            <asp:BoundField DataField="TariffAmount" HeaderText="Tariff Amount" />
                            <asp:BoundField DataField="ClaimAmount" HeaderText="Claim Amount" />
                            <asp:BoundField DataField="PaidToSupplierAmount" HeaderText="Paid to Doctor" />
                            <asp:BoundField DataField="PaidToMemberAmount" HeaderText="Refund to Member" />
                            <asp:BoundField DataField="RejectedAmount" HeaderText="Rejected Amount" />
                            <asp:BoundField DataField="SurchargeAmount" HeaderText="Surplus Amount" />
                            <asp:BoundField DataField="ExcessAmount" HeaderText="Excess Amount" />
                            <asp:BoundField DataField="Status" HeaderText="Claim Status" />
                            <%--
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Claim Status</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Eval("Status")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            --%>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Remarks</HeaderTemplate>
                                <%--<ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><%#Eval("Remark.RemarkCode")%></asp:LinkButton>
                                    <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="LinkButton1" PopupControlID="pnlModalPanel" CancelControlID="btnCancel" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>
                                </ItemTemplate>--%>
                                <ItemTemplate>
                                    <table cellpadding="5" cellspacing="0">
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="lnkBtnViewDetails" runat="server" >
                                                    <%#Eval("Remark.RemarkCode")%>
                                                </asp:LinkButton>
                                                <asp:Panel runat="server" ID="pnlDetails" Style="display: none; width: 500px; border: solid 1px black;
                                                     height: 200px; background-color:#F0F0F0">
                                                    <table cellpadding="5" style="width:500px; height:100px; margin-top:20px" align="center">
                                                        <tr>
                                                            <td colspan="2" style="text-align:right"><asp:Button ID="btnCloseDetails" runat="server" Text="Close Details" CssClass="normalButtons" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2"><h2>Remarks Descriptions</h2></td>
                                                        </tr>
                                                        <tr>
                                                            <td><asp:Label ID="lblRemarkCode" runat="server">Code: </asp:Label></td>
                                                            <td><asp:Literal ID="Literal1" runat="server" Text='<%# (string)Eval("Remark.RemarkCode") %>'></asp:Literal></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblRemarkDescription" runat="server">Description: </asp:Label></td>
                                                            <td>
                                                                <asp:Literal ID="Literal2" runat="server" Text='<%# (string)Eval("Remark.RemarkDescription") %>'></asp:Literal></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <%--<asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="pnlDetails" Corners="All" Radius="15">
                                                </asp:RoundedCornersExtender>--%>
                                                <asp:modalpopupextender id="modalPopUp1" runat="server" targetcontrolid="lnkBtnViewDetails"
                                                    popupcontrolid="pnlDetails" backgroundcssclass="modalBackground" dropshadow="false"
                                                    okcontrolid="btnCloseDetails" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center;">
                                                
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:BoundField DataField="Reference" HeaderText="Reference" />--%>
                            <%--<asp:TemplateField>
                                <HeaderTemplate>
                                    Payment Method</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Eval("PaymentMethod.PaymentMethodDescription")%>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            
                            <%--<asp:BoundField DataField="DateClaimPaid" HeaderText="Date Paid" DataFormatString="{0:d}"
                                HtmlEncode="false" />
                            <asp:BoundField DataField="ClaimItemLineNumber" HeaderText="Claim Item" />--%>
                        </Columns>
                    </asp:GridView>
                </div>
            </td>
            <td style="width: 20px">
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
