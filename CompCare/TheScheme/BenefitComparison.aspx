<%@ Page Title="Compcare Wellness: Benefit Comparison" Language="C#" MasterPageFile="~/TheScheme/SchemeNMP.master"
    AutoEventWireup="true" CodeBehind="BenefitComparison.aspx.cs" Inherits="CompCareWebsite.TheScheme.BenefitComparison" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
    <style type="text/css">


    </style>
    <!-- because ie is a little different with its positioning... -->
    <!--[if lte IE 8]>
<style type="text/css">
#formcontainer {
	top:34px;
}
    .choiceA
    {
    }
    .choiceB
    {
    }
    .choiceD
    {
    }
    .choiceE
    {
    }
    .choiceF
    {
    }
</style>
<![endif]-->
    <script type="text/javascript">
/*
	For functions getElementsByClassName, addClassName, and removeClassName
	Copyright Robert Nyman, http://www.robertnyman.com
	Free to use if this text is included
*/
function getElementsByClassName(className, tag, elm){
	var testClass = new RegExp("(^|\\s)" + className + "(\\s|$)");
	var tag = tag || "*";
	var elm = elm || document;
	var elements = (tag == "*" && elm.all)? elm.all : elm.getElementsByTagName(tag);
	var returnElements = [];
	var current;
	var length = elements.length;
	for(var i=0; i<length; i++){
		current = elements[i];
		if(testClass.test(current.className)){
			returnElements.push(current);
		}
	}
	return returnElements;
}

function addClassName(elm, className){
    var currentClass = elm.className;
    if(!new RegExp(("(^|\\s)" + className + "(\\s|$)"), "i").test(currentClass)){
        elm.className = currentClass + ((currentClass.length > 0)? " " : "") + className;
    }
    return elm.className;
}

function removeClassName(elm, className){
    var classToRemove = new RegExp(("(^|\\s)" + className + "(\\s|$)"), "i");
    elm.className = elm.className.replace(classToRemove, "").replace(/^\s+|\s+$/g, "");
    return elm.className;
}

function hasClass(el, c) {
  if (!el || !el.className.length) return;
  var bits = el.className.split(' '), has = false;
  for (var j = 0; j < bits.length; j++) if (bits[j] === c) has = true;
  return has;
}

function activateThisColumn(column) {
  var table = document.getElementById('pricetable');
  var form = document.getElementById('formcontainer');

  // first, remove the 'on' class from all other th's
  var ths = table.getElementsByTagName('th');
  for (var g=0; g<ths.length; g++) {
    removeClassName(ths[g], 'on');
    if (!hasClass(ths[g],'side')) {
      ths[g].style.display = 'none';
    }
  }
  // then, remove the 'on' class from all other td's
  var tds = table.getElementsByTagName('td');
  for (var m=0; m<tds.length; m++) {
    removeClassName(tds[m], 'on');
    if (!hasClass(tds[m],'side')) {
      tds[m].style.display = 'none';
    }
  }

  // now, add the class 'on' to the selected th
  var newths = getElementsByClassName(column, 'th', table);
  for (var h=0; h<newths.length; h++) {
    addClassName(newths[h], 'on');
    newths[h].style.display = '';
    // not all browsers like display = 'block' for cells
  }
    // and finally, add the class 'on' to the selected td
  var newtds = getElementsByClassName(column, 'td', table);
  for (var i=0; i<newtds.length; i++) {
    addClassName(newtds[i], 'on');
    newtds[i].style.display = '';
    // not all browsers like display = 'block' for cells
  }
  // show the form!
  form.style.display = 'block';
}

