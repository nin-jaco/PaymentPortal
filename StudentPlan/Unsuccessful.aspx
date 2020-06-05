<%@ Page Title="StudentPlan: Online Application Form" Language="C#" MasterPageFile="~/StudentPlanNMP.master" AutoEventWireup="true" CodeBehind="Unsuccessful.aspx.cs" Inherits="StudentPlan.Unsuccessful" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CustomPageScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyText" runat="server">
    <h1>Online Application Form for membership on the CompCare Wellness NetworX Option</h1>
                <p class="radialShadow">&nbsp;</p>
    <table cellpadding="5" cellspacing="0" style="width:100%">
        <tr>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x">&nbsp;</td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x">
                <img src="Images/step4.png" alt="Step 4" /></td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x"><h3 style="color:White; vertical-align:top">Your application has been 
                unsuccessful</h3></td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x"></td>
        </tr>
    </table>
    <p>Your request has been unsuccessfully processed.&nbsp; Please direct any 
        queries to <a href="mailto:webmaster@universal.co.za">webmaster@universal.co.za</a>.</p>
        <table cellpadding="5" cellspacing="0" align="center">
                    <tr>
                        <td>Status:</td>
                        <td>NOT APPROVED</td>
                    </tr>
                    <tr>
                        <td>Reason:</td>
                        <td><asp:Label runat="server" ID="lblReason" /></td>
                    </tr>
                    <tr>
                        <td>Reference Number:</td>
                        <td><asp:Label runat="server" ID="lblReferenceNumber" /></td>
                    </tr>
                    <tr>
                        <td>Authorisation Number:</td>
                        <td><asp:Label runat="server" ID="lblAuthorisationNumber" /></td>
                    </tr>
                    <tr>
                        <td>Card Holder Name:</td>
                        <td><asp:Label runat="server" ID="lblCardHolderName" /></td>
                    </tr>
                    <tr>
                        <td>Amount:</td>
                        <td><asp:Label runat="server" ID="lblAmount" /></td>
                    </tr>
                    <tr>
                        <td>Card Type:</td>
                        <td><asp:Label runat="server" ID="lblCartType" /></td>
                    </tr>
                    <tr>
                        <td>Description of Goods:</td>
                        <td><asp:Label runat="server" ID="lblDescriptionOfGoods" /></td>
                    </tr>
                    <tr>
                        <td>Card Holder Email Address:</td>
                        <td><asp:Label runat="server" ID="lblCardHolderEmail" /></td>
                    </tr>
                    <tr>
                        <td>Masked Card Number:</td>
                        <td><asp:Label runat="server" ID="lblMaskedCardNumber" /></td>
                    </tr>
                </table>
</asp:Content>
