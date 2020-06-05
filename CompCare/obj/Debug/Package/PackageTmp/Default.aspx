<%@ Page Title="Welcome to CompCare Wellness" Language="C#" MasterPageFile="~/HomeNMP.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CompCareWebsite.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageSubNav" runat="server">
    <table cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <a href="NewMembers/Default.aspx">
                    <img src="Images/cc_r5_c5_s1.jpg" alt="Visit the New Members Section" class="borderless" /></a></td>
                <td>
                    <a href="ExistingMembers/Default.aspx">
                    <img src="Images/cc_r5_c7_s1.jpg" alt="Visit the Members Section" class="borderless" /></a></td>
                <td>
                    <a href="Brokers/Default.aspx">
                    <img src="Images/cc_r5_c10_s1.jpg" alt="Visit the CompCare Brokers Section" class="borderless" /></a></td>
                <td>
                    <a href="Providers/Default.aspx">
                    <img src="Images/cc_r5_c13_s1.jpg" alt="Visit the CompCare Providers Section" class="borderless" /></a></td>
            </tr>
        </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <br />
    <table cellpadding="0" cellspacing="0" style="width:979px">
        <tr>
            <td class="homeReasonsBox">
                <h1 >Welcome to CompCare Wellness</h1>
                <p>Welcome to the official website of CompCare Wellness Medical Scheme. This site is designed to provide Members, 
                    Potential Members and Healthcare Providers with up to date information about CompCare Wellness. Feel free to browse our site.</p>
                <p>&nbsp;</p>
                <hr />
                <p>
                    Did you know that CompCare Wellness is one of the few medical schemes in South Africa
                    that covers professional sportsmen and sportswomen? Here are some more interesting
                    facts about what makes CompCare so outstanding.
                </p>
                
            </td>
            <td class="homeOptionsBox" valign="top">
                <h1>Scheme Options</h1>
                <div>
                    <table cellpadding="5" cellspacing="0" align="left" style="width:200px">
                        <tr>
                            <td style="width:10px"><img src="Images/bullet.png" alt="" /></td>
                            <td style="width:3px">&nbsp;</td>
                            <td class="bottomDotted"><a href="TheScheme/Pinnacle.aspx">Pinnacle</a></td>
                        </tr>
                        <tr>
                            <td><img src="Images/bullet.png" alt="" /></td>
                            <td>&nbsp;</td>
                            <td class="bottomDotted"><a href="TheScheme/Dynamix.aspx">Dynamix</a></td>
                        </tr>
                        <tr>
                            <td><img src="Images/bullet.png" alt="" /></td>
                            <td>&nbsp;</td>
                            <td class="bottomDotted"><a href="TheScheme/Symmetry.aspx">Symmetry</a></td>
                        </tr>
                        <tr>
                            <td><img src="Images/bullet.png" alt="" /></td>
                            <td>&nbsp;</td>
                            <td class="bottomDotted"><a href="TheScheme/Axis.aspx">Axis</a></td>
                        </tr>
                        <tr>
                            <td><img src="Images/bullet.png" alt="" /></td>
                            <td>&nbsp;</td>
                            <td class="bottomDotted"><a href="TheScheme/Mumed.aspx">Mumed</a></td>
                        </tr>
                        <tr>
                            <td><img src="Images/bullet.png" alt="" /></td>
                            <td>&nbsp;</td>
                            <td class="bottomDotted"><a href="TheScheme/Networx.aspx">NetworX</a></td>
                        </tr>
                    </table>
                </div>
                <div style="clear:both;">
                    <br />
                    <p class="readMore"><a href="TheScheme/SchemeOptions.aspx">&raquo; Read More</a></p>
                </div>
            </td>
            <td class="homeWelcomeBlock" valign="top">
                <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;From the Principal 
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Officer</h1>
                <p style="width:210px">
                    Choosing the right medical scheme for you is one of the most important decisions 
                    you could ever make.<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="TheScheme/FromThePrincipleOfficer.aspx">&raquo; Read More</a>
</p>
            </td>
        </tr>
        <tr>
            <td colspan="3" class="radialShadow">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align:left; padding-left:20px; font-size:14px; color:Gray">
                <img src="Images/ten.jpg" style="float: left; width: 100px; height: 83px" alt="Ten good reasons why CompCare Wellness is the right scheme for you" />
                <h3 style="font-size:17px">
                    good reasons why CompCare Wellness is the right scheme for you:</h3>
                
                <ol style="margin-left:150px">
                    <li>An excellent track record spanning more than three decades </li>
                    <li>Something for everyone with a range of diverse products to choose from</li>
                    <li>Sound financial management as attested by our excellent reserve levels</li>
                    <li>You pay only for the first three child dependants – the rest are free!</li>
                    <li>Pay child dependant rates for students up to the age of 25</li>
                    <li>Unlimited oncology benefits</li>
                    <li>Unlimited Prescribed Minimum Benefits in private facilities </li>
                    <li>Unlimited general practitioner benefits on the majority of our Options </li>
                    <li>Unlimited basic dentistry benefits on most options </li>
                    <li>Free access to a lifestyle and wellness programme unlike any other</li>
                </ol>
            </td>
        </tr>
    </table>
</asp:Content>
