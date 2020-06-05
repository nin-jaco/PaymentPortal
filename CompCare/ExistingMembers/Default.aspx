<%@ Page Title="Welcome to the Compcare Wellness Members Area" Language="C#" MasterPageFile="~/ExistingMembers/EMembersNMP.master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CompCare.ExistingMembers.Default" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageSubNav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <table cellpadding="0" cellspacing="0" style="width: 939px">
        <tr>
            <td class="membersHomeIntro" valign="top">
                <h1>
                    Welcome to the CompCare Wellness Members Area</h1>
                <p>
                    Welcome to the CompCare Wellness member page – where you can keep in touch with
                    your scheme and what we are doing for you. Please log in to view your membership
                    details.</p>
            </td>
            <td style="width: 29px">
                &nbsp;
            </td>
            <td style="width: 330px" valign="top" class="roundedRightColumn">
                <h1>
                    &raquo; Login to the Member Portal...</h1>
                <table cellpadding="5" cellspacing="0">
                    <tr>
                        <td colspan ="2">
                            <asp:Label ID="lblLoginError" runat="server" ForeColor="Red" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                           <%-- <asp:Label runat="server" ID="lblReminder" Text="?" ForeColor="Blue" />
                            <asp:PopupControlExtender ID="lblReminder_PopupControlExtender" runat="server" 
                                DynamicServicePath="" Enabled="True" ExtenderControlID="" 
                                TargetControlID="lblReminder">
                            </asp:PopupControlExtender>--%>
                            <asp:Label runat="server" ID="lblName">Username:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbuserName" runat="server" Width="150"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:Label runat="server" ID="lblSurname">Password:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" Width="150"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" colspan="2">
                            <a href="RegisterUser.aspx">&raquo; Register</a>
                            <br />
                            <a href="ForgotPassword.aspx">&raquo; Forgot Password</a><br />
                            <a href="ForgotUsername.aspx">&raquo; Forgot Username</a>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: right">
                            <asp:Button ID="btnSubmit" Text="Login" runat="server" 
                                onclick="btnSubmit_Click" CssClass="normalButtons" />&nbsp;
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
