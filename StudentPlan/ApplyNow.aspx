<%@ Page Title="StudentPlan: Apply Now" Language="C#" MasterPageFile="~/StudentPlanNMP.master" AutoEventWireup="true" CodeBehind="ApplyNow.aspx.cs" Inherits="CompCareWebsite.StudentPlan.ApplyNow" %>
<asp:Content ID="body" ContentPlaceHolderID="bodyText" runat="server">
    <table cellpadding="5" cellspacing="0" style="width:100%">
        <tr>
            <td colspan="2">
                <h1>Apply Now to become a member of CompCare Wellness StudentPlan</h1>
                <p class="radialShadow">&nbsp;</p>
            </td>
        </tr>
        <tr>
            <td style="text-align:left" valign="top">               
                <p class="bluetextbold">As easy as 1, 2, 3...</p>
                <p style="text-align: justify">
                    <strong><span class="style1"><img src="Images/1.jpg" style="float:left; margin-right:10px;" /></span> Manual submission</strong></p>
                <br />
                <ol style="text-align: justify">
                    <li><a href="DownloadForm.aspx" title="Download the CompCare Student Application Form">
                        Download the application form</a></li>
                    <li>Complete the application form</li>
                    <li>Then simply fax the form to +27(0) 86 505 7466&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </li>
                    <li>Keep an eye on your mailbox for a reply from CompCare.</li>
                </ol>
                <p>
                    &nbsp;</p>
                <p>
                    <span class="style1"><strong>
                        <img src="Images/2.jpg" style="float:left; margin-right:10px"/></strong></span> 
                    <strong>Online submission</strong></p>
                        <p> Complete the <a href="PreliminaryQuestions.aspx">online application form</a></p>
                <p>
                    &nbsp;</p>
        </td>
        <td>
            <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="roundedRightColumn" style="width:330px">
                            <h2><span class="style1"><strong><img src="Images/3.png" style="float:left; margin-right:10px" /></strong></span> Let us call you </h2>
                            <table cellpadding="5" cellspacing="0" width="250px">
                                <tr>
                                    <td colspan="2">Provide us with your contact details in the short form here below and we will call you.</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="lblStatus" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="bottom">
                                        <asp:Label runat="server" ID="lblName">Name:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name Empty" ControlToValidate="tbName" ForeColor="Red"></asp:RequiredFieldValidator><br />
                                        <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="bottom">
                                        <asp:Label runat="server" ID="lblSurname">Surname:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Surname Empty"
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
                                            ControlToValidate="tbEmail" ValidationExpression="^([\w\-\.]+)@((\[([0-9]{1,3}\.){3}[0-9]{1,3}\])|(([\w\-]+\.)+)([a-zA-Z]{2,4}))$"
                                            ForeColor="Red"></asp:RegularExpressionValidator><br />
                                        <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="bottom">
                                        <asp:Label runat="server" ID="lblNumber">Contact Number:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Not a valid format +27721231234 / 0123456789"
                                ValidationExpression="^((?:\+27|27)|0)(\d{2})(\d{7})$" ControlToValidate="tbNumber"
                                ForeColor="Red"></asp:RegularExpressionValidator><br />
                                        <asp:TextBox ID="tbNumber" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: right">
                                        <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click"
                                            CssClass="normalButtons" />&nbsp;
                                        </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
        </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
        <img alt="" src="Images/applynowFlash.jpg" 
            style="width: 979px; height: 359px" />
</asp:Content>

<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="CustomPageScript">
    <style type="text/css">
        .style1
        {
            font-size: 25px;
            color: #3366CC;
        }
    </style>
</asp:Content>


