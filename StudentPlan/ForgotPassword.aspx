<%@ Page Title="StudentPlan: Forgot Password" Language="C#" MasterPageFile="~/StudentPlanNMP.master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="StudentPlan.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyText" runat="server">
    <h1>Forgot Password</h1>
     

    <p>
        <asp:Label ID="lblChangePasswordError" ForeColor="Red" runat="server" /></p>
    
    <table cellpadding="5" cellspacing="0">
        <tr>
            <td colspan="2">
                Please provide your ID 
                /Passport Number and Username for verification.</td>
        </tr>
        <tr>
            <td>Id Number:</td>
            <td><asp:TextBox runat="server" ID="tbIdnumber" /></td>
        </tr>
        <tr>
            <td>Username:</td>
            <td>
                <asp:TextBox runat="server" ID="tbUsername" /></td>
        </tr>
        <tr>
            <td>
                Password:
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbPassword1" TextMode="Password" />
            </td>
        </tr>
        <tr>
            <td>
                Confirm Password:
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbPassword2" TextMode="Password" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button Text="Submit" runat="server" ID="btnSubmit" 
                    onclick="btnSubmit_Click" /></td>
        </tr>
    </table>
</asp:Content>
