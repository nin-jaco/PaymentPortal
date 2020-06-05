<%@ Page Title="StudentPlan: Online Application Form" Language="C#" MasterPageFile="~/StudentPlanNMP.master" AutoEventWireup="true" CodeBehind="PreliminaryQuestions.aspx.cs" Inherits="StudentPlan.PreliminaryQuestions" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
            <img alt="" src="http://localhost/StudentPlan/Images/applynowFlash.jpg" 
            style="width: 979px; height: 359px" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyText" runat="server">
    <h1>Online Application Form for membership on the CompCare Wellness NetworX Option</h1>
    <p class="radialShadow">&nbsp;</p>
    <table cellpadding="5" cellspacing="0" style="width:100%">
        <tr>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x">&nbsp;</td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x">
                <img src="Images/step1.png" alt="Step 1" /></td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x"><h3  class="formHeading">Answer Qualifying Questions</h3></td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x"></td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:HiddenField ID="hfSACit" runat="server" />
                <div id="divCitizenship" runat="server">
                    <table cellpadding="5" cellspacing="0" style="width:100%">
                        <tr>
                            <td style="text-align:left">&nbsp;&nbsp;Are you a permanent resident of the Republic of South 
                                Africa?</td>
                            <td style="text-align:left"><asp:RadioButtonList runat="server" ID="rblIsSACitizen" 
                                    onselectedindexchanged="rblIsSACitizen_SelectedIndexChanged" AutoPostBack="true" RepeatDirection="Horizontal" >
                                    <asp:ListItem Text="yes" Value="yes" Selected="False"></asp:ListItem>
                                    <asp:ListItem Text="no" Value="no" Selected="False"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td style="width:150px">&nbsp;</td>
                        </tr>
                    </table>
                </div>
                <div id="divUnderwriting" runat="server">
                    <table cellpadding="10" cellspacing="0" style="width:100%; text-align:left">
                        <tr>
                            <td colspan="5" class="blueBack">Your Age</td>
                        </tr>
                        <tr>
                            <td style="text-align:left">What is your date of Birth?</td>
                            <td>
                                <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                                </cc1:ToolkitScriptManager>
                                <asp:Label ID="lblDateError" runat="server" ForeColor="Red" />
                                <asp:TextBox runat="server" ID="DateOfBirth" />
                                    <cc1:CalendarExtender ID="DateOfBirth_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="DateOfBirth" OnClientHidden="onCalendarHidden" Format="yyyy/MM/dd">
                                    </cc1:CalendarExtender>
                                </td>
                            <td colspan="2">Present Age:</td>
                            <td><input type="text" id="ages" disabled="disabled" runat="server"  /></td>
                        </tr>
                        <tr>
                            <td colspan="5" class="blueBack">Dependants</td>
                        </tr>
                        <tr>
                            <td colspan="3">Do you need to add Dependants to this membership?</td>
                            <td colspan="2"><asp:RadioButton GroupName="rbDependants" runat="server" ID="rbDependantsYes" Text="yes" value="yes"/>
                            <asp:RadioButton GroupName="rbDependants" runat="server" ID="rbDependantsNo" Text="no" value="no" Checked="true"/></td>
                        </tr>
                        <tr>
                            <td colspan="5" class="blueBack">Medical History</td>
                        </tr>
                        <tr>
                            <td colspan="5">Please indicate and provide details of whether any medical treatment, including acute conditions, you or any of your dependants have ever experienced or have received during the last twelve months or anticipate receiving within the next twelve months.</td>
                        </tr>                        
                        <tr>
                            <td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; have ever experienced or</td>
                            <td colspan="2"><asp:RadioButton GroupName="rbHasBefore" runat="server" ID="rbHasBeforeYes" Text="yes" value="yes"/>
                                <asp:RadioButton GroupName="rbHasBefore" runat="server" ID="rbHasBeforeNo" Text="no" value="no" Checked="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; have received during the last twelve months or</td>
                            <td colspan="2"><asp:RadioButton GroupName="rbLastTwelfe" runat="server" ID="rbLastTwelfeYes" Text="yes" value="yes"/>
                                <asp:RadioButton GroupName="rbLastTwelfe" runat="server" ID="rbLastTwelfeNo" Text="no" value="no" Checked="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; anticipate receiving within the next twelve months</td>
                            <td colspan="2"><asp:RadioButton GroupName="rbNextTwelfe" runat="server" ID="rbNextTwelfeYes" Text="yes" value="yes"/>
                                <asp:RadioButton GroupName="rbNextTwelfe" runat="server" ID="rbNextTwelfeNo" Text="no" value="no" Checked="true"/>
                            </td>
                        </tr>
                    </table>
                </div>
                
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align:right"><asp:Button runat="server" ID="btnNext" 
                    Text="Next" CssClass="normalButtons" onclick="btnNext_Click" /></td>
        </tr>
        <tr>
            <td colspan="4">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
