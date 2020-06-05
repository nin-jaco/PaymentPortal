<%@ Page Title="Welcome to the Compcare Wellness Broker Area" Language="C#" MasterPageFile="~/Brokers/BrokersNMP.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CompCareWebsite.Brokers.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
    <style type="text/css">
        .style1
        {
            color: #666666;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <table cellpadding="0" cellspacing="0" style="width: 939px">
        <tr>
            <td class="brokerHomeIntro" valign="top">
               <h1>Welcome to the CompCare Wellness Broker Area</h1> 
               <p>
                   New functionality will be launched in the near future that will allow you to to view
                   the details we have on record for you as well as your client&#39;s claims and statements.
               </p>
                <p>
                    If you are not already a registered
                   CompCare Wellness <br />intermediary and would like to sign up, <a href="../Downloads/CompCareWellnessBrokerAgreementApplicationForm.pdf"
                       target="_blank">please click here</a>.
               </p>
            </td>
            <td style="width:29px">&nbsp;</td>
            <td style="width: 330px" valign="top" class="roundedRightColumn">
                <h1>&raquo; 
                    Interested in Becoming a Broker?</h1>
                    <p class="style1"><em>Submit your details in the form below:</em></p>
                <table cellpadding="5" cellspacing="0">
                    <tr>
                        <td valign="bottom" colspan="2"><asp:Label ID="lblStatus" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            <asp:Label runat="server" ID="lblName">Name:</asp:Label>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbName" ErrorMessage="Required Field" ForeColor="Red" />
                            <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            <asp:Label runat="server" ID="lblSurname">Surname:</asp:Label>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbSurname" ErrorMessage="Required field" ForeColor="Red" />
                            <asp:TextBox ID="tbSurname" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            <asp:Label runat="server" ID="Label1">Telephone:</asp:Label>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbTelephone" ErrorMessage="Required field" ForeColor="Red" />
                            <asp:TextBox ID="tbTelephone" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            <asp:Label runat="server" ID="Label2">Email:</asp:Label>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbEmail" ErrorMessage="Required field" ForeColor="Red" />
                            <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            Accreditation No:</td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbAccreditationNo" ErrorMessage="Required field" ForeColor="Red" />
                            <asp:TextBox ID="tbAccreditationNo" runat="server"></asp:TextBox>
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
            <td style="width:20px;"></td>
        </tr>
    </table>
</asp:Content>
