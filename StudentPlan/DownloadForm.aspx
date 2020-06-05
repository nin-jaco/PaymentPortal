<%@ Page Title="" Language="C#" MasterPageFile="~/StudentPlanNMP.master" AutoEventWireup="true" CodeBehind="DownloadForm.aspx.cs" Inherits="StudentPlan.DownloadForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CustomPageScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <img alt="" src="Images/applynowFlash.jpg" 
            style="width: 979px; height: 359px" /></p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyText" runat="server">
    <table cellpadding="5" cellspacing="0" style="width:100%">
        <tr>
            <td colspan="2">
                <h1>Download the CompCare Wellness StudentPlan Application Form</h1>
                <p class="radialShadow">&nbsp;</p>
            </td>
        </tr>
        <tr>
            <td style="text-align:left" valign="top"> 
                <table cellpadding="10" cellspacing="0">
                    <tr>
                        <td>Please tell us which institution you will be studying at</td>
                        <td><asp:ListBox runat="server" ID="lbStudyInstitution" Rows="1" 
                                DataTextField="InstitutionName" DataValueField="IdInstitution" 
                                onselectedindexchanged="lbStudyInstitution_SelectedIndexChanged" AutoPostBack="true" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height:50px">&nbsp;</td>
                    </tr>
                </table>              
            </td>
        </tr>
    </table>
</asp:Content>
