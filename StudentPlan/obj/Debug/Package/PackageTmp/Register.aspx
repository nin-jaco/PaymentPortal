<%@ Page Title="" Language="C#" MasterPageFile="~/StudentPlanNMP.master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="StudentPlan.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="bodyText" runat="server">
    <table cellpadding="0" cellspacing="0" style="width: 939px">
        <tr>
            <td>
                <h1>
                    Register User</h1>
                <p class="radialShadow">&nbsp;</p>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>Are you a:
                            <asp:RadioButtonList runat="server" ID="rblType" AutoPostBack="true" 
                                onselectedindexchanged="rblType_SelectedIndexChanged">
                                <asp:ListItem Text="Training Institution" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Student" Value="2" ></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="divStudentRegistration" runat="server">
                                <h5>
                                    Please complete the following form:</h5>
                                <asp:Label ID="lblError" ForeColor="Red" runat="server" /><br />
                                <asp:Label ID="lblSuccess" CssClass="successText" runat="server" />
                                <table cellpadding="5" cellspacing="5">
                                    <tr>
                                        <td>
                                            ID/ Passport Number
                                        </td>
                                        <td class="otherRows">
                                            <asp:Label ID="lblIdNumber" runat="server" ForeColor="Red"></asp:Label><br />
                                            <asp:TextBox runat="server" ID="tbIdNumber" />
                                        </td>
                                    </tr>
                                    <tr runat="server" id="trEmail">
                                        <td>
                                            Email
                                        </td>
                                        <td class="otherRows">
                                            <b>
                                                <asp:TextBox runat="server" ID="tbEmail" />
                                            </b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Username:
                                        </td>
                                        <td class="otherRows">
                                            <b>
                                                <asp:TextBox runat="server" ID="tbUsername" />
                                            </b>
                                        </td>
                                    </tr>
                                    <tr runat="server" id="trPsword">
                                        <td>
                                            Password:
                                        </td>
                                        <td class="otherRows">
                                            <asp:textBox ID="tbPassword" runat="server" TextMode="Password"  />
                                        </td>
                                    </tr>
                                    <tr runat="server" id="trPsword2">
                                        <td valign="top">
                                            Confirm Password:
                                        </td>
                                        <td class="otherRows">
                                            <asp:TextBox runat="server" ID="tbConfirmPassword" TextMode="Password" />
                                        </td>
                                    </tr>
                                    <tr runat="server" id="trButton">
                                        <td colspan="2" style="text-align:right"><asp:Button runat="server" ID="btnSubmit" 
                                                Text="Submit" CssClass="normalButtons" onclick="btnSubmit_Click" /></td>
                                    </tr>
                                </table>
                            </div>
                            <div runat="server" id="divInstitution">
                                
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
        <img alt="" src="Images/applynowFlash.jpg" 
            style="width: 979px; height: 359px" />
</asp:Content>

