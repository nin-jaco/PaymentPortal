<%@ Page Title="Compcare Wellness: Scheme Options" Language="C#" MasterPageFile="~/TheScheme/SchemeNMP.master"
    AutoEventWireup="true" CodeBehind="SchemeOptions.aspx.cs" Inherits="CompCareWebsite.TheScheme.SchemeOptions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
    <script src="../Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.ui.widget.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui-1.8.11.custom.min.js" type="text/javascript"></script>
    <link href="../Styles/jquery-ui-1.8.11.custom.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            // Accordion
            $("#accordion").accordion({ header: "h5", autoHeight: false });
            // Tabs
            $('#tabs').tabs();
            // Dialog			
            $('#dialog').dialog({
                autoOpen: false,
                width: 600,
                buttons: {
                    "Ok": function () {
                        $(this).dialog("close");
                    },
                    "Cancel": function () {
                        $(this).dialog("close");
                    }
                }
            });
            // Dialog Link
            $('#dialog_link').click(function () {
                $('#dialog').dialog('open');
                return false;
            });
            // Datepicker
            $('#datepicker').datepicker({
                inline: true
            });
            // Slider
            $('#slider').slider({
                range: true,
                values: [17, 67]
            });
            // Progressbar
            $("#progressbar").progressbar({
                value: 20
            });
            //hover states on the static widgets
            $('#dialog_link, ul#icons li').hover(
					function () { $(this).addClass('ui-state-hover'); },
					function () { $(this).removeClass('ui-state-hover'); }
				);
        });

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <table cellpadding="0" cellspacing="0" style="width:939px; text-align:justify">
        <tr>
            <td colspan="3">
                <h1>
                    Scheme Options</h1>
                <table cellpadding="0" cellspacing="0" style="width:100%">
                    <tr>
                        <td style="text-align:left">
                            &nbsp;
                        </td>
                        <td style="text-align:right">
                            <a href="ChronicConditionsCovered.aspx"><img src="../Images/btnChronicConditions.jpg" border="none" alt="Chronic Conditions Covered 2012" /></a>
                            <%--<a href="CoPayments.aspx"><img src="../Images/btnCoPayments.jpg" border="none" alt="Co-payments and procedures 2012" /></a>--%>
                            <a href="BenefitComparison.aspx"><img src="../Images/OptionBenefitComparisonButton.jpg" border="none" alt="Option Change Form 2012" /></a>&nbsp;
                        </td>
                    </tr>
                </table>
                
                <br />
                <%--<asp:Button ID="btnContributionComparison" runat="server" CssClass="bigButton" 
                    Text="Option Contribution Comparison" 
                    onclick="btnContributionComparison_Click" />--%>
                
            </td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td class="radialShadow" colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 540px;" valign="top">
                <div id="accordion">
                    <h5 class="accordionHeaders">
                        <a href="#">Pinnacle</a></h5>
                    <div>
                        <table cellspacing="5" cellpadding="5">
                            <tr>
                                <td valign="top"><img src="../Images/pinnacle.jpg" alt="Pinnacle" /></td>
                                <td>The Pinnacle option offers comprehensive cover for the discerning achiever, with
exceptional hospital and superior day-to-day benefits comprising a combination of
savings account, traditional risk cover and very competitive above threshold benefits.
                                    <p style="text-align:right">
                                        <a href="Pinnacle.aspx">&raquo; Read More</a></p>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <h5 class="accordionHeaders">
                        <a href="#">Dynamix</a></h5>
                    <div>
                        <table cellspacing="5" cellpadding="5">
                            <tr>
                                <td valign="top"><img src="../Images/dynamix.jpg" alt="Dynamix" /></td>
                                <td>
                                    The Dynamix option is an attractive new generation plan and offers comprehensive
private hospital cover, a savings account and traditional risk benefits with above
threshold benefits for day-to-day healthcare expenses.
                                    <p style="text-align: right">
                                        <a href="Dynamix.aspx">Read More ></a></p>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <h5 class="accordionHeaders">
                        <a href="#">Symmetry</a></h5>
                    <div>
                        <table cellspacing="5" cellpadding="5">
                            <tr>
                                <td valign="top"><img src="../Images/symmetry.jpg" alt="Symmetry" /></td>
                                <td>
                                    The Symmetry option provides unlimited cover in a private hospital of your choice,
