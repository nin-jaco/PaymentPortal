<%@ Page Title="Website Error" Language="C#" MasterPageFile="~/Errors/ErrorsNMP.master" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="CompCare.Errors.ErrorPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageSubNav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <table cellpadding="0" cellspacing="0" style="width: 939px">
        <tr>
            <td>
                <h1>
                    Website Encountered an Error Processing your Request</h1>
                <br />
                <p>
                    The website encountered a problem processing your request. The <a href="mailto:webmaster@universal.co.za">
                        webmaster</a> has been notified and will be attending to the problem right away.</p>
                <p>
                    &nbsp;</p>
                <p>
                    &nbsp;</p>
            </td>
        </tr>
    </table>
</asp:Content>
