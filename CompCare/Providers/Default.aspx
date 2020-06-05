<%@ Page Title="Welcome to the CompCare Wellness Provider portal" Language="C#" MasterPageFile="~/Providers/ProvidersNMP.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CompCareWebsite.Providers.Default" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <table cellpadding="0" cellspacing="0" style="width: 939px">
        <tr>
            <td class="providerHomeIntro" valign="top">
                <h1>
                    Welcome to the CompCare Wellness Medical Scheme Provider Area</h1>
                <p style="width:80%">
                    To validate a patient&#39;s membership to any of the CompCare options, please 
                    complete the fields in the adjacent form and hit submit.</p>
            </td>
            <td style="width: 29px">
                &nbsp;
            </td>
            <td style="width: 330px" valign="top" class="roundedRightColumn">
                <h1>
                    Validate a Member</h1>
                <table cellpadding="5" cellspacing="0" style="width:300px">
                    <tr>
                        <td colspan="2"><asp:Label ID="lblError" runat="server" ForeColor="Red" /></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:Label runat="server" ID="lblName">Membership Number:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbMembershipNumber" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:Label runat="server" ID="lblSurname">Date Of Birth:</asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbDateOfBirth" runat="server"></asp:TextBox>
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:CalendarExtender ID="tbDateOfBirth_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="tbDateOfBirth" Format="yyyy/MM/dd">
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" colspan="2"><i>Please note member information is subject to change.  For 
                            further details please contact our Call Centre on <strong>011 208 1010</strong></i>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: right">
                            <asp:Button ID="btnSubmit" Text="Submit" runat="server" 
                                CssClass="normalButtons" onclick="btnSubmit_Click" />&nbsp;
                            </td>
                    </tr>
                </table>
                <br />
            </td>
            <td style="width:20px;"></td>
        </tr>
    </table>
</asp:Content>