function hideTheForm() {
	// get the form
	var form = document.getElementById('formcontainer');
	// hide the form
	form.style.display = 'none';
	
	// now get the hidden table cells and show them again
	var table = document.getElementById('pricetable');
	var tds = table.getElementsByTagName('td');
	for (var i=0; i<tds.length; i++) {
		tds[i].style.display = '';
	}
	var ths = table.getElementsByTagName('th');
	for (var k=0; k<ths.length; k++) {
		ths[k].style.display = '';
	}
}

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageBody" runat="server">
    <h1>
        Benefit Comparison</h1>
    <table align="right" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <img src="../Images/pdfIcon.png" alt="Download pdf" />
            </td>
            <td style="width: 200px; text-align: right">
                <a href="../Downloads/ComparativeBenefitSummary.pdf" target="_blank">Download this content to pdf</a>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <p class="radialShadow">&nbsp;</p>
    <p>
        <em>“This is a summary of the benefits of CompCare Wellness Medical Scheme. A copy of
        the current Rules may be obtained from the Administrator, if so required. The Rules
        of the Scheme will always take precedence over this summary.”
    </em>
    </p>
    <p><em>If you would like a CompCare representative to contact you, please click on one of the "Select" buttons below.</em></p>
    <div id="prices">
        <div id="formcontainer" style="display: none;">
            <form action="#">
            <h2 style="margin-left:20px; margin-top:5px">
                &raquo; let us contact you!</h2>
            <fieldset>
                <label for="email" class="password" style="margin-left:20px; margin-top:10px">
                    Name<br />
                    <asp:TextBox runat="server" ID="tbName" />
                </label>
                <label for="email" class="retype" style="margin-top: 10px">
                    Email<br />
                    <asp:TextBox runat="server" ID="tbEmail" />
                </label>
                <label for="Telephone" class="password" style="margin-left: 20px;">
                    Telephone<br />
                    <asp:TextBox runat="server" id="tbTelephone" />
                </label>
                <label for="Cellular" class="retype">
                    Cellular Number<br />
                    <asp:Textbox runat="server" id="tbCellularNumber"  />
                </label>
            </fieldset>
            <fieldset class="buttons">
                <input type="text" class="normalButtons" onclick="hideTheForm();return false;" value="Back" />
                <asp:Button ID="btnSubmit" CssClass="normalButtons" Text="Submit" OnClick="btnSubmit_Clicked" runat="server" />
            </fieldset>
            </form>
        </div>
        <table id="pricetable" cellspacing="0">
            <thead>
            <tr>
                <th class="side">
                    Benefit
                </th>
                <th class="choiceA">
                    Pinnacle
                </th>
                <th class="choiceB">
                    Dynamix
                </th>
                <th class="choiceC on">
                    Symmetry
                </th>
                <th class="choiceD">
                    Mumed
                </th>
                <th class="choiceE">
                    Axis
                </th>
                <th class="choiceF">
                    NetworX
                </th>
            </tr>
            </thead>
            <tbody class="priceBody">
                <tr>
                    <td class="side">
                        &nbsp;
                    </td>
                    <td class="choiceA">
                        <a href="signUpChoiceA.html" onclick="activateThisColumn('choiceA');return false;">
                            <img src="../Images/choose.gif" alt="Choose" /></a>
                    </td>
                    <td class="choiceB">
                        <a href="signUpChoiceB.html" onclick="activateThisColumn('choiceB');return false;">
                            <img src="../Images/choose.gif" alt="Choose" /></a>
                    </td>
                    <td class="choiceC on">
                        <a href="signUpChoiceC.html" onclick="activateThisColumn('choiceC');return false;">
                            <img src="../Images/choose.gif" alt="Choose" /></a>
                    </td>
                    <td class="choiceD">
                        <a href="signUpChoiceD.html" onclick="activateThisColumn('choiceD');return false;">
                            <img src="../Images/choose.gif" alt="Choose" /></a>
                    </td>
                    <td class="choiceE">
                        <a href="signUpChoiceE.html" onclick="activateThisColumn('choiceE');return false;">
                            <img src="../Images/choose.gif" alt="Choose" /></a>
                    </td>
                    <td class="choiceF">
                        <a href="signUpChoiceF.html" onclick="activateThisColumn('choiceF');return false;">
                            <img src="../Images/choose.gif" alt="Choose" /></a>
                    </td>
                </tr>
            <tr>
                <td class="side">
                    <em>In Hospital</em>
                </td>
                <td class="choiceA">
                </td>
                <td class="choiceB">
                </td>
                <td class="choiceC on">
                </td>
                <td class="choiceD">
                </td>
                <td class="choiceE">
                </td>
                <td class="choiceF">
                </td>
            </tr>
            <tr>
                <td class="side">
                    Private Hospitals
                </td>
                <td class="choiceA">
                    Yes
                </td>
                <td class="choiceB">
                    Yes
                </td>
                <td class="choiceC on">
                    Yes
                </td>
                <td class="choiceD">
                    Yes
                </td>
                <td class="choiceE">
                    Yes
                </td>
                <td class="choiceF">
                    Yes, within Network
                </td>
            </tr>
            <tr>
                <td style="height: 23px" class="side">
                    Limits
                </td>
                <td style="height: 23px" class="choiceA">
                    Unlimited
                </td>
                <td style="height: 23px" class="choiceB">
                    Unlimited
                </td>
                <td style="height: 23px" class="choiceC on">
                    Unlimited
                </td>
                <td class="choiceD">
                    R550 000 p/b R1 100 000 p/f
                </td>
                <td class="choiceE">
                    Unlimited
                </td>
                <td class="choiceF">
                    R270 000 p/b R550 000 p/f
                </td>
            </tr>
            <tr>
                <td class="side">
                    Specialists rate (AT = Agreed tariff)
                </td>
                <td class="choiceA">
                    200% AT
                </td>
                <td class="choiceB">
                    100% AT
                </td>
                <td class="choiceC on">
                    100% AT
                </td>
                <td class="choiceD">
                    100% AT
                </td>
                <td class="choiceE">
                    100% AT
                </td>
                <td class="choiceF">
                    100% AT
                </td>
            </tr>
            <tr>
                <td class="side">
                    Specialised Radiology including MRI, CT and PET Scans
                </td>
                <td class="choiceA">
                    100% AT Unlimited - first R2 000
