<%@ Page Title="StudentPlan: Online Application Form" Language="C#" MasterPageFile="~/StudentPlanNMP.master" AutoEventWireup="true" CodeBehind="DependantMedical.aspx.cs" Inherits="StudentPlan.DependantMedical" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CustomPageScript" runat="server">
    <script type="text/javascript">
        function BlockUI(elementID) {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(function () {
                $("#" + elementID).block({ message: '<table align = "center"><tr><td>' + '<img src="images/loadingAnim.gif"/></td></tr></table>',
                    css: {},
                    overlayCSS: { backgroundColor: '#000000', opacity: 0.6
                    }
                });
            });
            prm.add_endRequest(function () {
                $("#" + elementID).unblock();
            });
        }
        $(document).ready(function () {

            BlockUI("dvgv");
            $.blockUI.defaults.css = {};
        });
        function Hidepopup() {
            $find("popup").hide();
            return false;
        }
        function HideMHpopup() {
            $find("popup").hide();
            return false;
        }
        </script>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <img alt="" src="http://localhost/StudentPlan/Images/applynowFlash.jpg" 
            style="width: 979px; height: 359px" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyText" runat="server">
    <h1>Online Application Form for Membership on the CompCare Wellness NetworX Option</h1>
                <p class="radialShadow">&nbsp;</p>
    <table cellpadding="5" cellspacing="0" style="width:100%">
        <tr>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x">&nbsp;</td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x">
                <img src="Images/step2.png" alt="Step 2" /></td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x"><h3 class="formHeading">Complete the Application Form 
                (Dependant Detail and Medical History)</h3></td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x"></td>
        </tr>
        <tr>
            <td colspan="4">
                <table cellpadding="10" cellspacing="0" style="width:100%; text-align:left">
                    <tr>
                        <td colspan="2"><asp:Label ID="lblError" runat="server" ForeColor="Red" /><asp:HiddenField runat="server" ID="hfReference" />
                            <asp:ScriptManager ID="ScriptManager2" runat="server">
                            </asp:ScriptManager>
                            </td>
                    </tr>
                    <%--<tr>
                        <td style="text-align:left">Country of Origin:</td>
                        <td><asp:TextBox runat="server" ID="CountryOrigin" Width="200px" /></td>
                        <td></td>
                        <td>Embassy:</td>
                        <td><asp:TextBox runat="server" ID="Embassy" Width="200px" /></td>
                    </tr>--%>
                    <tr>
                        <td class="blueBack" colspan="2">Dependant Particulars</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        <div id="dvgv" style="padding: 10px; width: 750px" align="center">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <p>Do you wish to add any dependants to this policy?<asp:Button ID="btninsert" runat="server" Text="Yes" OnClick="insertinXML" CssClass="normalButtons" /></p>
                                    <asp:GridView ID="gv" runat="server" OnPageIndexChanging="pageddata" OnRowCancelingEdit="Canceldata" Width="100%"
                                        AllowPaging="True" AutoGenerateColumns="false" PageSize="10" CellPadding="4" EnableViewState="true"
                                        ForeColor="#333333" GridLines="None" OnRowDeleting="Deletedata" EmptyDataText="No Dependants Added">
                                        <FooterStyle BackColor="White" Font-Bold="True" ForeColor="Black" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <Columns>
                                            <%--<asp:BoundField DataField="empid" HeaderText="ID" HtmlEncode="true" />--%>
                                            <asp:BoundField DataField="Name" HeaderText="Name" HtmlEncode="true" />
                                            <asp:BoundField DataField="Surname" HeaderText="Surname" HtmlEncode="true" />
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    Relationship</HeaderTemplate>
                                                <ItemTemplate>
                                                    <%#Eval("DependantType.DependantTypeDescription")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    Gender</HeaderTemplate>
                                                <ItemTemplate>
                                                    <%#Eval("Gender.GenderDescription")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="DateOfBirth" HeaderText="Date of Birth" HtmlEncode="true" />
                                            <%--<asp:TemplateField ItemStyle-Width="30px">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" OnClick="Edit" ForeColor="#00424E"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:CommandField ShowDeleteButton="true" ControlStyle-ForeColor="#00424E" />
                                        </Columns>
                                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <%--<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />--%>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                                    <br />
                                    <br />
                    
                                    <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" Style="display: none">
                                        <asp:Label Font-Bold="true" ID="Label4" runat="server" Text="Dependant Details"></asp:Label>
                                        <br />
                                        <table align="center" style="text-align:left" cellpadding="5" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbDName" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text="Surname"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbDSurname" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text="Dependant Type"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:ListBox ID="lbDependantTypes" runat="server" DataValueField="IdDependantType" DataTextField="DependantTypeDescription" Rows="1"></asp:ListBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label5" runat="server" Text="Date of Birth"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="tbDDateOfBirth" Format="yyyy/MM/dd">
                                                    </asp:CalendarExtender>
                                                    <asp:TextBox ID="tbDDateOfBirth" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label6" runat="server" Text="Gender"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:ListBox ID="lbDGenders" runat="server" DataTextField="GenderDescription" DataValueField="IdGender" Rows="1"></asp:ListBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btnSave" runat="server" Text="Add" OnClick="Save" CssClass="normalButtons" />
                                                </td>
                                                <%--<td>
                                                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="Update" />
                                                </td>--%>
                                                <td>
                                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="normalButtons" OnClientClick="return Hidepopup()" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:ModalPopupExtender ID="popup" runat="server" DropShadow="false" PopupControlID="pnlAddEdit"
                                        TargetControlID="btnInsert" BackgroundCssClass="modalBackground">
                                    </asp:ModalPopupExtender>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gv" />
                                    <asp:AsyncPostBackTrigger ControlID="btnSave" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="blueBack" colspan="2">Medical History</td>
                    </tr>
                    <tr>
                            <td colspan="2">Please indicate and provide details of whether any medical treatment, including acute conditions, you or any of your dependants have ever experienced or have received during the last twelve months or anticipate receiving within the next twelve months.</td>
                        </tr>                        
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Have ever experienced, or</td>
                            <td><asp:RadioButton GroupName="rbHasBefore" runat="server" ID="rbHasBeforeYes" 
                                    Text="yes" value="yes" oncheckedchanged="rbHasBeforeYes_CheckedChanged" AutoPostBack="true"/>
                                <asp:RadioButton GroupName="rbHasBefore" runat="server" ID="rbHasBeforeNo" Text="no" value="no" Checked="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; have received during the last twelve months, or</td>
                            <td><asp:RadioButton GroupName="rbLastTwelfe" runat="server" ID="rbLastTwelfeYes" 
                                    Text="yes" value="yes" oncheckedchanged="rbLastTwelfeYes_CheckedChanged" AutoPostBack="true"/>
                                <asp:RadioButton GroupName="rbLastTwelfe" runat="server" ID="rbLastTwelfeNo" Text="no" value="no" Checked="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; anticipate receiving within the next twelve months.</td>
                            <td><asp:RadioButton GroupName="rbNextTwelfe" runat="server" ID="rbNextTwelfeYes" 
                                    Text="yes" value="yes" oncheckedchanged="rbNextTwelfeYes_CheckedChanged" AutoPostBack="true"/>
                                <asp:RadioButton GroupName="rbNextTwelfe" runat="server" ID="rbNextTwelfeNo" Text="no" value="no" Checked="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div id="medicalHistory" runat="server">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div id="divAnyMore" runat="server"><p>Would you like to advise us of any other instances? <asp:Button ID="btnInsertMedicalHistory" runat="server" Text="Insert" OnClick="insertinMHXML" CssClass="normalButtons" /></p></div>
                                    <asp:GridView ID="gvMedicalHistory" runat="server" OnPageIndexChanging="pagedMHdata" OnRowCancelingEdit="CancelMHdata"
                                        AllowPaging="True" AutoGenerateColumns="false" PageSize="10" CellPadding="4" Width="100%" EnableViewState="true"
                                        ForeColor="#333333" GridLines="None" OnRowDeleting="DeleteMHdata" EmptyDataText="No Dependants Added">
                                        <FooterStyle BackColor="White" Font-Bold="True" ForeColor="Black" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <Columns>
                                            <asp:BoundField DataField="Name" HeaderText="Name" HtmlEncode="true" />
                                            <asp:BoundField DataField="TreatmentDate" HeaderText="Date of Treatment" HtmlEncode="true" />
                                            <asp:BoundField DataField="DetailsOfCondition" HeaderText="Details of Condition" HtmlEncode="true" />
                                            <asp:BoundField DataField="DegreeOfRecovery" HeaderText="Degree of Recovery" HtmlEncode="true" />
                                            <asp:CommandField ShowDeleteButton="true" ControlStyle-ForeColor="#00424E" />
                                        </Columns>
                                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                                    <br />
                                    <br />
                    
                                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none">
                                        <asp:Label Font-Bold="true" ID="Label7" runat="server" Text="Treatment Details"></asp:Label>
                                        <br />
                                        <table align="center" style="text-align:left" cellpadding="5" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label8" runat="server" Text="Name"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbMHName" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label9" runat="server" Text="Treatment Date"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="tbMHTreatmentDate" Format="yyyy/MM/dd">
                                                    </asp:CalendarExtender>
                                                    <asp:TextBox ID="tbMHTreatmentDate" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label10" runat="server" Text="Details of Condition"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbMHDetailsOfCondition" runat="server" Rows="3"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label11" runat="server" Text="Degree of Recovery"></asp:Label>
                                                </td>
                                                <td>
                                                    
                                                    <asp:TextBox ID="tbDegreeOfRecovery" runat="server" Rows="3"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Clicked" CssClass="normalButtons" />
                                                </td>
                                                <%--<td>
                                                    <asp:Button ID="Button3" runat="server" Text="Update" OnClick="Update" />
                                                </td>--%>
                                                <td>
                                                    <asp:Button ID="Button4" runat="server" Text="Cancel" OnClientClick="return HideMHpopup()" CssClass="normalButtons" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" DropShadow="false" PopupControlID="Panel1"
                                        TargetControlID="btnInsertMedicalHistory" BackgroundCssClass="modalBackground">
                                    </asp:ModalPopupExtender>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvMedicalHistory" />
                                    <asp:AsyncPostBackTrigger ControlID="btnAdd" />
                                </Triggers>
                            </asp:UpdatePanel>
                                </div>
                            </td>
                        </tr>
                    <tr>
                        <td style="text-align:right" colspan="2"><asp:Button ID="btnNext" 
                                CssClass="normalButtons" Text="Next" runat="server" onclick="btnNext_Click" /></td>
                    </tr>
                </table>
            </td>
        </tr>       
    </table>
</asp:Content>
