<%@ Page Title="StudentPlan: Login" Language="C#" MasterPageFile="~/StudentPlanNMP.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StudentPlan.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="bodyText" runat="server">
    <h1>Login</h1>
    <p class="radialShadow">&nbsp;</p>
    <table cellpadding="0" cellspacing="0" style="width: 939px">
        <tr>
            <td class="membersHomeIntro" valign="top">
                <h1>
                    Welcome to the CompCare Wellness 
                    Student Area</h1>
                <p>
                    Welcome to the CompCare Wellness 
                    student area – where you can keep in touch with
                    your scheme and what we are doing for you. Please log in to view your 
                    registration and&nbsp; membership
                    details.</p>
            </td>
            <td style="width: 29px">
                &nbsp;
            </td>
            <td style="width: 330px" valign="top" class="roundedRightColumn">
                <h1>
                    &raquo; Login to the 
                    Student Portal...</h1>
                <table cellpadding="5" cellspacing="0">
                    <tr>
                        <td colspan ="2">
                            <asp:Label ID="lblLoginError" runat="server" ForeColor="Red" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
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
                            <a href="Register.aspx">&raquo; Register</a>
                            <br />
                            <a href="ForgotPassword.aspx">&raquo; Forgot Password</a>
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
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <p>
        <img alt="" src="Images/applynowFlash.jpg" 
            style="width: 979px; height: 359px" /></p>
</asp:Content>