subject to MSA/AFB/SPG.
Accumulate to threshold
                </td>
                <td class="choiceB">
                    100% AT Unlimited - first R2 000
subject to MSA/AFB/SPG.
Accumulate to threshold
                </td>
                <td class="choiceC on">
                    100% AT limited to R12 720 p/f
                </td>
                <td class="choiceD">
                    100% AT limited to R11 000 p/f
                </td>
                <td class="choiceE">
                    100% AT limited to R12 720 p/f
                </td>
                <td class="choiceF">
                    100% AT subject to protocols and pre-auth,
subject to AHL
                </td>
            </tr>
            <tr>
                <td class="side">
                    Basic Radiology
                </td>
                <td class="choiceA">
                    100% AT Unlimited
                </td>
                <td class="choiceB">
                    100% AT Unlimited
                </td>
                <td class="choiceC on">
                    100% AT Unlimited
                </td>
                <td class="choiceD">
                    100% AT limited to R20 000 p/f
                </td>
                <td class="choiceE">
                    100% AT Unlimited
                </td>
                <td class="choiceF">
                    100% AT subject to protocols and pre-auth, subject to OAL
                </td>
            </tr>
            <tr>
                <td class="side">
                    Basic Pathology
                </td>
                <td class="choiceA">
                    100% AT Unlimited
                </td>
                <td class="choiceB">
                    100% AT Unlimited
                </td>
                <td class="choiceC on">
                    100% AT limited to R20 000 p/f
                </td>
                <td class="choiceD">
                    100% AT limited to R22 000 p/f
                </td>
                <td class="choiceE">
                    100% AT Unlimited
                </td>
                <td class="choiceF">
                    100% AT subject to protocols and pre-auth,
subject to AHL
                </td>
            </tr>
            <tr>
                <td class="side">
                    Co-Payments
                </td>
                <td class="choiceA">
                    As per list, can select to pay it from
