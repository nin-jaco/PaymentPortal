<%@ Page Title="Compcare Wellness: Managed Care Initiatives" Language="C#" MasterPageFile="~/TheScheme/SchemeNMP.master"
    AutoEventWireup="true" CodeBehind="ManagedCareInitiatives.aspx.cs" Inherits="CompCareWebsite.TheScheme.ManagedCareInitiatives" %>
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
    <h1>Managed Care Initiatives</h1>
    <table align="right" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <img src="../Images/pdfIcon.png" alt="Download pdf" /></td>
            <td style="width:200px; text-align:right">
                <a href="../Downloads/ManagedCareInitiatives.pdf" target="_blank">Download this content
                    to pdf</a>
            </td>
        </tr>
    </table>
    <p>&nbsp;</p>
    <p>
        &nbsp;</p>
    <p class="radialShadow">&nbsp;</p>
    <p>
        CompCare Wellness offers members a number of Managed Care initiatives, which are
        all designed to ensure that members receive quality healthcare at an affordable
        cost. The contact details for the 3<sup>rd</sup> parties who provide these services are listed
        under the contact details. These are: </p>
    <p>
        &nbsp;</p>
    <div id="accordion">
        <h5 class="accordionHeaders">
            <a href="#">Medicine Claims Processing</a></h5>
        <div>
            <p>
                <strong>Mediscor</strong> provides a real time processing of medicine claims and members may obtain their medicines from any pharmacy linked to Mediscor.  </p><p>
The scheme reimburses medicines at a specified dispensing fee tariff. The scheme has negotiated preferred dispensing fee arrangements with various pharmacy groups.  These pharmacy groups have agreed to provide medicines at the preferred dispensing fee.  You may choose to obtain your medicines from any of these Preferred Pharmacies or you may also obtain your medicines from the pharmacy of your own choice.   If your pharmacy charges a higher dispensing fee than the scheme’s specified dispensing fee, the difference will be funded by the member. 

            </p>
            <p>
                The pharmacy groups  that provide medicines at the preferred dispensing fee include: </p>
            <ul>
                <li>Alpha Pharm
</li>
                <li>Clicks
</li>
                <li>Dis-Chem
</li>
                <li>Link
</li>
                <li>MediRite</li>
                <li>Opti-Me
</li>
                <li>Pick n Pay
</li>
                <li>Script Savers </li>
            </ul>
            <p>

Members may also make use of the following courier pharmacies: </p>
            <ul>
                <li>Chronic Medicines Dispensary (CMD)  
</li>
                <li>Clicks </li>
                <li>Direct Medicines</li>
                <li>Optipharm</li>
                <li>Medipost. </li>
            </ul>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Chronic Medication Pre-authorisation</a></h5>
        <div>
            <p>
                Members are required to register chronic medication prescriptions with 
                <strong>Mediscor</strong>
                to receive the chronic medication benefit.</p>
            <p>
                To register your chronic medication prescription with Mediscor, you, your doctor
                or your pharmacist need to contact Mediscor’s ChroniLine or send an e-mail to Mediscor.
                The Chronic medicine registration process and formularies may be viewed on Mediscor’s
                website. This process is quick and easy - chronic medication application forms are
                no longer required.</p>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Hospital Utilisation Management</a></h5>
        <div>
            <p>
                <strong>Universal Care</strong> offers a complete hospital utilisation
management service. It is the member’s responsibility to
ensure that all non-emergency hospital admissions are
authorised. These must be authorised at least 48 hours prior
to admission. The member, doctor or hospital may phone in
for this authorisation. A penalty will apply for late requests for
authorisations. Emergency admissions must be authorised on
the first working day after admission. There will be a penalty
if the member does not obtain authorisation. This service also
applies to Oncology treatment.</p>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Disease Management</a></h5>
        <div>
            <p>
                <strong>Universal Care</strong> offers a comprehensive disease management service including HIV/AIDS
                counselling. This service is designed to empower members to manage their chronic
                conditions more effectively. Members are provided with telephonic counselling, e-mail
                information as well as on-line health and wellness information. This information
                can be communicated to the patient via: the Disease Management call centre, internet,
                e-mail, fax, post and physical handout point.</p>
            <p>
                All CompCare Wellness members and their adult dependants diagnosed with a chronic
                condition such as HIV/AIDS, asthma, diabetes, hypertension etc should register on
                the Disease Management programme. By registering, an individual will have access
                to personalised health and wellness Information.</p>
            <p>
                Members are also invited to phone the Disease Management Call Centre should they
                wish to speak to a nurse counsellor.</p>
            <p>
                The <strong>Centre for Diabetes and Endocrinology (CDE)
                </strong>may be used for members with diabetes
                and who are insulin dependent. The CDE is only available to members on the Pinnacle
                and Dynamix options.</p>
            <p>
                CDE is a diabetic centre that provides a multidisciplinary team approach to the
                management of diabetes. The team includes diabetic specialists, diabetic educators,
                dieticians, podiatrists and a resident clinical psychologist.</p>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Pathology Management</a>
        </h5>
        <div>
            <p>
                <strong>Universal Care</strong> provides a service that ensures that the standard pathology guidelines
                are followed.</p>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Specialised Dentistry Management</a>
        </h5>
        <div>
            <p>
                <strong>Universal Care</strong> offers a pre-authorisation service for all specialised dentistry.
                Prior to having specialised dentistry the member is required to obtain pre-authorisation.</p>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Trauma Expense Recovery</a>
        </h5>
        <div>
            <p>
                <strong>Universal Care </strong>offers a service where medical expenses that are the liability of
                a 3<sup>rd</sup> party are recovered for CompCare. In most cases these recoveries refer to
                road accidents where a 3<sup>rd</sup> party was involved.</p>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Emergency Evacuation</a>
        </h5>
        <div>
            <p>
                <strong>ER24</strong> offers an emergency evacuation service that will transport members to the nearest
                hospital for treatment. Members have access to this benefit in and outside of the
                borders of South Africa (worldwide).</p>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Medical Advice, Information and Assistance</a>
        </h5>
        <div>
            <p>
                <strong>ER24</strong> personnel, including paramedics, nurses and doctors are available 24 hours
                a day to provide general medical information and advice. This is an advisory service
                as a telephone conversation does not permit an accurate diagnosis.</p>
            <p>
                In addition to general medical advice, ER24 medical operators can also guide you
                through a medical crisis situation, provide emergency advice and organise for you
                to receive the support you need.</p>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Fraud detection</a>
        </h5>
        <div>
            <p>
                Fraud is a major problem in South Africa and the healthcare arena is no exception.
                CompCare have been very successful in containing fraud by making use of a system
                of member and practitioner profiling and forwarding this information to a private
                investigation unit.</p>
        </div>
    </div>
</asp:Content>
