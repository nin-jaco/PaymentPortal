<%@ Page Title="Contact CompCare Wellness" Language="C#" MasterPageFile="~/ContactNMP.master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="CompCareWebsite.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
    
    <script src="Scripts/jquery-1.4.4.js" type="text/javascript"></script>
    <script src="Scripts/jquery.ui.widget.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.8.11.custom.min.js" type="text/javascript"></script>
    <link href="Styles/jquery-ui-1.8.11.custom.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        /// <reference path="Scripts/jquery-1.4.4.js" />

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
    <style type="text/css">
        .style1
        {
            font-size: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <h1>Contact Us</h1>
    <br />
    <p class="radialShadow">&nbsp;</p>
    <table cellpadding="0" cellspacing="0" style="width:939px">
        <tr>
            <td style="width:540px;" valign="top">
                <div id="accordion" style="width:540px; margin-left:20px;margin-right:20px">
                    <h5 class="accordionHeaders">
                        <a href="#">Call Centre</a></h5>
                    <div>
                        <p style="font-family:Arial; font-size:12px">
                            <strong><span class="style1">+27 (0)11 208 1010/20</span></strong><br />
                            <br />
                             <strong>Universal Healthcare Administrators (Pty) Ltd</strong><br />
                            Fax Number(s): +27 (0)11 803 6489 / +27 (0)11 807 4496<br />
                            Private Bag X49, Rivonia, 2128<br />
                            <a href="mailto:admin@universal.co.za">admin@universal.co.za</a>
                            <br />
                            <a href="http://www.compcarewellness.co.za">www.compcarewellness.co.za</a>
                        </p>
                    </div>
                    <h5 class="accordionHeaders">
                        <a href="#">Membership</a>
                    </h5>
                    <div>
                        <p style="font-family: Arial; font-size: 12px">
                            <strong><span class="style1">+27 (0)11 208 1000</span></strong><br />
                            <br />
                             <strong>Universal Healthcare Administrators (Pty) Ltd</strong><br />
                            Fax Number(s): +27 (0)11 803 7847<br />
                            Private Bag X49, Rivonia, 2128<br />
                            <a href="mailto:admin@universal.co.za">admin@universal.co.za</a>
                            <br />
                            <a href="http://www.compcarewellness.co.za">www.compcarewellness.co.za</a>
                        </p>
                    </div>
                    <h5 class="accordionHeaders">
                        <a href="#">Contributions</a>
                    </h5>
                    <div>
                        <p style="font-family: Arial; font-size: 12px">
                            <strong><span class="style1">+27 (0)11 208 1000</span></strong><br />
                            <br />
                             <strong>Universal Healthcare Administrators (Pty) Ltd</strong><br />
                            Fax Number(s): +27 (0)11 803 7847<br />
                            Private Bag X49, Rivonia, 2128<br />
                            <a href="mailto:admin@universal.co.za">admin@universal.co.za</a>
                            <br />
                            <a href="http://www.compcarewellness.co.za">www.compcarewellness.co.za</a>
                        </p>
                    </div>
                    <h5 class="accordionHeaders">
                        <a href="#">Hospital Pre-Authorisation and General Queries</a>
                    </h5>
                    <div>
                        <p style="font-family: Arial; font-size: 12px">
                            <strong><span class="style1">+27 (0)860 111 090</span></strong><br />
                            <br />
                             <strong>Universal Care (Pty) Ltd</strong><br />
                            General Enquiries: 
                            +27(0)11 208 1100<br />
                            Pre-authorisation: +27 (0)860 111 090<br />
                            Hospital 
                            Account Queries: +27(0) 208 1100<br />
                            Fax Number(s): +27 (0)86 295 7355<br />
                            Private Bag 
                            1411, Rivonia, 2128<br />
                            General Enquiries: <a href="mailto:admin@universal.co.za">admin@universal.co.za</a><br />
                            Pre-Authorisation: <a href="mailto:preauthorisation@universal.co.za">preauthorisation@universal.co.za</a><br />
                            Hospital Account Queries: <a href="mailto:hospitalaccounts@universal.co.za">hospitalaccounts@universal.co.za</a><br />
                            <a href="http://www.universal.co.za">www.universal.co.za</a>
                        </p>
                    </div>
                    <h5 class="accordionHeaders">
                        <a href="#">Disease Management</a>
                    </h5>
                    <div>
                        <p style="font-family: Arial; font-size: 12px">
                            <strong><span class="style1">+27 (0)860 111 900</span></strong><br />
                            <br />
                             <strong>Universal Care (Pty) Ltd</strong><br />
                            General Enquiries +27(0)11 208 1100<br />
                            Fax Number(s): +27 (0)86 295 7305<br />Private Bag 1411, Rivonia, 2128<br />
                            <a href="mailto:diseasemanagement@universal.co.za">diseasemanagement@universal.co.za</a>
                            <br />
                            <a href="http://www.universal.co.za">www.universal.co.za</a>
                        </p>
                    </div>
                    <h5 class="accordionHeaders">
                        <a href="#">Maternity Management</a>
                    </h5>
                    <div>
                        <p style="font-family: Arial; font-size: 12px">
                            <strong><span class="style1">+27 (0)860 111 090</span></strong><br />
                            <br />
                             <strong>Universal Care (Pty) Ltd</strong><br />
                            General Enquiries: +27(0)11 208 1100<br />
                            Fax Number(s): +27 (0)86 295 7355<br />
                            Private Bag 
                            1411, Rivonia, 2128<br />
                            <a href="mailto:admin@universal.co.za">admin@universal.co.za</a>
                            <br />
                            <a href="http://www.universal.co.za">www.universal.co.za</a>
                        </p>
                    </div>
                    <h5 class="accordionHeaders">
                        <a href="#">HIV/ Aids Management</a>
                    </h5>
                    <div>
                        <p style="font-family: Arial; font-size: 12px">
                            <strong><span class="style1">+27 (0)860 111 900</span></strong><br />
                            <br />
                             <strong>Universal Care (Pty) Ltd</strong><br />
                            General Enquiries:&nbsp; +27(0)11 208 1100<br />
                            Fax Number(s):&nbsp; +27(0)86 295 7305<br />
                            Private Bag 1411, Rivonia, 2128<br />
                            <a href="mailto:diseasemanagement@universal.co.za">diseasemanagement@universal.co.za</a>
                            <br />
                            <a href="http://www.universal.co.za">www.universal.co.za</a>
                        </p>
                    </div>
                    <h5 class="accordionHeaders">
                        <a href="#">Oncology Management</a>
                    </h5>
                    <div>
                        <p style="font-family: Arial; font-size: 12px">
                            <strong><span class="style1">+27 (0)860 111 900</span></strong><br />
                            <br />
                             <strong>Universal Care (Pty) Ltd</strong><br />
                            General Enquiries:&nbsp; +27(0)11 208 1100<br />
                            Fax Number(s):&nbsp; +27(0)86 295 7307<br />
                            Private Bag 1411, Rivonia, 2128<br />
                            <a href="mailto:oncology@universal.co.za">oncology@universal.co.za</a>
                            <br />
                            <a href="http://www.universal.co.za">www.universal.co.za</a>
                        </p>
                    </div>
                    <h5 class="accordionHeaders">
                        <a href="#">Trauma Expense Recovery (MVA)</a>
                    </h5>
                    <div>
                        <p style="font-family: Arial; font-size: 12px">
                            <strong><span class="style1">+27 (0)11 208 1100</span></strong><br />
                            <br />
                             <strong>Universal Care (Pty) Ltd</strong><br />
                            Fax Number(s): +27 (0)86 
                            576 8702<br />
                            Private Bag 1411, Rivonia, 2128<br />
                            <a href="mailto:admin@universal.co.za">admin@universal.co.za</a>
                            <br />
                            <a href="http://www.universal.co.za">www.universal.co.za</a>
                        </p>
                    </div>
                    <h5 class="accordionHeaders">
                        <a href="#">Universal 360&deg;</a>
                    </h5>
                    <div>
                        <p style="font-family: Arial; font-size: 12px">
                            <strong><span class="style1">+27 (0)86 155 LIVE (5483)</span></strong><br />
                            <br />
                             <strong>Universal 360&deg;</strong><br />
                            Fax Number(s): +27 (0)86 504 1545<br />
                            Private Bag 1411, Rivonia, 2128<br />
                            <a href="mailto:360@universal.co.za">360@universal.co.za</a>
                            <br />
                            <a href="http://www.universal360.co.za">www.universal360.co.za</a>
                        </p>
                    </div>
                    <h5 class="accordionHeaders">
                        <a href="#">Chronic Medication Pre-Authorisation and Queries</a>
                    </h5>
                    <div>
                        <p style="font-family: Arial; font-size: 12px">
                            <strong><span class="style1">+27 (0)860 113 238</span></strong><br />
                            <br />
                             <strong>Mediscor</strong><br />
                            Chroniline: +27(0)86 
                            011 9553<br />
                            Helpdesk: +27(0)86 011 3238<br />
                            Fax Number(s): +27 (0)86 615 1509 / +27(0) 12 674 8001<br />
                            PO Box 8796, Centurion, 0046<br />
                            <a href="mailto:preauth@mediscor.co.za">preauth@mediscor.co.za</a>
                            <br />
                            <a href="mailto:mediscor@mediscor.co.za">mediscor@mediscor.co.za</a>
                            <br />
                            <a href="http://www.mediscor.net">www.mediscor.net</a>
                        </p>
                    </div>
                    <h5 class="accordionHeaders">
                        <a href="#">Diabetic Management</a>
                    </h5>
                    <div>
                        <p style="font-family: Arial; font-size: 12px">
                            <strong><span class="style1">+27 (0)11 712 6000</span></strong><br />
                            <br />
                             <strong>
                            The Centre for Diabetes and Endocrinology</strong><br />Fax Number(s): +27 (0)86 
                            560 5182<br />
                            PO&nbsp; Box 2900, Saxonwold, 2132<br />
                            <a href="http://www.cdecentr.co.za">www.cdecentr.co.za</a>
                        </p>
                    </div>
                    <h5 class="accordionHeaders">
                        <a href="#">Chronic Medicine Dispensing</a>
                    </h5>
                    <div>
                        <p style="font-family: Arial; font-size: 12px">
                            <strong><span class="style1">+27 (0)860 633 420</span></strong><br />
                            <br />
                             <strong>Chronic Medicine Dispensary</strong><br />
                            General Enquiries +27(0)860 633 420<br />
                            Fax Number(s): +27 (0)11 388 1630<br />
                            Postnet Suite #128, Private Bag x65, Halfway House, 1685<br />
                            <a href="mailto:help@chronicmedicine.co.za">help@chronicmedicine.co.za</a>
                            <br />
                            <a href="http://www.chronicmedicine.co.za">www.chronicmedicine.co.za</a>
                        </p>
                    </div>
                </div>
            </td>
            <td style="width:29px;"></td>
            <td style="width: 330px" valign="top" class="roundedRightColumn">
                <h1>&raquo; contact CompCare Wellness</h1>
                <table cellpadding="5" cellspacing="0">
                    <tr>
                        <td colspan="2"><asp:Label runat="server" ID="lblStatus" CssClass="successText" /><asp:Label runat="server" ID="lblError" ForeColor="Red" /></td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            <asp:Label runat="server" ID="lblName">Name:</asp:Label></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name field may not be empty"
                                ControlToValidate="tbName" ForeColor="Red"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbName" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td valign="bottom">
                            <asp:Label runat="server" ID="lblSurname">Surname:</asp:Label></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Surname field may not be empty"
                                ControlToValidate="tbSurname" ForeColor="Red"></asp:RequiredFieldValidator><br />
                            <asp:TextBox ID="tbSurname" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="bottom"><asp:Label runat="server" ID="lblEmail">Email:</asp:Label>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Not a valid email address"
                                ControlToValidate="tbEmail" ValidationExpression="^([\w\-\.]+)@((\[([0-9]{1,3}\.){3}[0-9]{1,3}\])|(([\w\-]+\.)+)([a-zA-Z]{2,4}))$"
                                ForeColor="Red"></asp:RegularExpressionValidator><br />
                            <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td ><asp:Label runat="server" ID="lblNumber">Contact Number:</asp:Label></td>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Not a valid format +27721231234 / 0123456789"
                                ValidationExpression="^((?:\+27|27)|0)(\d{2})(\d{7})$" ControlToValidate="tbNumber"
                                ForeColor="Red"></asp:RegularExpressionValidator><br />
                            <asp:TextBox ID="tbNumber" runat="server"></asp:TextBox><br />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"><br /><asp:Label ID="lblQuery" runat="server">Comment/ Query:</asp:Label></td>
                        <td><br /><asp:TextBox id="tbComments" runat="server" Rows="20" Height="100"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:right">
                            <asp:Button ID="btnSubmit" Text="Submit" runat="server" 
                                CssClass="normalButtons" onclick="btnSubmit_Click" />&nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <img src="Images/mapPlaceholder.jpg" alt="map" 
                    style="height: 270px; width: 316px" />
            
            </td>
            <td style="width:20px">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