available MSA with no accumulation
to threshold
                </td>
                <td class="choiceB">
                    As per list, can select to pay it from
available MSA with no accumulation
to threshold
                </td>
                <td class="choiceC on">
                    As per list
                </td>
                <td class="choiceD">
                    As per list
                </td>
                <td class="choiceE">
                    As per list
                </td>
                <td class="choiceF">
                    Exclusion List Applicable
                </td>
            </tr>
            <tr>
                <td class="side">
                    Oncology
                </td>
                <td class="choiceA">
                    Unlimited subject to pre-auth and protocols. DSP only
                </td>
                <td class="choiceB">
                    Unlimited subject to pre-auth and protocols. DSP only
                </td>
                <td class="choiceC on">
                    Unlimited subject to pre-auth and protocols. DSP only
                </td>
                <td class="choiceD">
                    Limited to AHL subject to pre-auth and
protocols. DSP only
                </td>
                <td class="choiceE">
                   Limited to AHL subject to pre-auth and
protocols. DSP only
                </td>
                <td class="choiceF">
                    Subject to protocols. DSP only
                </td>
            </tr>
            <tr>
                <td class="side">
                    <em>Day to day benefits
                </em>
                </td>
                <td class="choiceA">
                </td>
                <td class="choiceB">
                </td>
                <td class="choiceC on">
                </td>
                <td class="choiceD">
                </td>
                <td class="choiceE">
                </td>
                <td class="choiceF">
                </td>
            </tr>
            <tr>
                <td class="side">
                    Description
                </td>
                <td class="choiceA">Claims are initially paid from the annual
Medical Savings Account (20% of
contributions). Once savings become
exhausted claims are paid from an
Annual Flexi Benefit (AFB) equal to 5% of
contributions, where after the member is
liable for the Self Payment Gap. During this
period claims will accumulate to the Threshold
Level at the Agreed Tariff (AT). Once the
Threshold Level is reached, specific above
threshold benefits will be available up to an
overall above threshold limit of R6 360 p/b
and R12 720 p/f, with sub-limits
                </td>
                <td class="choiceB">Claims are paid at 100% of the AT, from
the annual Medical Savings Account
(15% of contributions). Once savings become
exhausted claims are paid from an
Annual Flexi Benefit (AFB) equal to 5% of
contributions, where after the member is
liable for the Self Payment Gap. During
this period claims will accumulate to the
Threshold Level at the Agreed Tariff (AT).
Once the Threshold Level is reached, specific
above threshold benefits will be available
up to a limit of R4 240 p/b and R8 480 p/f,
with sub-limits
                </td>
                <td class="choiceC on">
                    Claims are initially paid from the Medical
Savings Account (MSA), thereafter claims are paid
from an Annual Flexi benefit (AFB). Once the AFB is
exhausted certain additional benefits are available
                    <br />
                    MSA:
P: R 2 916
A: R1 860
C: R684
                    <br />
                    AFB limit:
P: R2 914
A: R1 850
C: R694
                </td>
                <td class="choiceD">
                    Claims are initially paid from the Medical
Savings Account (MSA), thereafter claims
are paid from an Annual Flexi benefit (AFB).
Once the AFB is exhausted certain
additional benefits are available
                    <br />
                    MSA:
P: R 2 196
A: R1 380
C: R552
                    <br />
                    AFB limit:
P: R2 204
A: R1 370
C: R548
                </td>
                <td class="choiceE">
                    PMB cover.
Post operative rehabilitation benefits for
physiotherapy, occupational therapy and
biokinetics, limited to R2 300 for 14 days.
Pre-authorisation, PMB's and protocols apply
                </td>
                <td class="choiceF">
                    If services are rendered by DSP Network providers,
