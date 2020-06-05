<%@ Page Title="Compcare Wellness: Membership Cards" Language="C#" MasterPageFile="~/ExistingMembers/EMembersNMP.master"
    AutoEventWireup="true" CodeBehind="MembershipCards.aspx.cs" Inherits="CompCare.ExistingMembers.MembershipCards" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageSubNav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <h1>Membership Cards</h1>
    <br />
    <p class="radialShadow">&nbsp;</p>
    <table cellpadding="0" cellspacing="0" style="width: 939px">
        <tr>
            <td class="nopicHomeIntro" valign="top">
                <p>
                    On joining, members receive a single membership card if single or two membership
                    cards if married. Additional cards can be issued on request. </p>
               <p>     
                    To obtain additional
                    or replacement cards,</p>
               <ul>
                    <li>e-mail us: <a href="mailto:lydia.tlhabanyane@universal.co.za">lydia.tlhabanyane@universal.co.za</a> </li>
                    <li>fax us: (011) 803-7847</li>
                    <li>or mail us: Private Bag X49, Rivonia, 2128</li>
               </ul>   
            </td>
            <td style="width: 29px">
                &nbsp;
            </td>
            <td style="width: 330px" valign="top" class="roundedRightColumn">
                <h1>&raquo; 
                    Request an Additional or 
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Replacement Card...</h1>
                <table cellpadding="5" cellspacing="0">
                    <tr>
                        <td colspan="2"><asp:Label ID="lblError" runat="server" ForeColor="Red" /></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Membership Number:</td>
                        <td><asp:TextBox runat="server" ID="tbMembershipNumber" Width="120px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td valign="top">Required For (Dependant):
                            </td>
                        <td>
                            <asp:TextBox runat="server" ID="tbRequiredFor" Width="120px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            &nbsp;&nbsp;
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: right">
                            <asp:Button ID="btSubmit" Text="Submit" runat="server" CssClass="normalButtons" 
                                onclick="btSubmit_Click" />&nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
                <br />
            </td>
            <td style="width: 20px;">
            </td>
        </tr>
    </table>
</asp:Content>
