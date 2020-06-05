<%@ Page Title="" Language="C#" MasterPageFile="~/StudentPlanNMP.master" AutoEventWireup="true" CodeBehind="SubmitForm.aspx.cs" Inherits="StudentPlan.SubmitForm" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CustomPageScript" runat="server">
    <script type="text/javascript" language="javascript">
        function onCalendarHidden(sender, args) {
            var now = new Date();
            var birthDate = new Date(sender.get_selectedDate());
            var mm = birthDate.getMonth() + 1;
            var yy = birthDate.getFullYear();
            var dd = birthDate.getDate();
            bDay = dd + "/" + mm + "/" + yy;
            bD = bDay.split('/');
            if (bD.length == 3) {
                born = new Date(bD[2], bD[1] * 1 - 1, bD[0]);
                years = Math.floor((now.getTime() - born.getTime()) / (365.25 * 24 * 60 * 60 * 1000));
            }
            document.getElementById('body_bodyText_ages').value = years;
        } 
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <img alt="" src="Images/applynowFlash.jpg" 
            style="width: 979px; height: 359px" /></p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyText" runat="server">
    <h1>Online Application Form</h1>
                <p class="radialShadow">&nbsp;</p>
    <table cellpadding="5" cellspacing="0" style="width:100%">
        <tr>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x">&nbsp;</td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x">
                <img src="Images/step2.png" alt="Step 2" /></td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x"><h3 style="color:White; vertical-align:top">Complete the Application Form</h3></td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x"></td>
        </tr>
        <tr>
            <td colspan="4">
                <table cellpadding="10" cellspacing="0" style="width:100%; text-align:left">
                    <tr>
                        <td colspan="5" class="blueBack">Cover Period</td>
                    </tr>
                    <tr>
                        <td>Date of Commencement:</td>
                        <td>
                            <asp:ScriptManager ID="ScriptManager2" runat="server">
                            </asp:ScriptManager>
                            <asp:TextBox runat="server" ID="tbStartDate" />
                            <asp:CalendarExtender ID="tbStartDate_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="tbStartDate">
                            </asp:CalendarExtender>
                        </td>
                        <td>&nbsp;</td>
                        <td>End Date:</td>
                        <td><asp:TextBox runat="server" ID="tbEndDate" />
                            <asp:CalendarExtender ID="tbEndDate_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="tbEndDate">
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" class="blueBack">Personal Particulars</td>
                    </tr>
                    <tr>
                        <td style="width:150px; text-align:left">Surname:</td>
                        <td><asp:TextBox runat="server" ID="surname" Width="200" /></td>
                        <td></td>
                        <td>First Name(s):</td>
                        <td><asp:TextBox runat="server" ID="firstNames" Width="200px" /></td>
                    </tr>
                    <tr>
                        <td style="text-align:left">Title:</td>
                        <td><asp:TextBox runat="server" ID="title" Width="200" /></td>
                        <td></td>
                        <td>Marital Status:</td>
                        <td><asp:ListBox runat="server" Rows="1" ID="lbMaritalStatus" DataTextField="Description" DataValueField="IdMaritalStatus" >
                        </asp:ListBox></td>
                    </tr>
                    <tr>
                        <td style="text-align:left">Date of Birth:</td>
                        <td><asp:TextBox runat="server" ID="DateOfBirth" />
                            <asp:CalendarExtender ID="DateOfBirth_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="DateOfBirth" OnClientHidden="onCalendarHidden" Format="yyyy/MM/dd">
                            </asp:CalendarExtender></td>
                        <td></td>
                        <td>Present Age:</td>
                        <td><input type="text" id="ages" disabled="disabled" runat="server"  /></td>
                    </tr>
                    <tr>
                        <td style="text-align:left">ID /Passport No:</td>
                        <td><asp:TextBox runat="server" ID="tbIdNumber" Width="200px" /></td>
                        <td></td>
                        <td>Nationality:</td>
                        <td><asp:TextBox runat="server" ID="tbNationality" Width="200" /></td>
                    </tr>
                    <tr>
                        <td style="text-align:left">Country of Origin:</td>
                        <td><asp:TextBox runat="server" ID="CountryOrigin" Width="200px" /></td>
                        <td></td>
                        <td>Embassy:</td>
                        <td><asp:TextBox runat="server" ID="Embassy" Width="200px" /></td>
                    </tr>
                    <tr>
                        <td style="text-align:left">Gross Income:</td>
                        <td><asp:TextBox runat="server" ID="GrossIncome" Width="200px" /></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5"><hr /></td>
                    </tr>
                    <tr>
                        <td colspan="5">Please provide your addresses whilst in South Africa.</td>
                    </tr>
                    <tr>
                        <td style="text-align:left" colspan="2"><strong>Physical Address:</strong></td>
                        <td></td>
                        <td colspan="2"><strong>Postal Address:</strong></td>
                    </tr>
                    <tr>
                        <td style="text-align:left">Street Name and Number:</td>
                        <td><asp:TextBox runat="server" ID="PAddress2" Width="200" /></td>
                        <td></td>
                        <td>&nbsp;</td>
                        <td><asp:TextBox runat="server" ID="OAddress2" Width="200" /></td>
                    </tr>
                    <tr>
                        <td style="text-align:left">Suburb:</td>
                        <td><asp:TextBox runat="server" ID="PAddress3" Width="200" /></td>
                        <td></td>
                        <td>Sorting Office:</td>
                        <td><asp:TextBox runat="server" ID="OAddress3" Width="200" /></td>
                    </tr>
                    <tr>
                        <td style="text-align:left">Province /State:</td>
                        <td><asp:TextBox runat="server" ID="PAddress4" Width="200" /></td>
                        <td></td>
                        <td>Province /State:</td>
                        <td><asp:TextBox runat="server" ID="OAddress4" Width="200" /></td>
                    </tr>
                    <tr>
                        <td style="text-align:left">Postal Code:</td>
                        <td><asp:TextBox runat="server" ID="PPostal" /></td>
                        <td></td>
                        <td>Postal Code:</td>
                        <td><asp:TextBox runat="server" ID="OPostal" /></td>
                    </tr>
                    <tr>
                        <td colspan="5"><hr /></td>
                    </tr>
                    <tr>
                        <td style="text-align:left">Email Address:</td>
                        <td><asp:TextBox runat="server" ID="email" Width="200" /></td>
                        <td></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5"><hr /></td>
                    </tr>                
                    <tr>
                        <td style="text-align:left">Business Telephone:</td>
                        <td><asp:TextBox runat="server" ID="workTel" Width="200" /></td>
                        <td></td>
                        <td>Home Number:</td>
                        <td><asp:TextBox runat="server" ID="homeTel" Width="200" /></td>
                    </tr>
                    <tr>
                        <td style="text-align:left">Facsimile Details:</td>
                        <td><asp:TextBox runat="server" ID="fax" Width="200" /></td>
                        <td></td>
                        <td>Cellular Number:</td>
                        <td><asp:TextBox runat="server" ID="cell" Width="200" /></td>
                    </tr>
                    <tr>
                        <td colspan="5"><hr /></td>
                    </tr>
                    <tr>
                        <td>Study Institution:</td>
                        <td><asp:TextBox runat="server" ID="studyInstitution" Width="200" /></td>
                        <td></td>
                        <td>Student Number:</td>
                        <td><asp:TextBox runat="server" ID="studentNumber" Width="200" /></td>
                    </tr>
                    <tr>
                        <td colspan="5" class="blueBack">Claims Reimbursement Bank Account Details</td>
                    </tr>
                    <tr>
                        <td colspan="5">Regretably only South African Bank accounts may be used for this purpose.</td>
                    </tr>
                    <tr>
                        <td colspan="5">Name of Account Holder:</td>
                    </tr>
                    <tr>
                        <td>Name of Account Holder:</td>
                        <td><asp:TextBox runat="server" ID="AccountHolderName" Width="200" /></td>
                        <td></td>
                        <td>Name of Bank:</td>
                        <td><asp:TextBox runat="server" ID="BankName" Width="200" /></td>
                    </tr>
                    <tr>
                        <td>Account Number:</td>
                        <td><asp:TextBox runat="server" ID="AccountNumber" Width="200" /></td>
                        <td></td>
                        <td>Branch Code:</td>
                        <td><asp:TextBox runat="server" ID="BranchCode" Width="200" /></td>
                    </tr>
                    <tr>
                        <td>Type of Account:</td>
                        <td>
                            <asp:CheckBoxList runat="server" ID="AccountType" DataTextField="TypeName" DataValueField="IdAccountType">                                
                            </asp:CheckBoxList>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="5" style="text-align:right"><asp:Button ID="btnNext" CssClass="normalButtons" Text="Next" runat="server" /></td>
                    </tr>
                </table>
            </td>
        </tr>       
    </table>
</asp:Content>
