<%@ Page Title="Forgotten Username" Language="C#" MasterPageFile="~/ExistingMembers/EMembersNMP.master" AutoEventWireup="true" CodeBehind="ForgotUsername.aspx.cs" Inherits="CompCare.ExistingMembers.ForgotUsername" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageSubNav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <h3>Forgot Username</h3>
    <p>Please provide your ID Number and Membership Number for verification. Your username will be sent to the email address associated to your membership number.</p>
    
    <table cellpadding="5" cellspacing="0" style="width:500px">
        <tr>
            <td colspan="2">
        <asp:Label ID="lblStatus" runat="server" /></td>
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
            <td></td>
            <td><asp:Button Text="Submit" runat="server" ID="btnSubmit" CssClass="normalButtons"
                    onclick="btnSubmit_Click" /></td>
        </tr>
    </table>
</asp:Content>
