<%@ Page Title="StudentPlan: Welcome" Language="C#" MasterPageFile="~/StudentPlanNMP.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CompCareWebsite.StudentPlan.Default" %>
<asp:Content ID="Body" ContentPlaceHolderID="bodyText" runat="server">
    <table cellpadding="5" cellspacing="0" style="width:100%">
        <tr>
            <td colspan="3">
                <h1>Welcome to the CompCare Wellness NetworX option for students Website</h1>
                <p class="radialShadow">&nbsp;</p>
            </td>
        </tr>
        <tr>
            <td style="text-align:left">
                
                <p class="bluetext">If you are a young, dynamic student looking for reliable medical cover that won’t empty your wallet then you have come to the right place. </p>
                <p>Say hello to the NetworX option from CompCare. NetworX has been specifically designed for young, busy people and offers essential cover within a contracted provider network for in and out-of-hospital services. What’s more it is the most affordable option on the South African medical schemes market and that’s a fact.</p>
                <p class="blueText3">Special Features</p>
                <ul>
                    <li>Private hospital cover.</li>
                    <li>Unlimited GP consultations within the Universal Provider Network.</li>
                    <li>Acute and chronic medication.</li>
                    <li>Basic dentistry.</li>
                    <li>Optometry.</li>
                    <li>Radiology.</li>
                    <li>Pathology.</li>
                    <li>Specialist consultations.</li>
                    <li>Hospital emergency room/ casualty emergency visits.</li>
                </ul>
                <p style="text-align: justify">
                    &nbsp;</p>
                <p style="text-align: justify">
                    &nbsp;</p>
            </td>
            <td>&nbsp;</td>
            <td style="width:330px; height:425px; background-image:url(Images/roundedRightColumn.png); background-repeat:no-repeat" valign="top">
                <div style="width:290px; margin-top:20px; margin-left:20px">
                    <h1>&raquo;&nbsp; Login to the Website</h1>
                <asp:Login runat="server" ID="loginMain" LoginButtonStyle-CssClass="normalButtons" 
                        CreateUserText="&raquo; Register" CreateUserUrl="Register.aspx" 
                        PasswordRecoveryText="&raquo; Forgot Password" 
                        PasswordRecoveryUrl="ForgotPassword.aspx" TitleText="" 
                        onauthenticate="loginMain_Authenticate" CssClass="loginStyle">
                        <TextBoxStyle CssClass="loginTextBox" /> 
                    <InstructionTextStyle Font-Overline="True" /> 
                    <LabelStyle CssClass="loginLabel" /> 
                    <TitleTextStyle CssClass="loginTitle" /> 

                        </asp:Login>
                </div>
            </td>
        </tr>
    </table>

</asp:Content>
<asp:Content ID="Content1" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
   
    <img alt="" src="Images/homeFlash.jpg" style="width: 979px; height: 359px" />
</asp:Content>