benefits will be paid at the Agreed Tariff (AT) up
to specified limits. Some benefits are subject to an
Annual Flex Benefit (AFB): R2 120 p/b, R3 180 p/f
                </td>
            </tr>
            
            <tr>
                <td class="side">
                    Chronic medicines
                </td>
                <td class="choiceA">
                    Subject to the Mediscor Standard formulary,
MRP applies. Covers 72 Conditions (26 CDL
and 46 Non-CDL). Unlimited for 26 CDL
conditions. Non-CDL Chronic medication is
paid from the MSA, AFB and the Self Payment
Gap - limited to R8 480 p/b and R12 720 p/f.
Above threshold benefits are limited to
R3 180 p/f, subject to the overall above
threshold limit. Insulin dependant patients can
join diabetes program with preferred provider
CDE. 25% co-payment for voluntary use of
non-formulary or non generic medicines. Have
the choice to pay co-payments from available
MSA with no accumulation to threshold
                </td>
                <td class="choiceB">
                    Subject to the Mediscor Standard formulary,
MRP applies. Covers 61 Conditions
(26 CDL and 36 Non-CDL). Unlimited for
26 CDL conditions. Non-CDL Chronic
medication is paid from the MSA, AFB,
and Self Payment Gap - limited to R6 360 p/b
and R10 600 p/f. Above threshold benefits
are limited to R2 120 p/f, subject to the
overall above threshold limit. Insulin dependant
patients can join diabetes program with
preferred provider CDE. 25% co-payment
for voluntary use of non-formulary or
non-generic medicines. Have the choice to
pay these co-payments from available savings
with no accumulation to threshold
                </td>
                <td class="choiceC on">
                    Subject to the Mediscor Basic formulary, MRP
applies. Covers 46 Conditions (26 CDL and
20 Non-CDL). R3 180 p/b and R4 770 p/f for CDL
and non-CDL chronic medication. Once the benefit
is depleted, CDL medicines are unlimited.
Not subject to MSA or AFB. 25% co-payment for
voluntary use of non-formulary or
non-generic medicines
                </td>
                <td class="choiceD">
                    Subject to the Mediscor Basic formulary,
MRP applies. Covers 26 CDL conditions and
1 non-CDL condition. Unlimited and not
subject to MSA or AFB. 25% co-payment
for voluntary use of non-formulary on
non-generic medicines
                </td>
                <td class="choiceE">
                    Subject to the Mediscor Core formulary,
MRP applies. Covers 26 CDL conditions
and 1 non-CDL condition. Unlimited. 25%
Co-payment for voluntary use of
non-formulary or non-generic medicines
                </td>
                <td class="choiceF">
                    Subject to the Universal Care formulary, FRP
applies. 26 CDL conditions and 1 non-CDL condition.
Unlimited only if prescribed by DSP network
provider and dispensed within Network pharmacy
or dispensing doctor. Voluntary use of chronic out
of network as well as use of non-formulary
medication will be for the member's own account
                </td>
            </tr>
            <tr>
                <td class="side">
                    Other prescribed
medicines/Acute
medicines 25%
co-payment on all
non-generic medicines
                </td>
                <td class="choiceA">
                    Initially paid from the member's MSA, AFB
and Self Payment Gap, thereafter an above
threshold benefit of R2 650 p/f is available,
subject to the overall above threshold limit
                </td>
                <td class="choiceB">
                    Initially paid from the member's MSA, AFB
and Self Payment Gap, thereafter an above
threshold limit of R2 120 p/f is available,
subject to overall above threshold limit
                </td>
                <td class="choiceC on">
                    Paid from family MSA and AFB
                </td>
                <td class="choiceD">
                    Paid from family MSA and AFB
                </td>
                <td class="choiceE">
                    No benefit
                </td>
                <td class="choiceF">
                    Unlimited if prescribed by a DSP network GP or by
a specialist if the specialist was referred by a
network DSP GP. No cover for non formulary
medicine or out of network GP/Specialist
                </td>
            </tr>
            <tr>
                <td class="side">
                    GP Visits
                </td>
                <td class="choiceA">
                    Subject to MSA, AFB and Self Payment Gap