and comprehensive day-to-day benefits comprising of a medical savings account
and traditional risk cover, for complete peace of mind.
                                    <p style="text-align: right">
                                        <a href="Symmetry.aspx">Read More ></a></p>
                                </td>
                            </tr>
                        </table>
                    </div>                    
                    <h5 class="accordionHeaders">
                        <a href="#">Mumed</a></h5>
                    <div>
                        <table cellspacing="5" cellpadding="5">
                            <tr>
                                <td valign="top"><img src="../Images/mumed.jpg" alt="Mumed" /></td>
                                <td>
                                    The Mumed option is an affordable plan with traditional benefits combined with a
medical savings account for young members and families who want the freedom to
see a healthcare provider of choice when necessary.
                                    <p style="text-align:right">
                                        <a href="Mumed.aspx">Read More ></a></p>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <h5 class="accordionHeaders">
                        <a href="#">Axis</a></h5>
                    <div>
                        <table cellspacing="5" cellpadding="5">
                            <tr>
                                <td valign="top"><img src="../Images/axis.jpg" alt="Axis" /></td>
                                <td>
                                        The Axis option is a premium comprehensive private hospital benefit plan with postoperative
                                        rehabilitation benefits for complete peace of mind.
                                    <p style="text-align:right">
                                        <a href="Axis.aspx">Read More ></a></p>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <h5 class="accordionHeaders">
                        <a href="#">NetworX</a></h5>
                    <div>
                        <table cellspacing="5" cellpadding="5">
                            <tr>
                                <td valign="top"><img src="../Images/networx.jpg" alt="Networx" /></td>
                                <td>
                                    <p>The NetworX option is an affordable healthcare plan with exceptional value for
students and low income employees in the corporate sector, and offers essential
cover within the Universal Healthcare Provider Network.</p>
                                    <p>If you are a foreign student student and need medical insurance to register at a South African university, this is the plan for you! </p>
                                    <p>To register online now, <a href="http://www.studentplan.co.za/" target="_blank">click here</a>.</p>
                                    <p style="text-align:right"><a href="Networx.aspx">Read More ></a></p>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </td>
            <td style="width: 29px;">
            </td>
            <td style="width: 330px" valign="top">
                <table cellpadding="0" cellspacing="0" class="moreInfoBlockScheme">
                    <tr>
                        <td style="padding:20px" valign="top"><h1>&raquo; Speak to a Consultant</h1>
                            <p>&nbsp;&nbsp;&nbsp;&nbsp; Call us now for expert advice</p>
                            <p class="bigTelephoneNo">+27(0)11 208 1010</p>
                        </td>
                    </tr>
                </table>
                <br />
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="roundedRightColumn" style="width:330px">
                            <h2>&raquo; or leave your details and <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; we will contact you... </h2>
                            <table cellpadding="5" cellspacing="0">
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
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Not a valid telephone number"
                                            ValidationExpression="(^\([0]\d{2}\))(\d{6,7}$)" ControlToValidate="tbNumber"
                                            ForeColor="Red"></asp:RegularExpressionValidator><br />
                                        <asp:TextBox ID="tbNumber" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="bottom">
                                        <asp:Label ID="lblQuery" runat="server">Option:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="lbOptions" ErrorMessage="Please select an option" ForeColor="Red" />
                                        <asp:DropDownList ID="lbOptions" runat="server">
                                            <asp:ListItem Text="Please select.." Value=""></asp:ListItem>
                                            <asp:ListItem Text="Pinnacle" Value="Pinnacle"></asp:ListItem>
                                            <asp:ListItem Text="Dynamix" Value="Dynamix"></asp:ListItem>
                                            <asp:ListItem Text="Symmetry" Value="Symmetry"></asp:ListItem>
                                            <asp:ListItem Text="Axis" Value="Axis"></asp:ListItem>
                                            <asp:ListItem Text="Mumed" Value="Mumed"></asp:ListItem>
                                            <asp:ListItem Text="Networx" Value="Networx"></asp:ListItem>
                                        </asp:DropDownList>
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
