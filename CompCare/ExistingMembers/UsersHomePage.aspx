<%@ Page Title="Compcare Wellness: Welcome Member" Language="C#" MasterPageFile="~/ExistingMembers/LoggedInNMP.master"
    AutoEventWireup="true" CodeBehind="UsersHomePage.aspx.cs" Inherits="CompCare.ExistingMembers.UsersHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    
    <h3 style="margin-bottom:5px">
        Welcome back
        <asp:Label ID="lblName" runat="server" /></h3><br />
        <div class="radialShadow" style="width:100%; height:15px"></div>
    <table cellpadding="5" cellspacing="5">
        <tr>
            <td style="width: 20px">
                &nbsp;
            </td>
            <td style="width: 100%; text-align: left">
                <asp:Label ID="lblError" ForeColor="Red" runat="server" />
                <br />
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <h5>Your Details</h5>
                            <table cellpadding="5" cellspacing="5">
                                <tr>
                                    <td>
                                        Initials:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:Label runat="server" ID="lblInitials" /></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Name</td>
                                    <td class="otherRows"><asp:Label ID="lblMemberName" runat="server" 
                                            style="font-weight: 700"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        Surname:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:Label runat="server" ID="lblSurname" /></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Id Number:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:Label runat="server" ID="lblIdNo" /></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Date of Birth:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:Label runat="server" ID="lblDOB" />
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Gender:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:Label runat="server" ID="lblGender" />
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Email:
                                    </td>
                                    <td class="otherRows"><asp:Label ID="lblEmail" runat="server" 
                                            style="font-weight: 700"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Home Telephone Number:</td>
                                    <td class="otherRows"><asp:Label ID="lblTelephone" runat="server" 
                                            style="font-weight: 700" /></td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Cellular Number:</td>
                                    <td class="otherRows"><asp:Label runat="server" ID="lblCellular" 
                                            style="font-weight: 700"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Work Telephone Number:
                                    </td>
                                    <td class="otherRows">
                                        <asp:Label runat="server" ID="lblWorkNumber" Style="font-weight: 700"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Fax Number:
                                    </td>
                                    <td class="otherRows">
                                        <asp:Label runat="server" ID="lblFaxNumber" Style="font-weight: 700"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Postal Address:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:Label runat="server" ID="lblAddress1" /><br />
                                            <asp:Label runat="server" ID="lblAddress2" /><br />
                                            <asp:Label runat="server" ID="lblAddress3" /><br />
                                            <asp:Label runat="server" ID="lblAddress4" /><br />
                                            <asp:Label runat="server" ID="lblPostalCode" />
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Physical Address:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:Label runat="server" ID="lblPhysical1" /><br />
                                            <asp:Label runat="server" ID="lblPhysical2" /><br />
                                            <asp:Label runat="server" ID="lblPhysical3" /><br />
                                            <asp:Label runat="server" ID="lblPhysical4" /><br />
                                            <asp:Label runat="server" ID="lblPhysicalCode" />
                                        </b>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width:50px">&nbsp;</td>
                        <td valign="top">
                            <h5>Your Health Plan</h5>
                            <table cellpadding="5" cellspacing="5">
                                <tr>
                                    <td>
                                        Membership Number:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:Label runat="server" ID="lblMembershipNumber" /></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Scheme Option:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:Label runat="server" ID="lblSchemeOption" /></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Joining Date:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:Label runat="server" ID="lblJoiningDate" />
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Benefit 
                                        Start Date:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:Label runat="server" ID="lblBenefitDate" />
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Resignation Date:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:Label runat="server" ID="lblResignationDate" />
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Suspended From Date:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:Label runat="server" ID="lblSuspendedDate" />
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Suspended To Date:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:Label runat="server" ID="lblSuspendedTo" />
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 20px">
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