thereafter unlimited. Paid at 100% AT
                </td>
                <td class="choiceB">
                   Subject to MSA, AFB and Self Payment Gap
thereafter unlimited. Paid at 100% AT
                </td>
                <td class="choiceC on">
                    Initially paid from family MSA and AFB, thereafter
unlimited. Paid at 100% AT. Unlimited consultations
excludes any room procedures and materials
                </td>
                <td class="choiceD">
                    Initially paid from family MSA and AFB, thereafter balance of specified nr of 
                    visits available. Balance of visits after MSA and AFB are depleted excludes room 
                    procedures and materials. M: 6 visits, M + 1: 8 visits, M + 2: 10 visits, M + 
                    3+: 11 visits
                </td>
                <td class="choiceE">
                    No benefit
                </td>
                <td class="choiceF">
                    Unlimited at a DSP network GP</td>
            </tr>
            <tr>
                <td class="side">
                    Specialist
                </td>
                <td class="choiceA">
                    200% AT. Initially paid from MSA, AFB, Self
Payment Gap, thereafter an above threshold
benefit of R3 180 p/f subject to overall
above threshold benefit
                </td>
                <td class="choiceB">
                    100% AT. Initially paid from MSA, AFB
and Self Payment Gap, thereafter an
above threshold benefit of R2 750 p/f
subject to overall above threshold benefit
                </td>
                <td class="choiceC on">
                    100% AT. Initially paid from family MSA, thereafter
the AFB
                </td>
                <td class="choiceD">
                    100% AT. Initially paid from family MSA,
thereafter the AFB
                </td>
                <td class="choiceE">
                    No benefit
                </td>
                <td class="choiceF">
                    100% AT. 2 visits p/b, max 3 per annum. Two additional ante-natal visits per 
                    pregnancy. Subject to referral by DSP network GP. Pre-auth required for 
                    specialist consult. Subject to AFB</td>
            </tr>
            <tr>
                <td class="side">
                    Radiology and Pathology
                </td>
                <td class="choiceA">
                    Initially paid from MSA, AFB and Self Payment
Gap, thereafter an above threshold benefit
of R3 180 p/f, subject to overall above
threshold benefit
                </td>
                <td class="choiceB">
                    Initially paid from MSA, AFB and Self Payment
Gap, thereafter an above threshold benefit
of R2 120 p/f, subject to overall above
threshold benefit
                </td>
                <td class="choiceC on">
                    100% AT. Initially paid from family MSA, thereafter
the AFB
                </td>
                <td class="choiceD">
                    100% AT. Initially paid from family MSA, thereafter the AFB</td>
                <td class="choiceE">
                    No benefit</td>
                <td class="choiceF">
                    Unlimited (subject to specific codes) if referred by network DSP GP</td>
            </tr>
            <tr>
                <td class="side">
                    Conservative dentistry
                </td>
                <td class="choiceA">
                    Subject to MSA, AFB and Self Payment Gap, thereafter unlimited
                </td>
                <td class="choiceB">
                    Subject to MSA and Self Payment Gap, thereafter unlimited
                </td>
                <td class="choiceC on">
                    Initially paid from AFB, thereafter unlimited
                </td>
                <td class="choiceD">
                    100% AT. Initially paid from family MSA and AFB, thereafter unlimited</td>
                <td class="choiceE">
                    No benefit</td>
                <td class="choiceF">
                    Paid from the AFB. One consult p/b per annum. Preventative care, infection 
                    control, fillings, extractions and dental x-rays. Subject to protocols</td>
            </tr>
            <tr>
                <td class="side">
                    Specialised dentistry
                </td>
                <td class="choiceA">
                    100% AT. Paid from MSA and AFB limited to
R10 600 p/b. No above threshold benefit</td>
                <td class="choiceB">
                    100% AT. Paid from MSA and AFB limited
