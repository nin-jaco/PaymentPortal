<%@ Page Title="Welcome to Compcare Wellness Medical Scheme" Language="C#" MasterPageFile="~/TheScheme/SchemeNMP.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CompCareWebsite.TheScheme.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <table cellpadding="0" cellspacing="0" style="width: 939px">
        <tr>
            <td class="schemeHomeIntro" valign="top">
                <h1>
                    About CompCare Wellness Medical Scheme</h1>
                <p>
                    CompCare Wellness Medical Scheme ('CompCare Wellness') was formed on 1 January 2008
                    as the result of a merger of CompCare Medical Scheme, CIMAS Wellness Medical Scheme
                    and Lifemed Medical Scheme.</p>
                <p> CompCare Wellness offers a wide range of benefit options
                    to its members, from primary healthcare and hospital options, to traditional and
                    new generation options. Some of these products also cater for the member's own medical
                    savings account.
                </p>
            </td>
            <td style="width: 29px">
                &nbsp;
            </td>
            <td style="width: 330px" valign="top" class="roundedRightColumn">
                <h1>
                    Join Now!</h1>
                <table cellpadding="5" cellspacing="0">
                    <tr>
                        <td colspan="2"><asp:Label runat="server" ID="lblStatus" /></td>                        
                    </tr>
                    <tr>
                        <td valign="bottom">
                            <asp:Label runat="server" ID="lblName">Name:</asp:Label>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name field may not be empty" ControlToValidate="tbName" ForeColor="Red"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            
                            <asp:Label runat="server" ID="lblSurname">Surname:</asp:Label>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Surname field may not be empty"
                                ControlToValidate="tbSurname" ForeColor="Red"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbSurname" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            <asp:Label runat="server" ID="lblEmail">Email:</asp:Label>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Not a valid email address"
                                ControlToValidate="tbEmail" ValidationExpression="^([\w\-\.]+)@((\[([0-9]{1,3}\.){3}[0-9]{1,3}\])|(([\w\-]+\.)+)([a-zA-Z]{2,4}))$" ForeColor="Red"></asp:RegularExpressionValidator><br />
                            <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            <asp:Label runat="server" ID="lblNumber">Contact Number:</asp:Label>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Not a valid telephone number"
                                ValidationExpression="(^\([0]\d{2}\))(\d{6,7}$)" ControlToValidate="tbNumber"
                                ForeColor="Red"></asp:RegularExpressionValidator><br />
                            <asp:TextBox ID="tbNumber" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblQuery" runat="server">Option:</asp:Label>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lbOptions" ErrorMessage="Please select an option" ForeColor="Red" />
                            <asp:DropDownList ID="lbOptions" runat="server">
                                <asp:ListItem Text="Please select.." Value=""></asp:ListItem>
                                <asp:ListItem Text="Pinnacle" Value="Pinnacle"></asp:ListItem>
                                <asp:ListItem Text="Dynamix" Value="Dynamix"></asp:ListItem>
                                <asp:ListItem Text="Symmetry" Value="Symmetry"></asp:ListItem>
                                <asp:ListItem Text="Axis" Value="Axis"></asp:ListItem>
                                <asp:ListItem Text="Mumed" Value="Mumed"></asp:ListItem>
                                <asp:ListItem Text="Networx" Value="Networx"></asp:ListItem>
                                <asp:ListItem Text="All" Value="All"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
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
            <td style="width: 20px;">
            </td>
        </tr>
    </table>
</asp:Content>
