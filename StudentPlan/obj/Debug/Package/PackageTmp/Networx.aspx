<%@ Page Title="StudentPlan: The Networx Option" Language="C#" MasterPageFile="~/StudentPlanNMP.master" AutoEventWireup="true" CodeBehind="Networx.aspx.cs" Inherits="StudentPlan.Networx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="bodyText" runat="server">
    <h1>
        The 
        CompCare Wellness NetworX Option</h1>
    <p class="radialShadow">&nbsp;
    </p>
    <table align="right" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <img src="Images/pdfIcon.png" alt="Download pdf" />
            </td>
            <td style="width: 200px; text-align: right">
                <a href="Downloads/StudentPlanBrochure.pdf" target="_blank">Download this content to pdf&nbsp;&nbsp;</a>
            </td>
        </tr>
    </table>
    <br />
    <br /><br />
    <div id="accordion" style="margin-left:20px;margin-right:20px; width:919px; text-align:left">
        <h5 class="accordionHeaders">
            <a href="#">In-hospital Benefits</a></h5>
        <div>
            <table cellpadding="5" cellspacing="0" style="width:100%">
                <tr>
                    <td style="width:50%" valign="top">Prescribed Minimum Benefits:
Overall Annual Limit (OAL): </td>
                    <td valign="top"><ul><li>Unlimited – subject to scheme protocols</li></ul></td>
                </tr>
                <tr>
                    <td valign="top">For non-PMB and elective admissions.</td>
                    <td><ul><li>R270 000 per beneficiary & R550 000 per family.</li></ul></td>
                </tr>
            </table>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Services Covered in Hospital</a></h5>
        <div>
            <table cellpadding="5" cellspacing="0" style="width:100%">
                <tr>
                    <td valign="top" style="width:50%">100% of the Agreed Tariff (AT), subject to
the OAL, pre-authorisation and network of
private hospitals. All treatment in hospital is
subject to case management and scheme
protocols</td>
            <td><ul><li>GPs and specialists;</li>
<li>Ward fees – general, ICU and High Care;</li>
<li>Theatre fees;</li>
<li>Medication whilst in hospital;</li>
<li>Blood transfusion;</li>
<li>Oncology – chemotherapy and radiotherapy;</li>
<li>Surgical prosthesis (PMB only);</li>
<li>Clinical technologists limited to R8 000 p/f;</li>
<li>Radiology – MR, CT and PET scans;</li>
<li>Confinements limited to three days for normal births and four days for Caesarean section;</li>
<li>Psychiatric treatment is limited to 21 days in hospital;</li>
<li>Organ and bone marrow transplants, plasmapheresis and renal dialysis (PMB only);</li>
<li>Sports injuries, including professional sports; and</li>
<li>Emergency medical treatment for injuries resulting from accidents or trauma.</li></ul>
</td>
                </tr>
            </table>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Cover for Chronic Conditions</a></h5>
        <div>
            <table cellpadding="5" cellspacing="0" style="width:100%">
                <tr>
                    <td valign="top" style="width:50%">27 chronic conditions covered<br />
                        <em><span class="style1">Chronic medication is subject to the Core
Formulary list of medicines and a Formulary
Reference Price (FRP). Members are required
to register for all chronic conditions.</span></em></td>
            <td><ul><li>Chronic medication is unlimited, subject to the medicine formulary and if prescribed by a network
provider and dispensed by a network pharmacy or dispensing network doctor. Any
voluntary use of chronic medicine prescribed by out-of-network providers and any non-formulary
medicines are for the member’s own account, unless pre-authorised by the medical advisor.
PMB rules apply.</li>
<li>Subject to FRP.</li></ul></td>
                </tr>
            </table>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Day-to-day services not subject to the
Annual Flexi Benefit (AFB)</a></h5>
        <div>
            <table cellpadding="5" cellspacing="0" style="width:100%">
                <tr>
                    <td style="width:50%"></td>
            <td><ul><li>GP visits - unlimited at a selected Universal Healthcare network GP, subject to clinical necessity.</li>
<li>Two out-of-area visits p/b per annum (pay at point of service and claim back).
Claims reimbursed at 80% of the cost of the claim to a maximum of R800 per event (i.e. for
the GP consultation and all related costs).</li>
<li>Acute medication - unlimited if prescribed by a network GP and subject to medicine formulary
and FRP. Available at network pharmacies or a dispensing network GP.</li>
<li>Basic radiology - unlimited, subject to specific codes - Referral by the network GP required.</li>
<li>Basic pathology - unlimited, subject to specific codes - Referral by the network GP required.</li>
</ul>
                    </td>
                </tr>
            </table>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Day-to-day services paid from the Annual
Flexi Benefit (AFB) at 100% at the Agreed
Tariff (AT)</a></h5>
        <div>
            <table cellpadding="5" cellspacing="0" style="width:100%">
                <tr>
                    <td valign="top" style="width:50%">AFB – R2120 p/b and<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
R3180 p/f</td>
            <td>
                <ul>
                <li>Specialist consultations - (limited to two p/b, max three p/f), subject to referral by a Designated
Service Provider (DSP) network GP.</li>
 <li>Basic dentistry - (limited to one consultation p/b) including preventative care, infection control,
fillings, extractions and dental x-rays.</li>
<li>Optometry limited to one test p/b every 24 months, including lenses: clear plastic - R600 for
single vision and R750 for bi-focals, and frames.</li>
<li>Hospital emergency room/casualty emergency visits.</li>
                </ul>
            </td>
                </tr>
            </table>
        </div>
        <h5 class="accordionHeaders">
            <a href="#">Wellness: Lifestyle and Preventative Care</a></h5>
        <div>
            <table cellpadding="5" cellspacing="0" style="width:100%">
                <tr>
                    <td valign="top" style="width:50%">Paid from risk.</td>
            <td>
                <ul>
                <li>Health screenings including blood pressure, blood sugar, cholesterol, BMI and waist circumference - limited to R100 p/b
over the age of 18.</li>
<li>Flu vaccinations - one dose p/b per annum, limited to R70.</li>
                </ul>
            </td>
                </tr>
            </table>
        </div>
    </div>
  <br /><br />
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
        <img alt="" src="Images/aboutusFlash.jpg" style="width: 979px; height: 359px" />
</asp:Content>

<asp:Content ID="Content3" runat="server" 
    contentplaceholderid="CustomPageScript">
    <style type="text/css">
        .style1
        {
            font-size: small;
        }
    </style>
</asp:Content>


