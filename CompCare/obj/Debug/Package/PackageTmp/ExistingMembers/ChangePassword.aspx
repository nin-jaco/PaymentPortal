<%@ Page Title="Compcare Wellness: Change Password" Language="C#" MasterPageFile="~/ExistingMembers/LoggedInNMP.master"
    AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="CompCare.ExistingMembers.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageBody" runat="server">
    <table cellpadding="5" cellspacing="0">
        <tr>
            <td style="width: 20px">
                &nbsp;
            </td>
            <td style="width: 100%; text-align: left">
                <h3>
                    Change your Password</h3>
                <div class="radialShadow" style="width: 100%; height: 15px">
                </div>
                <h5>
                    Change 
                    Login Credentials</h5>
                <table cellpadding="5" cellspacing="5">
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblStatus" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:200px">
                            Old Password:
                        </td>
                        <td class="otherRows">
                            <b>
                                <asp:TextBox runat="server" ID="tbOldPassword" TextMode="Password" /></b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            New Password
                        </td>
                        <td class="otherRows">
                            <asp:TextBox ID="tbNewPassword" runat="server" TextMode="Password" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Confirm New Password:
                        </td>
                        <td class="otherRows">
                            <b>
                                <asp:TextBox runat="server" ID="tbConfirmPassword" TextMode="Password" /></b>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:right"><asp:Button runat="server" ID="btnSubmit" 
                                Text="Submit" CssClass="normalButtons" onclick="btnSubmit_Click" /></td>
                    </tr>
                </table>
            </td>
            <td style="width: 20px">
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
