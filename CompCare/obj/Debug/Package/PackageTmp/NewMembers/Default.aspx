<%@ Page Title="Welcome to the Compcare Wellness New Members Area" Language="C#" MasterPageFile="~/NewMembers/NMembersNMP.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CompCareWebsite.NewMembers.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageSubNav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <h1>
        Welcome to a world of healthcare options with CompCare Wellness Medical Scheme</h1>
    <br />
    <p class="radialShadow">&nbsp;</p>
    <table cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td class="nopicHomeIntro" valign="top">
                <p>
                    
                    CompCare offers a strong member-centric product range of six benefit options at
                    consistently affordable prices to ensure that members receive the cover they need
                    without putting them out of pocket. No matter what stage of life you are in, CompCare
                    has just the right option for you. 
                </p>
                <p>
                    
                    E-mail Address:&nbsp; <a href="mailto:compcare@universal.co.za">compcare@universal.co.za</a><br />Fax
                    Number: <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 086 645 0991</strong>
                </p>
            </td>
            <td style="width: 29px">
                &nbsp;
            </td>
            <td style="width: 330px" valign="top" class="roundedRightColumn">
                <h1>
                    &raquo; Have a Consultant Contact you...</h1>
                <table cellpadding="5" cellspacing="0">
                    <tr>
                        <td colspan="2"><asp:Label runat="server" ID="lblStatus" /></td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            Name:</td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="tbName" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="tbName" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            Surname:</td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ControlToValidate="tbSurname" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="tbSurname" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            Email Address:
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field" ControlToValidate="tbEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="tbEmail" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            Telephone:</td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required Field" ControlToValidate="tbTelephone" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="tbTelephone" runat="server" /></td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            Cellular:</td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required Field" ControlToValidate="tbCellular" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="tbCellular" runat="server" /></td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            Marital Status:
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required Field" ControlToValidate="ddlMarital" ForeColor="Red"></asp:RequiredFieldValidator><br />
                            <asp:DropDownList runat="server" ID="ddlMarital" Width="100">
                                <asp:Listitem Value="" Text="Please select.." />
                                <asp:Listitem Value="Single" Text="Single" />
                                <asp:ListItem Value="Married" Text="Married" />
                                <asp:ListItem Value="Divorced" Text="Divorced" />
                                <asp:ListItem Value="Widowed" Text="Widowed" />
                                <asp:ListItem Value="Cohabiting" Text="Cohabiting" />
                            </asp:DropDownList>
                            <%--<asp:TextBox ID="tbMarital" runat="server" />--%>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            No of Dependants:
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required Field" ControlToValidate="ddlNoOfDependants" ForeColor="Red"></asp:RequiredFieldValidator><br />
                            <asp:DropDownList ID="ddlNoOfDependants" runat="server" Width="100">
                                <asp:ListItem Text="Please select.." Value="" />
                                <asp:ListItem Text="0" Value="0" />
                                <asp:ListItem Text="1" Value="1" />
                                <asp:ListItem Text="2" Value="2" />
                                <asp:ListItem Text="3" Value="3" />
                                <asp:ListItem Text="4" Value="4" />
                                <asp:ListItem Text="5" Value="5" />
                                <asp:ListItem Text="6" Value="6" />
                                <asp:ListItem Text="7" Value="7" />
                                <asp:ListItem Text="8" Value="8" />
                                <asp:ListItem Text="9" Value="9" />
                                <asp:ListItem Text="10" Value="10" />
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" style="text-align: right">
                            <asp:Button ID="Button1" Text="Submit" runat="server" CssClass="normalButtons" 
                                onclick="Button1_Click" />
                        </td>
                    </tr>
                </table>
                <br />
            </td>
            <td style="width: 20px;">
            </td>
        </tr>
    </table>
</asp:Content>
