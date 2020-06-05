<%@ Page Title="Compcare Wellness: Forgot Password" Language="C#" MasterPageFile="~/ExistingMembers/EMembersNMP.master"
    AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="CompCare.ExistingMembers.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageSubNav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <h3>Reset your password</h3>
    <p>
        <asp:Label ID="lblChangePasswordError" ForeColor="Red" runat="server" /></p>
    
    <table cellpadding="5" cellspacing="0">
        <tr>
            <td colspan="2">
                Please provide your ID Number and Membership Number for verification.</td>
        </tr>
        <tr>
            <td>Id Number:</td>
            <td><asp:TextBox runat="server" ID="tbIdnumber" /></td>
        </tr>
        <tr>
            <td>Membership Number:</td>
            <td>
                <asp:TextBox runat="server" ID="tbMembershipNumber" /></td>
        </tr>
        <tr>
            <td>
                New
                Password:
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbPassword1" TextMode="Password" />
            </td>
        </tr>
        <tr>
            <td>
                Confirm New Password:
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbPassword2" TextMode="Password" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button Text="Submit" runat="server" ID="btnSubmit" CssClass="normalButtons" 
                    onclick="btnSubmit_Click" /></td>
        </tr>
    </table>
</asp:Content>
