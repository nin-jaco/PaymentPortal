<%@ Page Title="Register on the Website" Language="C#" MasterPageFile="~/ExistingMembers/EMembersNMP.master" AutoEventWireup="true" CodeBehind="RegisterUser.aspx.cs" Inherits="CompCare.ExistingMembers.RegisterUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageSubNav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <table cellpadding="0" cellspacing="0" style="width: 939px">
        <tr>
            <td>
                <h1>
                    Register User</h1>
                
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <h5>
                                Please complete the following form:</h5>
                            <asp:Label ID="lblError" ForeColor="Red" runat="server" /><br />
                            <asp:Label ID="lblSuccess" CssClass="successText" runat="server" />
                            <table cellpadding="5" cellspacing="5">
                                <tr>
                                    <td>
                                        Membership Number:
                                    </td>
                                    <td class="otherRows">
                                        <asp:Label runat="server" ID="lblMembershipNumber" ForeColor="Red" /><br />
                                        <asp:TextBox runat="server" ID="tbMembershipNumber" MaxLength="20" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ID Number
                                    </td>
                                    <td class="otherRows">
                                        <asp:Label ID="lblIdNumber" runat="server" ForeColor="Red"></asp:Label><br />
                                        <asp:TextBox runat="server" ID="tbIdNumber" MaxLength="50" />
                                    </td>
                                </tr>
                                <tr runat="server" id="trName">
                                    <td>
                                        Name:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:TextBox runat="server" ID="lblName" /></b>
                                    </td>
                                </tr>
                                <tr runat="server" id="trSurname">
                                    <td>
                                        Surname:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:TextBox runat="server" ID="lblSurname" /></b>
                                    </td>
                                </tr>
                                <tr runat="server" id="trEmail">
                                    <td>
                                        Email
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:TextBox runat="server" ID="tbEmail" MaxLength="50" />
                                        </b>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Username:
                                    </td>
                                    <td class="otherRows">
                                        <b>
                                            <asp:TextBox runat="server" ID="tbUsername" MaxLength="50" />
                                        </b>
                                    </td>
                                </tr>
                                <tr runat="server" id="trPsword">
                                    <td>
                                        Password:
                                    </td>
                                    <td class="otherRows">
                                        <asp:textBox ID="tbPassword" runat="server" TextMode="Password" MaxLength="50"  />
                                    </td>
                                </tr>
                                <tr runat="server" id="trPsword2">
                                    <td valign="top">
                                        Confirm Password:
                                    </td>
                                    <td class="otherRows">
                                        <asp:TextBox runat="server" ID="tbConfirmPassword" TextMode="Password" MaxLength="50" />
                                    </td>
                                </tr>
                                <tr runat="server" id="trButton">
                                    <td colspan="2" style="text-align:right"><asp:Button runat="server" ID="btnSubmit" 
                                            Text="Submit" CssClass="normalButtons" onclick="btnSubmit_Click" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
