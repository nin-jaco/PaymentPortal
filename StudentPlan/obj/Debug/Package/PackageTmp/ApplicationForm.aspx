<%@ Page Title="" Language="C#" MasterPageFile="~/StudentPlanNMP.master" AutoEventWireup="true" CodeBehind="ApplicationForm.aspx.cs" Inherits="StudentPlan.ApplicationForm" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CustomPageScript" runat="server">
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
        function onCalendarHidden(sender, args) {
            var now = new Date();
            var birthDate = new Date(sender.get_selectedDate());
            //alert(sender.get_selectedDate());
            var mm = birthDate.getMonth() + 1;
            var yy = birthDate.getFullYear();
            var dd = birthDate.getDate();
            //alert("Year: " + yy + " Month: " + mm + " Day: " + dd);

            //            var mm = document.getElementById('ddlmnths').value;
            //            var ddr = document.getElementById('ddldays');
            //            var dd = ddr.options[ddr.selectedIndex].value;
            //            var yy = document.getElementById('ddlyrs').value;
            bDay = dd + "/" + mm + "/" + yy;
            bD = bDay.split('/');
            if (bD.length == 3) {
                born = new Date(bD[2], bD[1] * 1 - 1, bD[0]);
                years = Math.floor((now.getTime() - born.getTime()) / (365.25 * 24 * 60 * 60 * 1000));
                //                alert(years);
                //                if (years < 18) 
                //                {
                //                    alert("You are not eligible");
                //                }
                //                else if (years = 18 || years > 18) 
                //                {
                //                    alert("Welcome");
                //                }
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
    <table cellpadding="5">
        <tr>
            <td></td>
            <td>
                <img src="Images/step1.png" /></td>
            <td><h3>Complete the Application Form</h3></td>
        </tr>
        <tr>
            <td colspan="3">Your application will be submitted to the Membership Department for processing and your certificate emailed to you on being successfull.</td>
        </tr>
    </table>
    <div id="tabs2">
        <ul>
            <li><a href="#tabs-1">Cover Period</a></li>
            <li><a href="#tabs-2">Personal Particulars</a></li>
            <li><a href="#tabs-3">Dependant Details</a></li>
            <li><a href="#tabs-4">Medical History</a></li>
            <li><a href="#tabs-5">Claims Reimbursement Details</a></li>
            <li><a href="#tabs-6">Declaration</a></li>
        </ul>
        <div id="tabs-1">
            <p class="blueBack">Cover Period</p>
            <table style="width:100%" cellpadding="5" cellspacing="0">
                <tr>
                    <td>Date of Commencement</td>
                    <td><input id="startDate" type="text" /></td>
                    <td style="width:30px">&nbsp;</td>
                    <td>End Date</td>
                    <td><input id="endDate" type="text" /></td>
                </tr>
            </table>
        </div>
        <div id="tabs-2">
            <p class="blueBack">Personal Particulars</p>
            <table style="width:100%; text-align:left" cellpadding="5" cellspacing="0" border="0">
                <tr>
                    <td style="width:150px; text-align:left">Surname:</td>
                    <td><asp:TextBox runat="server" ID="surname" Width="200" /></td>
                    <td>First Name(s):</td>
                    <td><asp:TextBox runat="server" ID="firstNames" Width="200px" /></td>
                </tr>
                
                <tr>
                    <td style="text-align:left">Title:</td>
                    <td><asp:TextBox runat="server" ID="title" Width="200" /></td>
                    <td>Marital Status:</td>
                    <td><asp:ListBox runat="server" Rows="1" ID="lbMaritalStatus" DataTextField="Description" DataValueField="IdMaritalStatus" >
                    </asp:ListBox></td>
                </tr>
                
                <tr>
                    <td style="text-align:left">Date of Birth:</td>
                    <td><input id="dob" type="text" /></td>
                    <td>Present Age:</td>
                    <td><asp:TextBox runat="server" ID="tbPresentAge" Enabled="false" /></td>
                </tr>
                
                <tr>
                    <td style="text-align:left">ID /Passport No:</td>
                    <td><asp:TextBox runat="server" ID="tbIdNumber" Width="200px" /></td>
                    <td>Nationality:</td>
                    <td><asp:TextBox runat="server" ID="tbNationality" Width="200" /></td>
                </tr>
                
                <tr>
                    <td style="text-align:left">Country of Origin:</td>
                    <td><asp:TextBox runat="server" ID="CountryOrigin" Width="200px" /></td>
                    <td>Embassy:</td>
                    <td><asp:TextBox runat="server" ID="Embassy" Width="200px" /></td>
                </tr>
                
                <tr>
                    <td style="text-align:left" colspan="4"><hr /></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td style="text-align:left" colspan="2"><strong>Physical Address:</strong></td>
                    <td colspan="2"><strong>Postal Address:</strong></td>
                </tr>
                
                <tr>
                    <td style="text-align:left">Building Name and Number:</td>
                    <td><asp:TextBox runat="server" ID="PAddress1" Width="200" /></td>
                    <td>Postbox /Street</td>
                    <td><asp:TextBox runat="server" ID="OAddress1" Width="200" /></td>
                </tr>
                
                <tr>
                    <td style="text-align:left">Street Name and Number:</td>
                    <td><asp:TextBox runat="server" ID="PAddress2" Width="200" /></td>
                    <td>&nbsp;</td>
                    <td><asp:TextBox runat="server" ID="OAddress2" Width="200" /></td>
                </tr>
                
                <tr>
                    <td style="text-align:left">Suburb:</td>
                    <td><asp:TextBox runat="server" ID="PAddress3" Width="200" /></td>
                    <td>Sorting Office:</td>
                    <td><asp:TextBox runat="server" ID="OAddress3" Width="200" /></td>
                </tr>
                
                <tr>
                    <td style="text-align:left">Province /State:</td>
                    <td><asp:TextBox runat="server" ID="PAddress4" Width="200" /></td>
                    <td>Province /State:</td>
                    <td><asp:TextBox runat="server" ID="OAddress4" Width="200" /></td>
                </tr>
                
                <tr>
                    <td style="text-align:left">Postal Code:</td>
                    <td><asp:TextBox runat="server" ID="PPostal" /></td>
                    <td>Postal Code:</td>
                    <td><asp:TextBox runat="server" ID="OPostal" /></td>
                </tr>
                
                <tr>
                    <td style="text-align:left" colspan="4"><hr /></td>
                </tr>
                
                <tr>
                    <td style="text-align:left">Email Address:</td>
                    <td><asp:TextBox runat="server" ID="email" Width="200" /></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                
                <tr>
                    <td style="text-align:left" colspan="4"><hr /></td>
                </tr>
                
                <tr>
                    <td style="text-align:left">Business Telephone:</td>
                    <td><asp:TextBox runat="server" ID="workTel" Width="200" /></td>
                    <td>Home Number:</td>
                    <td><asp:TextBox runat="server" ID="homeTel" Width="200" /></td>
                </tr>
                
                <tr>
                    <td style="text-align:left">Facsimile Details:</td>
                    <td><asp:TextBox runat="server" ID="fax" Width="200" /></td>
                    <td>Cellular Number:</td>
                    <td><asp:TextBox runat="server" ID="cell" Width="200" /></td>
                </tr>
                <tr>
                    <td colspan="4"><hr /></td>
                </tr>
                <tr>
                    <td>Study Institution:</td>
                    <td><asp:TextBox runat="server" ID="studyInstitution" Width="200" /></td>
                    <td>Student Number:</td>
                    <td><asp:TextBox runat="server" ID="studentNumber" Width="200" /></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                </table>
         </div>
         <div id="tabs-3">
            <p class="blueBack">Dependant Details</p>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div id="dvgv" style="padding: 10px; width: 750px" align="center">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btninsert" runat="server" Text="Insert" OnClick="insertinXML" />
                    <asp:GridView ID="gv" runat="server" OnPageIndexChanging="pageddata" OnRowCancelingEdit="Canceldata"
                        AllowPaging="True" AutoGenerateColumns="false" PageSize="10" CellPadding="4"
                        ForeColor="#333333" GridLines="None" OnRowDeleting="Deletedata" EmptyDataText="No Dependants Added">
                        <FooterStyle BackColor="White" Font-Bold="True" ForeColor="Black" />
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:BoundField DataField="empid" HeaderText="ID" HtmlEncode="true" />
                            <asp:BoundField DataField="empname" HeaderText="Name" HtmlEncode="true" />
                            <asp:BoundField DataField="empcity" HeaderText="Surname" HtmlEncode="true" />
                            <asp:BoundField DataField="empsalary" HeaderText="Relationship" HtmlEncode="true" />
                            <asp:BoundField DataField="empsalary" HeaderText="Gender" HtmlEncode="true" />
                            <asp:BoundField DataField="empsalary" HeaderText="Date of Birth" HtmlEncode="true" />
                            <asp:TemplateField ItemStyle-Width="30px">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" OnClick="Edit" ForeColor="#00424E"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowDeleteButton="true" ControlStyle-ForeColor="#00424E" />
                        </Columns>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <%--<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />--%>
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <br />
                    <br />
                    
                    <asp:Panel ID="pnlAddEdit" runat="server" CssClass="modalPopup" Style="display: none">
                        <asp:Label Font-Bold="true" ID="Label4" runat="server" Text="Customer Details"></asp:Label>
                        <br />
                        <table align="center">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="EmpId"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtempID" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="Surname"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text="Relationship"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSalary" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label6" runat="server" Text="Gender"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label7" runat="server" Text="Date of Birth"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnSave" runat="server" Text="Add" OnClick="Save" />
                                </td>
                                <td>
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="Update" />
                                </td>
                                <td>
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClientClick="return Hidepopup()" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <cc1:ModalPopupExtender ID="popup" runat="server" DropShadow="false" PopupControlID="pnlAddEdit"
                        TargetControlID="btnInsert" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="gv" />
                    <asp:AsyncPostBackTrigger ControlID="btnSave" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
         </div>
         <div id="tabs-4">
            <p class="blueBack">Medical History</p>
            <table>
                    <tr>
                        <td colspan="2">Please indicate and provide details of whether any medical treatment, including acute conditions, you or any of your
dependants have ever experienced or have received during the last twelve months or anticipate receiving within the next twelve months.</td>
                    </tr>
                    <tr>
                        <td>have ever experienced or</td>
                        <td><asp:RadioButtonList runat="server" ID="Q1">
                            <asp:ListItem Text="Yes" Value="Yes" />
                            <asp:ListItem Text="No" Value="No" />
                        </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td>have received during the last twelve months or</td>
                        <td><asp:RadioButtonList runat="server" ID="RadioButtonList1">
                            <asp:ListItem Text="Yes" Value="Yes" />
                            <asp:ListItem Text="No" Value="No" />
                        </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td>anticipate receiving within the next twelve months</td>
                        <td><asp:RadioButtonList runat="server" ID="RadioButtonList2">
                            <asp:ListItem Text="Yes" Value="Yes" />
                            <asp:ListItem Text="No" Value="No" />
                        </asp:RadioButtonList></td>
                    </tr>
                </table>
         </div>
         <div id="tabs-5">
            <p class="blueBack">Claims Reimbursement Bank Account Details</p>
            <p>Regretably only South African Bank accounts may be used.</p>
            <table cellpadding="5" cellspacing="0" width="100%" style="text-align:left">
                <tr>
                    <td>Name of Account Holder:</td>
                    <td><asp:TextBox runat="server" ID="AccountHolderName" Width="200" /></td>
                    <td>Name of Bank:</td>
                    <td><asp:TextBox runat="server" ID="BankName" Width="200" /></td>
                </tr>
                <tr>
                    <td>Account Number:</td>
                    <td><asp:TextBox runat="server" ID="AccountNumber" Width="200" /></td>
                    <td>Branch Code:</td>
                    <td><asp:TextBox runat="server" ID="BranchCode" Width="200" /></td>
                </tr>
            </table>
         </div>
         <div id="tabs-6">
            <p class="blueBack">Declaration</p>
            <p></p>
         </div>
    </div>       
                
                
                
                <%--<table>
                    <tr>
                        <td>Name</td>
                        <td>Details of Condition</td>
                        <td>Date of Treatment</td>
                        <td>Degree of Recovery</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
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
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
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
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
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
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>--%>
</asp:Content>
