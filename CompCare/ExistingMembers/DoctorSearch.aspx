<%@ Page Title="Compcare Wellness: Doctor Search" Language="C#" MasterPageFile="~/ExistingMembers/LoggedInNMP.master"
    AutoEventWireup="true" CodeBehind="DoctorSearch.aspx.cs" Inherits="CompCare.ExistingMembers.DoctorSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageBody" runat="server">
    <table cellpadding="5" cellspacing="0">
        <tr>
            <td style="width: 20px">
                &nbsp;
            </td>
            <td style="width: 100%; text-align: left">
                <h3>
                    Doctor Search</h3>
                <div class="radialShadow" style="width: 100%; height: 15px">
                </div>
                <h5>
                    Search Results</h5>
                <table cellpadding="5" cellspacing="0">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>&nbsp;</td>
                        <td rowspan="4" class="roundedLeft">
                            &nbsp;</td>
                        <td class="roundedCentre">
                            <table cellpadding="5" cellspacing="5">
                                <tr>
                                    <td colspan="2">
                                        Search again:
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Doctor&#39;s Name /Institution:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:TextBox runat="server" ID="tbDoctorName" /></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        City:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:TextBox runat="server" ID="tbCity" /></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: right">
                                        <asp:Button runat="server" ID="btnSubmit" CssClass="normalButtons" Text="Search"
                                            OnClick="btnSubmit_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td class="roundedRight" rowspan="4">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            .</td>
                        <td></td>
                        
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        
                    </tr>
                    <tr>
                        <td>
                            We were able to narrow your search to the following list of providers:</td>
                        <td>
                        </td>
                        
                    </tr>
                </table>
            </td>
            <td style="width: 20px">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" EmptyDataText="No data available"
                    CssClass="dataTable" CellPadding="0" CellSpacing="0" AllowPaging="true"
                    PageSize="20" PagerSettings-Mode="NextPreviousFirstLast" OnPageIndexChanging="gridView_PageIndexChanging"
                    OnSorting="gridView_Sorting">
                    <Columns>
                        <asp:BoundField DataField="SupplierTitle" HeaderText="Title" />
                        <asp:BoundField DataField="SupplierName" HeaderText="Name" />
                        <asp:BoundField DataField="SupplierAddress1" HeaderText="Address" />
                        <asp:BoundField DataField="SupplierAddress2" HeaderText="" />
                        <asp:BoundField DataField="SupplierAddress3" HeaderText="" />
                        <asp:BoundField DataField="SupplierpostalCode" HeaderText="Postal Code" />
                        <asp:BoundField DataField="SupplierTelephone" HeaderText="Telephone" />
                    </Columns>
                </asp:GridView>
            </td>
            <td></td>
        </tr>
    </table>
</asp:Content>
