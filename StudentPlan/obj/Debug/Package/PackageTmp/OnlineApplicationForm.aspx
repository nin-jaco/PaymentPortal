<%@ Page Title="StudentPlan: Online Application Form" Language="C#" MasterPageFile="~/StudentPlanNMP.master" AutoEventWireup="true" CodeBehind="OnlineApplicationForm.aspx.cs" Inherits="StudentPlan.OnlineApplicationForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="scripts" ContentPlaceHolderID="CustomPageScript" runat="server">
    <script type="text/javascript">
        function BlockUI(elementID) {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(function () {
                $("#" + elementID).block({ message: '<table align = "center"><tr><td>' + '<img src="images/loadingAnim.gif"/></td></tr></table>',
                    css: {},
                    overlayCSS: { backgroundColor: '#000000', opacity: 0.6
                    }
                });
            });
            prm.add_endRequest(function () {
                $("#" + elementID).unblock();
            });
        }
        $(document).ready(function () {

            BlockUI("dvgv");
            $.blockUI.defaults.css = {};
        });
        function Hidepopup() {
            $find("popup").hide();
            return false;
        }
        function onCalendarHidden(sender, args) 
        {
            var now = new Date();
            var birthDate = new Date(sender.get_selectedDate());
            var mm = birthDate.getMonth() + 1;
            var yy = birthDate.getFullYear();
            var dd = birthDate.getDate();
            bDay = dd + "/" + mm + "/" + yy;
            bD = bDay.split('/');
            if (bD.length == 3) 
            {
                born = new Date(bD[2], bD[1] * 1 - 1, bD[0]);
                years = Math.floor((now.getTime() - born.getTime()) / (365.25 * 24 * 60 * 60 * 1000));
            }
            document.getElementById('body_bodyText_ages').value = years;
        }

    </script>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
       
        </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="bodyText" runat="server">
    <h1>Online Application Form for membership on the CompCare Wellness NetworX Option</h1>
                <p class="radialShadow">&nbsp;</p>
    <table cellpadding="5" cellspacing="0" style="width:100%">
        <tr>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x">&nbsp;</td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x">
                <img src="Images/step2.png" alt="Step 2" /></td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x"><h3 class="formHeading">Complete the Application Form</h3></td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x"></td>
        </tr>
        <tr>
            <td colspan="4">
                <table cellpadding="10" cellspacing="0" style="width:100%; text-align:left">
                    <tr>
                        <td colspan="5"><asp:Label ID="lblError" runat="server" ForeColor="Red" /><asp:HiddenField runat="server" ID="hfIsExisting" />
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:HiddenField runat="server" ID="hfGettingIncome" /><asp:HiddenField runat="server" ID="hfIsSaNational" />
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Please fix the following errors:" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" class="blueBack">Membership</td>
                    </tr>
                    <tr>
                        <td>Are you:</td>
                        <td colspan="4" style="text-align:left">
                            <asp:RadioButtonList runat="server" ID="rblExisting" AutoPostBack="true" 
                                onselectedindexchanged="rblExisting_SelectedIndexChanged">
                                <asp:ListItem Value="extension" Text="Currently a member of CompCare Wellness and want to renew your membership for 2012."></asp:ListItem>
                                <asp:ListItem Value="new" Text="Submitting a new application." Selected="True"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr id="trExistingMembership" runat="server">
                        <td><span class="style1">*</span><asp:Label runat="server" ID="lblExistingMembershipNumber" Text="Membership Number:" /></td>
                        <td colspan="4">
                            <asp:TextBox ID="tbExistingMembershipNumber" runat="server" MaxLength="13" />
                            
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" class="blueBack">Cover Period</td>
                    </tr>
                    <tr>
                        <td colspan="5">Please note that this application can only be processed if the period of study is longer than 
                            <strong>6 months</strong>.</td>
                    </tr>
                    <tr>
                        <td><span class="style1">*</span>Date of Commencement:</td>
                        <td class="style2">
                            <asp:ListBox runat="server" ID="lbStartMonth" Rows="1" />
                            <asp:ListBox runat="server" ID="lbStartYear" Rows="1" />
                        </td>
                        <td>&nbsp;</td>
                        <td class="style3"><span class="style1">*</span>End Date:</td>
                        <td><asp:ListBox runat="server" ID="lbEndMonth" Rows="1" />
                            <asp:ListBox runat="server" ID="lbEndYear" Rows="1" /></td>
                    </tr>
                    <tr>
                        <td colspan="5" class="blueBack">Study Particulars</td>
                    </tr>
                    <tr>
                        <td><span class="style1">*</span>Study Institution:</td>
                        <td class="style2"><asp:ListBox runat="server" ID="lbStudyInstitution" Rows="1" DataTextField="InstitutionName" DataValueField="IdInstitution" /></td>
                        <td></td>
                        <td class="style3">Student Number (if available):</td>
                        <td><asp:TextBox runat="server" ID="studentNumber" Width="200" MaxLength="50" />

                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" class="blueBack">Personal Particulars</td>
                    </tr>
                    <tr>
                        <td style="width:150px; text-align:left"><span class="style1">*</span>Surname:</td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfValSurname" runat="server" ErrorMessage="Please enter your Surname" ForeColor="Red" ControlToValidate="surname"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox runat="server" ID="surname" Width="200" MaxLength="50" AutoPostBack="true" />
                        </td>
                        <td></td>
                        <td><span class="style1">*</span>First Name(s):</td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfValNames" runat="server" ErrorMessage="Please enter your Name(s)" ForeColor="Red" ControlToValidate="firstNames"></asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox runat="server" ID="firstNames" Width="200px" MaxLength="50" AutoPostBack="true" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:left">Title:</td>
                        <td class="style2"><asp:ListBox runat="server" Rows="1" ID="lbTitles" DataTextField="TitleAbbreviation" DataValueField="IdTitle" /></td>
                        <td></td>
                        <td class="style3">Marital Status:</td>
                        <td><asp:ListBox runat="server" Rows="1" ID="lbMaritalStatus" DataTextField="Description" DataValueField="IdMaritalStatus" >
                        </asp:ListBox></td>
                    </tr>
                    <tr>
                        <td style="text-align:left"><span class="style1">*</span>Date of Birth:</td>
                        <td class="style2">
                            <asp:RequiredFieldValidator ID="rfValDOB" runat="server" ForeColor="Red" ControlToValidate="DateOfBirth" ErrorMessage="Please enter your Date of Birth"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="valDOB" runat="server" EnableClientScript="false" ErrorMessage="Please enter a valid date. Format yyyy/MM/dd" ForeColor="Red" 
                                ControlToValidate="DateOfBirth" onservervalidate="valDOB_ServerValidate"></asp:CustomValidator><br /><asp:TextBox runat="server" ID="DateOfBirth" />
                            <asp:CalendarExtender ID="DateOfBirth_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="DateOfBirth" OnClientHidden="onCalendarHidden" Format="yyyy/MM/dd">
                            </asp:CalendarExtender>
                            
                        </td>
                        <td></td>
                        <td class="style3">Present Age:</td>
                        <td><input type="text" id="ages" disabled="disabled" runat="server"  /></td>
                    </tr>
                    <tr>
                        <td style="text-align:left"><span class="style1">*</span><asp:Label ID="lblIdPassport" runat="server" /></td>
                        <td class="style2"><asp:RequiredFieldValidator ID="rfValIdNumber" runat="server" ForeColor="Red" ControlToValidate="tbIdNumber" ErrorMessage="Please provide your Id/Passport Number"></asp:RequiredFieldValidator><br /><asp:TextBox runat="server" ID="tbIdNumber" Width="200px" MaxLength="15" /></td>
                        <td></td>
                        <td class="style3">Country of Issue:</td>
                        <td><asp:ListBox runat="server" ID="lbCountryOfIssue" Rows="1" DataTextField="Name" DataValueField="IdCountry" /></td>
                    </tr>
                    <%--<tr>
                        <td style="text-align:left">Country of Origin:</td>
                        <td><asp:TextBox runat="server" ID="CountryOrigin" Width="200px" /></td>
                        <td></td>
                        <td>Embassy:</td>
                        <td><asp:TextBox runat="server" ID="Embassy" Width="200px" /></td>
                    </tr>--%>
                    <tr>
                        <td style="text-align:left">&nbsp;</td>
                        <td class="style2">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td class="style3">Gender:</td>
                        <td><asp:ListBox runat="server" ID="listbGenders" Rows="1">
                            <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                        </asp:ListBox></td>
                    </tr>
                    <tr>
                        <td colspan="4"><asp:Label ID="lbIncome" runat="server" /></td>
                        <td><asp:RadioButtonList runat="server" ID="rblGettingIncome" 
                                    onselectedindexchanged="rblGettingIncome_SelectedIndexChanged" AutoPostBack="true" RepeatDirection="Horizontal" >
                                    <asp:ListItem Text="yes" Value="yes" Selected="False"></asp:ListItem>
                                    <asp:ListItem Text="no" Value="no" Selected="true"></asp:ListItem>
                                </asp:RadioButtonList>
                        
                        </td>
                    </tr>
                    <tr id="trIncomeAmount" runat="server">
                        <td colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Please specify approximate amount</td>
                        <td><asp:CustomValidator runat="server" ID="valGrossIncome" 
                                ControlToValidate="GrossIncome" ErrorMessage="Not a valid amount" 
                                ForeColor="Red" onservervalidate="valGrossIncome_ServerValidate"></asp:CustomValidator>
                            <br />R<asp:TextBox runat="server" ID="GrossIncome" Width="200px" /></td>
                    </tr>
                    <tr>
                        <td colspan="5"><hr /></td>
                    </tr>
                    <tr>
                        <td colspan="5">Please provide your South African Physical and Postal Address.</td>
                    </tr>
                    <tr>
                        <td style="text-align:left" colspan="2"><strong>Physical Address:</strong></td>
                        <td></td>
                        <td colspan="2"><strong>Postal Address:</strong></td>
                    </tr>
                    <tr>
                        <td><span class="style1">*</span>Address Line 1:</td>
                        <td class="style2"><asp:RequiredFieldValidator ID="frValpaddress1" runat="server" ErrorMessage="Physical Address; Street Address Required" ForeColor="Red" ControlToValidate="Paddress1"></asp:RequiredFieldValidator><br /><asp:TextBox runat="server" ID="PAddress1" Width="200" MaxLength="50" />
                        </td>
                        <td></td>
                        <td class="style3">Address Line 1:</td>
                        <td><asp:TextBox runat="server" ID="OAddress1" Width="200" MaxLength="50" /></td>
                    </tr>
                    <tr>
                        <td style="text-align:left">Address Line 2</td>
                        <td class="style2"><asp:TextBox runat="server" ID="PAddress2" Width="200" MaxLength="50" /></td>
                        <td></td>
                        <td class="style3">Address Line 2:</td>
                        <td><asp:TextBox runat="server" ID="OAddress2" Width="200" MaxLength="50" /></td>
                    </tr>
                    <tr>
                        <td style="text-align:left">Suburb:</td>
                        <td class="style2"><asp:TextBox runat="server" ID="PAddress3" Width="200" MaxLength="50" /></td>
                        <td>&nbsp;</td>
                        <td class="style3">Suburb:</td>
                        <td><asp:TextBox runat="server" ID="OAddress3" Width="200" MaxLength="50" /></td>
                    </tr>
                    <tr>
                        <td style="text-align:left"><span class="style1">*</span>City:</td>
                        <td class="style2"><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ErrorMessage="Physical Addres; City Field is Required" ControlToValidate="PAddress4" ForeColor="Red"></asp:RequiredFieldValidator><br /><asp:TextBox runat="server" ID="PAddress4" Width="200" MaxLength="50" /></td>
                        <td>&nbsp;</td>
                        <td class="style3">City:</td>
                        <td><asp:TextBox runat="server" ID="OAddress4" Width="200" MaxLength="50" /></td>
                    </tr>
                    <tr>
                        <td style="text-align:left"><span class="style1">*</span>Province</td>
                        <td class="style2"><asp:ListBox runat="server" ID="lbPProvinces" Rows="1" DataTextField="Name" DataValueField="IdProvince"  /></td>
                        <td></td>
                        <td class="style3">Province</td>
                        <td><asp:ListBox runat="server" ID="lbOProvinces" Rows="1" DataTextField="Name" DataValueField="IdProvince"  /></td>
                    </tr>
                    <tr>
                        <td style="text-align:left"><span class="style1">*</span>Postal Code:</td>
                        <td class="style2"> <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ErrorMessage="Postal Code Field is Required" ControlToValidate="PPostal" ForeColor="Red"></asp:RequiredFieldValidator>&nbsp;<asp:RegularExpressionValidator
                                    ID="RegularExpressionValidator6" runat="server" ErrorMessage="Invalid text, insert 4 digits." ControlToValidate="PPostal" ValidationExpression="^[0-9]{4}" ForeColor="Red"></asp:RegularExpressionValidator><br /><asp:TextBox runat="server" ID="PPostal" MaxLength="5" /></td>
                        <td></td>
                        <td class="style3">Postal Code:</td>
                        <td><asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Invalid Text. Only insert 4 digits." ControlToValidate="OPostal" ValidationExpression="^[0-9]{4}" ForeColor="Red" /><asp:TextBox runat="server" ID="OPostal" MaxLength="5" /></td>
                    </tr>
                    <tr>
                        <td colspan="5"><hr /></td>
                    </tr>
                    <tr>
                        <td style="text-align:left"><span class="style1">*</span>Email Address:</td>
                        <td class="style2"><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Not a valid email address"
                                            ControlToValidate="email" ValidationExpression="^([\w\-\.]+)@((\[([0-9]{1,3}\.){3}[0-9]{1,3}\])|(([\w\-]+\.)+)([a-zA-Z]{2,4}))$"
                                            ForeColor="Red"></asp:RegularExpressionValidator><asp:TextBox runat="server" ID="email" Width="200" /></td>
                        <td></td>
                        <td class="style3">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5"><hr /></td>
                    </tr>                
                    <tr>
                        <td style="text-align:left">Business Telephone:</td>
                        <td class="style2"><asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Not a valid format +27721231234 / 0123456789"
                                ValidationExpression="^((?:\+27|27)|0)(\d{2})(\d{7})$" ControlToValidate="workTel"
                                ForeColor="Red"></asp:RegularExpressionValidator><asp:TextBox runat="server" ID="workTel" Width="200" /></td>
                        <td></td>
                        <td class="style3">Home Number:</td>
                        <td><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Not a valid format +27721231234 / 0123456789"
                                ValidationExpression="^((?:\+27|27)|0)(\d{2})(\d{7})$" ControlToValidate="homeTel"
                                ForeColor="Red"></asp:RegularExpressionValidator><asp:TextBox runat="server" ID="homeTel" Width="200" /></td>
                    </tr>
                    <tr>
                        <td style="text-align:left">Facsimile Details:</td>
                        <td class="style2"><asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Not a valid format +27721231234 / 0123456789"
                                ValidationExpression="^((?:\+27|27)|0)(\d{2})(\d{7})$" ControlToValidate="fax"
                                ForeColor="Red"></asp:RegularExpressionValidator><asp:TextBox runat="server" ID="fax" Width="200" /></td>
                        <td></td>
                        <td class="style3">Cellular Number:</td>
                        <td><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Not a valid format +27721231234 / 0123456789"
                                ValidationExpression="^((?:\+27|27)|0)(\d{2})(\d{7})$" ControlToValidate="cell"
                                ForeColor="Red"></asp:RegularExpressionValidator><asp:TextBox runat="server" ID="cell" Width="200" /></td>
                    </tr>
                    <tr id="trMedicalHistoryI" runat="server">
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="5" class="blueBack">Claims Reimbursement Bank Account Details</td>
                    </tr>
                    <tr>
                        <td colspan="5">Regretably only South African Bank accounts may be used for this purpose.</td>
                    </tr>
                    <tr>
                        <td>Name of Account Holder:</td>
                        <td class="style2"><asp:TextBox runat="server" ID="AccountHolderName" Width="200" MaxLength="50" /></td>
                        <td></td>
                        <td class="style3">Name of Bank:</td>
                        <td><asp:TextBox runat="server" ID="BankName" Width="200" MaxLength="50" /></td>
                    </tr>
                    <tr>
                        <td>Account Number:</td>
                        <td class="style2"><asp:TextBox runat="server" ID="AccountNumber" Width="200" MaxLength="50" /></td>
                        <td></td>
                        <td class="style3">Branch Code:</td>
                        <td><asp:TextBox runat="server" ID="BranchCode" Width="200" MaxLength="10" /></td>
                    </tr>
                    <tr>
                        <td valign="top">Type of Account:</td>
                        <td class="style2">
                            <asp:RadioButtonList runat="server" ID="rblAccountType" DataTextField="TypeName" 
                                DataValueField="IdAccountType" RepeatDirection="Horizontal" >                                
                            </asp:RadioButtonList>
                        </td>
                        <td></td>
                        <td class="style3">Branch Name:</td>
                        <td><asp:TextBox runat="server" ID="tbBranchName" Width="200" MaxLength="50" /></td>
                    </tr>
                    <tr>
                        <td colspan="5" class="blueBack">Login Details</td>
                    </tr>
                    <tr>
                        <td colspan="5">In order to log in to the Students Area please provide a username and password. The Student Portal allows you to view your latest claims.</td>
                    </tr>
                    <tr>
                        <td><span class="style1">*</span>Username:</td>
                        <td class="style2"> <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                ErrorMessage="Username is Required" ControlToValidate="tbUsername" 
                                ForeColor="Red"></asp:RequiredFieldValidator><br /><asp:TextBox runat="server" ID="tbUsername" Width="200" MaxLength="50" /></td>
                        <td></td>
                        <td class="style3" colspan="2"><asp:Label runat="server" ID="lblUsername" /></td>
                    </tr>
                    <tr>
                        <td><span class="style1">*</span>Password:</td>
                        <td class="style2"> <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                ErrorMessage="Password Field is Required" ControlToValidate="tbPassword" 
                                ForeColor="Red"></asp:RequiredFieldValidator><asp:TextBox runat="server" ID="tbPassword" Width="200" TextMode="Password" /></td>
                        <td></td>
                        <td class="style3" colspan="2"><asp:Label runat="server" ID="lblConfirmPassword" /></td>
                    </tr>
                    <tr>
                        <td><span class="style1">*</span>Confirm Password:</td>
                        <td class="style2"> <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                ErrorMessage="Confirm Password Field is Required" ControlToValidate="tbConfirmPassword" 
                                ForeColor="Red"></asp:RequiredFieldValidator><asp:TextBox runat="server" ID="tbConfirmPassword" Width="200" TextMode="Password" /></td>
                        <td></td>
                        <td class="style3" colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5" style="text-align:right"><asp:Button ID="btnNext" 
                                CssClass="normalButtons" Text="Next" runat="server" onclick="btnNext_Click" /></td>
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