to R 8 000 p/b and R11 130 p/f including
hospital and related costs. No above
threshold benefit
                </td>
                <td class="choiceC on">
                    100% AT. Paid from family MSA and AFB. Limited
to R5 340 p/b, subject to scheme protocols
                </td>
                <td class="choiceD">
                    100% AT. Paid from family MSA and AFB. Limited to R1 430 p/b, subject to scheme 
                    protocols</td>
                <td class="choiceE">
                    No benefit</td>
                <td class="choiceF">
                    No benefit unless PMB. Subject to protocols and AFB</td>
            </tr>
            <tr>
                <td class="side">
                    Optometry Consultation &amp; Lenses
                </td>
                <td class="choiceA">
                    x2 Eye examinations p/b, paid from MSA and
AFB. Lenses subject to MSA and AFB, limited
to R3 180 p/b. No above threshold benefit
                </td>
                <td class="choiceB">
                   x2 Eye examinations p/b, paid from MSA and
AFB. Lenses subject to MSA and AFB, limited
to R2 550 p/b. No above threshold benefit
                </td>
                <td class="choiceC on">
                    x1 Eye examination p/b. Initially paid from MSA and
AFB, thereafter the balance of the limit applies -
limited to R1 430 p/b
                </td>
                <td class="choiceD">
                    x1 Eye examination p/b. Initially paid from MSA and AFB, limited to R1 100 p/b 
                    max R3 190 p/f</td>
                <td class="choiceE">
                    No benefit</td>
                <td class="choiceF">
                    1 visit p/b every second year. Subject to AFB. Clear plastic single vision 
                    (limited to R640) or bifocal lenses (limited to R800) every second year. No 
                    benefit for contact lenses. Subject to AFB</td>
            </tr>
            <tr>
                <td class="side">
                    Optometry Frames
                </td>
                <td class="choiceA">
                    Max of R1 600 - 1 frame p/b per annum -
included in lenses limit
                </td>
                <td class="choiceB">
                    Max of R1 060 - 1 frame p/b per annum -
included in lenses limit
                </td>
                <td class="choiceC on">
                    Max of R750 - 1 frame p/b per annum - included
in lenses limit
                </td>
                <td class="choiceD">
                    Max of R550 - 1 frame p/b per annum - included in lenses limit</td>
                <td class="choiceE">
                    No benefit</td>
                <td class="choiceF">
                    Limited to range of frames within DSP network. Subject to AFB</td>
            </tr>
            <tr>
                <td class="side">
                    Auxiliaries
                </td>
                <td class="choiceA">
                    Paid from MSA, AFB and Self Payment Gap
- limited to R5 300 p/f thereafter an above
threshold benefit of R2 120 p/f for
physiotherapy and biokinetics, subject to
overall above threshold benefit
                </td>
                <td class="choiceB">
                   Paid from MSA, AFB and Self Payment Gap
- limited to R3 700 p/f thereafter an above
threshold benefit of R1 375 p/f for
physiotherapy and biokinetics, subject to
overall above threshold benefit
                </td>
                <td class="choiceC on">
                    100 % AT. Paid from MSA and AFB, limited to
R2 120 p/b
Comparative Benefit Summary
This booklet is a summary of the benefits of CompCare Wellness Medical Scheme. A copy of the current rules may be obtained from the
                </td>
                <td class="choiceD">
                    100% AT. Paid from MSA and AFB, limited to R1 375 p/b and R2 200 p/f</td>
                <td class="choiceE">
                    No benefit</td>
                <td class="choiceF">
                    No benefit unless PMB. Subject to protocols and AFB</td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td class="side">
                    
                </td>
                <td class="choiceA">
                    
                </td>
                <td class="choiceB">
                    
                </td>
                <td class="choiceC on">
                   
                </td>
                <td class="choiceD">
                    
                </td>
                <td class="choiceE">
                    
                </td>
                <td class="choiceF">
                    
                </td>
            </tr>
        </tfoot>
    </table>
    </div>
</asp:Content>
