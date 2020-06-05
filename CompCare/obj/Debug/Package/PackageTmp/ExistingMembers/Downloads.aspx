<%@ Page Title="Compcare Wellness: Member Downloads" Language="C#" MasterPageFile="~/ExistingMembers/EMembersNMP.master"
    AutoEventWireup="true" CodeBehind="Downloads.aspx.cs" Inherits="CompCare.ExistingMembers.Downloads" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageSubNav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <h1>
        Downloads</h1>
    <br />
    <p class="radialShadow">
        &nbsp;</p>
    <p>
        All of the downloads in this section have been made available on this page.
        <br />
        For assistance or queries relating to your membership please contact our Call Centre
        at<strong> +27(0)11 208 1000</strong></p>
    <table cellspacing="0" align="center">
        <thead>
            <tr>
                <th class="on">
                    Type
                </th>
                <th style="width:300px">
                    Link
                </th>
            </tr>
        </thead>
        <tbody class="priceBody">
            
            <tr>
                <td class="on">
                    <img src="../Images/pdfIcon.png" alt="" />
                </td>
                <td style="width:300px">
                    <a href="../Downloads/CompCareWellnessBooklet.pdf" target="_blank">&raquo; Membership Booklet</a>
                </td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td class="on">
                    &nbsp;
                </td>
                <td style="width:300px">
                    &nbsp;
                </td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
