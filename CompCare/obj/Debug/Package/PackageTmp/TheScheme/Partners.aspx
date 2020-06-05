<%@ Page Title="CompCare Wellness: Scheme Service Providers" Language="C#" MasterPageFile="~/TheScheme/SchemeNMP.master"
    AutoEventWireup="true" CodeBehind="Partners.aspx.cs" Inherits="CompCareWebsite.TheScheme.Partners" %>
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
    <h1>Scheme Service Providers</h1>
    <br />
    <p class="radialShadow">&nbsp;</p>
    <div id="accordion">
        <h5 class="accordionHeaders">
            <a href="#">Medical Aid Administration</a></h5>
        <div>
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td>
                    <img src="../Images/pUniversalAdministrators.png" alt="" style="float:left; padding: 5px 15px 5px 5px;" /></td>
                    <td>
                    <p>Universal Administrators</p>
                    <p><a href="http://www.universaladministrators.co.za/" target="_blank">www.universaladministrators.co.za</a></p>
                    </td>
                </tr>
            </table>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Care Management</a></h5>
        <div>
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td>
                    <img src="../Images/pUniversalCare.png" alt="" style="float:left; padding: 5px 15px 5px 5px;;" /></td>
                    <td>
                    <p>Universal Care</p>
                    <p><a href="http://www.universalcare.co.za/" target="_blank">www.universalcare.co.za</a></p>
                    </td>
                </tr>
            </table>
        </div>



        <h5 class="accordionHeaders">
            <a href="#">Loyalty Programme</a></h5>
        <div>
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td>
                    <img src="../Images/pLifestyle360.png" alt="" style="float:left; padding: 5px 15px 5px 5px;;" /></td>
                    <td>
                    <p>Universal 360&deg;</p>
                    <p><a href="http://www.universal360.co.za/" target="_blank">www.universal360.co.za</a></p>
                    </td>
                </tr>
            </table>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Diabetes Management (Dynamix &amp; Pinnacle Options)</a></h5>
        <div>
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td>
                    <img src="../Images/pCDE.png" alt="" style="float: left; padding: 5px 15px 5px 5px;;" /></td>
                    <td>
                    <p>CDE Diabetes Management Programme</p>
                    <p>
                        <a href="http://www.cdecentr.co.za/" target="_blank">www.cdecentr.co.za</a></p>
                        <p><i>Please note: Diabetes Management for the remaining options is provided by Universal Care 
                            (<a href="http://www.universalcare.co.za" target="_blank" style="color:Red">www.universalcare.co.za</a>)</i></p>
                    </td>
                </tr>
            </table>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Pharmacy Benefit Manager</a></h5>
        <div>
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td>
                    <img src="../Images/pMediscor.png" alt="" style="float: left; padding: 5px 15px 5px 5px;;" /></td>
                    <td>
                    <p>Mediscor</p>
                    <p>
                        <a href="http://www.mediscor.net/" target="_blank">www.mediscor.net</a></p>
                    </td>
                </tr>
            </table>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Approved Pharmacies</a></h5>
        <div>
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td>
                    <img src="../Images/pAlphaPharm.png" alt="" style="float: left; padding: 5px 15px 5px 5px;" /></td>
                    <td>
                        <p>Alpha Pharm</p>
                        <p>
                            <a href="http://www.alphapharm.co.za/" target="_blank">www.alphapharm.co.za</a></p>
                    </td>
                </tr>
                <tr>
                    <td>
                    <img src="../Images/pClicks.png" alt="" style="float: left; padding: 5px 15px 5px 5px;" /></td>
                    <td>
                        <p>
                            Clicks</p>
                        <p>
                            <a href="http://www.clicks.co.za/" target="_blank">www.clicks.co.za</a></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="../Images/pChronic.png" alt="" style="float: left; padding: 5px 15px 5px 5px;" />
                    </td>
                    <td>
                        <p>
                            Chronic Medicine Dispensary</p>
                        <p>
                            <a href="http://www.chronicmedicine.com/" target="_blank">www.chronicmedicine.com</a></p>
                    </td>
                </tr>
                <tr>
                    <td> <img src="../Images/pDirectMedicines.png" alt="" style="float: left; padding: 5px 15px 5px 5px;" />
                    </td>
                    <td>
                        <p>
                            Direct Medicines</p>
                        <p>
                            <a href="http://www.directmedicines.co.za/" target="_blank">www.directmedicines.co.za</a></p>
                    </td>
                </tr>
                <tr>
                    <td><img src="../Images/pDischem.png" alt="" style="float: left; padding: 5px 15px 5px 5px;" />
                    </td>
                    <td>
                        <p>
                            Dischem Pharmacies</p>
                        <p>
                            <a href="http://www.dischem.co.za/" target="_blank">www.dischem.co.za</a></p>
                    </td>
                </tr>
                <tr>
                    <td><img src="../Images/pLinkPharmacy.png" alt="" style="float: left; padding: 5px 15px 5px 5px;" />
                    </td>
                    <td>
                        <p>
                            Link Pharmacy</p>
                        <p>
                            <a href="http://linkpharmacy.co.za/" target="_blank">www.linkpharmacy.co.za</a></p>
                    </td>
                </tr>
                <tr>
                    <td><img src="../Images/pMedirite.png" alt="" style="float: left; padding: 5px 15px 5px 5px;" />
                    </td>
                    <td>
                        <p>
                            Medirite</p>
                        <p>
                            <a href="http://www.medirite.co.za/" target="_blank">www.medirite.co.za</a></p>
                    </td>
                </tr>
                <tr>
                    <td><img src="../Images/pPicknPayPharmacy.png" alt="" style="float: left; padding: 5px 15px 5px 5px;" />
                    </td>
                    <td>
                        <p>Pick n Pay Pharmacy</p>
                        <p>
                            <a href="http://www.picknpay.co.za/picknpay/content/en/pharmacy-division" target="_blank">www.picknpay.co.za/picknpay/content/en/pharmacy-division</a></p>
                    </td>
                </tr>
                <tr>
                    <td><img src="../Images/pScriptSavers.png" alt="" style="float: left; padding: 5px 15px 5px 5px;" />
                    </td>
                    <td>
                        <p>
                            Script Savers</p>
                        <p>
                            <a href="http://www.scriptsavers.co.za/" target="_blank">www.scriptsavers.co.za</a></p>
                    </td>
                </tr>
                
            </table>
        </div>
    </div>
</asp:Content>
