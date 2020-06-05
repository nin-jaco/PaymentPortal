<%@ Page Title="Compcare Wellness: Update Banking Details" Language="C#" MasterPageFile="~/ExistingMembers/EMembersNMP.master"
    AutoEventWireup="true" CodeBehind="UpdateBankingDetails.aspx.cs" Inherits="CompCare.ExistingMembers.UpdateBankingDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageSubNav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <h1>Update your Banking Details</h1>
    <br />
    <p class="radialShadow">&nbsp;</p>
    <p>Update your banking details to </p>
    <ul>
        <li>conveniently pay contributions by debit order,</li>
        <li>pay both contributions and members' portions by debit order, and</li>
        <li>conveniently receive your claims refunds straight into your bank account.</li>
    </ul>
    <p>Download the following form and post it to:</p>
    <p style="margin-left:25px"><strong>Private Bag X41<br />
        Rivonia<br />
        2128
     </strong>
     </p>
    <table cellspacing="0" align="center">
        <thead>
            <tr>
                <th class="on">Type</th>
                <th style="width:300px">Link</th>
            </tr>
        </thead>
        <tbody class="priceBody">
            <tr>
                <td class="on"><img src="../Images/pdfIcon.png" alt="" /></td>
                <td style="width:300px"><a href="../Downloads/CompCareWellnessPersonalBankingDetails.pdf" target="_blank">&raquo; Personal Banking Details Form</a></td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td class="on"></td>
                <td style="width:300px"></td>
            </tr>
        </tfoot>
    </table>
    <p>
        <em><strong>Please Note</strong>: For security reasons, the Scheme can only accept the original Electronic
        Funds Transfer form and not faxed or emailed versions. </em>
    </p>
</asp:Content>
