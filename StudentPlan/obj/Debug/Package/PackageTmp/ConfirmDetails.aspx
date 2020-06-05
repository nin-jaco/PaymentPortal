<%@ Page Title="StudentPlan: Online Application Form" Language="C#" MasterPageFile="~/StudentPlanNMP.master" AutoEventWireup="true" CodeBehind="ConfirmDetails.aspx.cs" Inherits="StudentPlan.ConfirmDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CustomPageScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <img alt="" src="Images/applynowFlash.jpg" 
            style="width: 979px; height: 359px" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyText" runat="server">
    <h1>Online Application Form for Membership on the CompCare Wellness NetworX Option</h1>
                <p class="radialShadow">&nbsp;</p>
    <table cellpadding="5" cellspacing="0" style="width:100%">
        <tr>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x">&nbsp;</td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x">
                <img src="Images/step3.png" alt="Step 3" /></td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x"><h3 class="formHeading">Confirm Details and Accept Terms&nbsp; &amp; Conditions</h3></td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x"></td>
        </tr>
        <tr>
            <td colspan="4">
                <table cellpadding="10" cellspacing="0" style="width:100%; text-align:left">
                </table>
            </td>
        </tr>
    </table>
    <div id="tabs2">
        <div id="tabs-2">
            <table style="width:100%; text-align:left" cellpadding="5" cellspacing="0" border="0">
                <tr>
                    <td colspan="4"><asp:Label runat="server" Id="lblError" ForeColor="Red" />
                    <asp:HiddenField ID="hfReference" runat="server" /></td>
                </tr>
                <tr>
                    <td style="width:150px; text-align:left">Date of Commencement</td>
                    <td><asp:Label ID="startDate" runat="server" /></td>
                    <td>End Date</td>
                    <td><asp:Label ID="endDate" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="4"><hr /></td>
                </tr>
                <tr>
                    <td>Study Institution:</td>
                    <td><asp:Label runat="server" ID="studyInstitution" Width="200" /></td>
                    <td>Student Number:</td>
                    <td><asp:Label runat="server" ID="studentNumber" Width="200" /></td>
                </tr>
                <tr>
                    <td>Study Duration:</td>
                    <td><asp:Label runat="server" ID="studyDuration" Width="200" /></td>
                    <td>Your Contribution</td>
                    <td><asp:Label runat="server" ID="contribution" Width="200" /></td>
                </tr>
                <tr>
                    <td>Your Reference Number:</td>
                    <td><asp:Label runat="server" ID="lblReference" Width="200" /></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align:left" colspan="4"><hr /></td>
                </tr>
                <tr>
                    <td style="width:150px; text-align:left">Surname:</td>
                    <td><asp:Label runat="server" ID="surname" Width="200" /></td>
                    <td>First Name(s):</td>
                    <td><asp:Label runat="server" ID="firstNames" Width="200px" /></td>
                </tr>
                <tr>
                    <td style="text-align:left">Title:</td>
                    <td><asp:Label runat="server" ID="title" Width="200" /></td>
                    <td>Marital Status:</td>
                    <td><asp:Label runat="server" ID="tbMaritalStatus" Width="200px" /></td>
                </tr>
                <tr>
                    <td style="text-align:left">Date of Birth:</td>
                    <td><asp:Label runat="server" ID="tbDOB" /></td>
                    <td>Age:</td>
                    <td><asp:Label runat="server" ID="tbAge" Width="200px" /></td>
                </tr>
                <tr>
                    <td style="text-align:left">ID /Passport No:</td>
                    <td><asp:Label runat="server" ID="tbIdNumber" Width="200px" /></td>
                    <td>Country of Issue:</td>
                    <td><asp:Label runat="server" ID="tbCountryOfIssue" Width="200px" /></td>
                </tr>
                <tr>
                    <td style="text-align:left">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>Gender</td>
                    <td><asp:Label runat="server" ID="tbGender" Width="200px" /></td>
                </tr>
                <tr>
                    <td style="text-align:left">Income during study:</td>
                    <td><asp:Label runat="server" ID="tbGettingIncome" Width="200px" /></td>
                    <td>Amount</td>
                    <td><asp:Label runat="server" ID="tbIncomeAmount" Width="200px" /></td>
                </tr>
                <tr>
                    <td style="text-align:left">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align:left" colspan="4"><hr /></td>
                </tr>
                <tr>
                    <td style="text-align:left" colspan="2"><strong>Physical Address:</strong></td>
                    <td colspan="2"><strong>Postal Address:</strong></td>
                </tr>
                <tr>
                    <td style="text-align:left">Address Line 1:</td>
                    <td><asp:Label runat="server" ID="PAddress1" Width="200" /></td>
                    <td>Address Line 1:</td>
                    <td><asp:Label runat="server" ID="OAddress1" Width="200" /></td>
                </tr>
                <tr>
                    <td style="text-align:left">Address Line 2:</td>
                    <td><asp:Label runat="server" ID="PAddress2" Width="200" /></td>
                    <td>Address Line 2:</td>
                    <td><asp:Label runat="server" ID="OAddress2" Width="200" /></td>
                </tr>
                <tr>
                    <td style="text-align:left">Suburb:</td>
                    <td><asp:Label runat="server" ID="PAddress3" Width="200" /></td>
                    <td>Suburb:</td>
                    <td><asp:Label runat="server" ID="OAddress3" Width="200" /></td>
                </tr>
                <tr>
                    <td style="text-align:left">City:</td>
                    <td><asp:Label runat="server" ID="PAddress4" Width="200" /></td>
                    <td>City:</td>
                    <td><asp:Label runat="server" ID="OAddress4" Width="200" /></td>
                </tr>
                <tr>
                    <td style="text-align:left">Province /State:</td>
                    <td><asp:Label runat="server" ID="lblPProvince" Width="200" /></td>
                    <td>Province /State:</td>
                    <td><asp:Label runat="server" ID="lblOProvince" Width="200" /></td>
                </tr>
                <tr>
                    <td style="text-align:left">Postal Code:</td>
                    <td><asp:Label runat="server" ID="PPostal" /></td>
                    <td>Postal Code:</td>
                    <td><asp:Label runat="server" ID="OPostal" /></td>
                </tr>
                <tr>
                    <td style="text-align:left" colspan="4"><hr /></td>
                </tr>
                <tr>
                    <td style="text-align:left">Email Address:</td>
                    <td><asp:Label runat="server" ID="email" Width="200" /></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align:left" colspan="4"><hr /></td>
                </tr>
                <tr>
                    <td style="text-align:left">Business Telephone:</td>
                    <td><asp:Label runat="server" ID="workTel" Width="200" /></td>
                    <td>Home Number:</td>
                    <td><asp:Label runat="server" ID="homeTel" Width="200" /></td>
                </tr>
                
                <tr>
                    <td style="text-align:left">Facsimile Details:</td>
                    <td><asp:Label runat="server" ID="fax" Width="200" /></td>
                    <td>Cellular Number:</td>
                    <td><asp:Label runat="server" ID="cell" Width="200" /></td>
                </tr>
                <tr>
                    <td style="text-align:left" colspan="4"><hr /></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <p>Dependant Information:</p>
                                    <asp:GridView ID="gvDependants" runat="server" Width="100%"
                                         AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None" 
                                        EmptyDataText="No Dependants Added">
                                        <FooterStyle BackColor="White" Font-Bold="True" ForeColor="Black" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <Columns>
                                            <asp:BoundField DataField="Name" HeaderText="Name" HtmlEncode="true" />
                                            <asp:BoundField DataField="Surname" HeaderText="Surname" HtmlEncode="true" />
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    Relationship</HeaderTemplate>
                                                <ItemTemplate>
                                                    <%#Eval("DependantType.DependantTypeDescription")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    Gender</HeaderTemplate>
                                                <ItemTemplate>
                                                    <%#Eval("Gender.GenderDescription")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="DateOfBirth" HeaderText="Date of Birth" 
                                                HtmlEncode="true" />
                                        </Columns>
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:left" colspan="4"><hr /></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <p>Medical History:</p>
                                    <asp:GridView ID="gvMedicalHistory" runat="server"                                     
                                         AutoGenerateColumns="false" PageSize="10" 
                                        CellPadding="4" Width="100%" EnableViewState="true"
                                        ForeColor="#333333" GridLines="None"  
                                        EmptyDataText="No Dependants Added">
                                        <FooterStyle BackColor="White" Font-Bold="True" ForeColor="Black" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <Columns>
                                            <asp:BoundField DataField="Name" HeaderText="Name" HtmlEncode="true" />
                                            <asp:BoundField DataField="TreatmentDate" HeaderText="Date of Treatment" 
                                                HtmlEncode="true" />
                                            <asp:BoundField DataField="DetailsOfCondition" 
                                                HeaderText="Details of Condition" HtmlEncode="true" />
                                            <asp:BoundField DataField="DegreeOfRecovery" HeaderText="Degree of Recovery" 
                                                HtmlEncode="true" />
                                        </Columns>
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                    </td>
                </tr>
                </table>
         </div>
         <%--<div id="tabs-5">
            <table cellpadding="5" cellspacing="0" width="100%" style="text-align:left">
                <tr>
                    <td>Name of Account Holder:</td>
                    <td><asp:Label runat="server" ID="AccountHolderName" Width="200" /></td>
                    <td>Name of Bank:</td>
                    <td><asp:Label runat="server" ID="BankName" Width="200" /></td>
                </tr>
                <tr>
                    <td>Account Number:</td>
                    <td><asp:Label runat="server" ID="AccountNumber" Width="200" /></td>
                    <td>Branch Code:</td>
                    <td><asp:Label runat="server" ID="BranchCode" Width="200" /></td>
                </tr>
            </table>
         </div>--%>
         <div id="tabs-6">
            <p class="blueBack">Declaration</p>
            <p><asp:CheckBox ID="IAccept" Text="I hereby confirm that I have read and accepted the <a href='TermsAndConditions.aspx' target='_blank'>terms and conditions</a> and confirm the details above as being truthful and accurate." runat="server" /></p>
            <p><asp:CheckBox ID="cbBrokerAccept" Text="I hereby consent to a copy of this application being provided to the International Education Association of South Africa (IEASA) and hereby authorise IEASA to appoint an accredited broker on my behalf." runat="server" />&nbsp; 
                (Any fees payable to broker will be paid by the medical scheme.)</p>
            <p style="text-align:right"><asp:Button Text="Payment &nbsp;&nbsp;" ID="btnNextButton" 
                    CssClass="normalButtons" runat="server" onclick="btnNextButton_Click" /> </p>
         </div>
    </div>       
                
</asp:Content>
