<%@ Page Title="Welcome to Compcare Wellness" Language="C#" MasterPageFile="~/HomeNMP.master"
    AutoEventWireup="true" CodeBehind="WelcomeNote.aspx.cs" Inherits="CompCareWebsite.WelcomeNote" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageSubNav" runat="server">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <a href="NewMembers/Default.aspx">
                    <img src="Images/cc_r5_c5_s1.jpg" alt="Visit the New Members Section" class="borderless" /></a>
            </td>
            <td>
                <a href="ExistingMembers/Default.aspx">
                    <img src="Images/cc_r5_c7_s1.jpg" alt="Visit the Members Section" class="borderless" /></a>
            </td>
            <td>
                <a href="Brokers/Default.aspx">
                    <img src="Images/cc_r5_c10_s1.jpg" alt="Visit the CompCare Brokers Section" class="borderless" /></a>
            </td>
            <td>
                <a href="Providers/Default.aspx">
                    <img src="Images/cc_r5_c13_s1.jpg" alt="Visit the CompCare Providers Section" class="borderless" /></a>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <table cellpadding="0" cellspacing="0" style="text-align:justify; width:979px; padding:20px">
        <tr>
            <td>
                <h1>
                    Welcome to the CompCare Wellness Website</h1>
                <p>
                    Welcome to the official website of CompCare Wellness Medical Scheme.</p>
                <p>
                    This site is designed to provide Members and Healthcare Providers with up to date
                    information about CompCare Wellness. Feel free to browse our site.</p>
                <p>
                    If you are a member, don´t forget to visit our online customer care service in the
                    Member Login Section.</p>
                <p>
                    The On-line inquiries section allows full, unlimited access to view and amend your
                    membership status with CompCare Wellness as well as inquiry facilities to view claims
                    in progress, claim payment history and conduct a search for doctors.</p>
            </td>
        </tr>
    </table>
</asp:Content>
