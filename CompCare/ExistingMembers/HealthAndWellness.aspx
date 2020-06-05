<%@ Page Title="Health and Wellness" Language="C#" MasterPageFile="~/ExistingMembers/LoggedInNMP.master" AutoEventWireup="true" CodeBehind="HealthAndWellness.aspx.cs" Inherits="CompCare.ExistingMembers.HealthAndWellness" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageBody" runat="server">
    <h3>
        Health and Wellness</h3>
    <div class="radialShadow" style="width: 100%; height: 15px">
    </div>
    <h5>
        Your Health Details</h5>
        <p>To view more information on Universal 360&deg; and the benefits available to you and your dependants please visit <a href="http://www.universal.co.za/360/Default.aspx" target="_blank">www.universal360.co.za</a>.</p>
    <table cellpadding="5" cellspacing="5">
        <tr>
            <td colspan="2">
                <asp:Label runat="server" ID="lblError" ForeColor="Red" />
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Universal 360&deg; Membership Number:
            </td>
            <td class="otherRows">
                <b>
                    <asp:label runat="server" ID="lbl360MemberhipNumber" /></b><br />
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                Universal 360&deg; Plan:
            </td>
            <td class="otherRows">
                <b>
                    <asp:label runat="server" ID="lbl360Plan" /></b><br />
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;</td>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="5">&nbsp;</td>
        </tr>
        <tr>
            <td>Diabetic
            </td>
            <td class="otherRows">
                <b>
                    <asp:Label runat="server" ID="lblIsDiabetic" /></b><br />
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>Diabetic Start Date:
            </td>
            <td class="otherRows">
                <b>
                    <asp:Label runat="server" ID="lblDiabeticStartDate" />
                </b>
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>Diabetic End Date:
            </td>
            <td class="otherRows">
                <b>
                    <asp:Label runat="server" ID="lblDiabeticEndDate" />
                </b>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;Smoker</td>
            <td class="otherRows">
                <b>
                    <asp:Label runat="server" ID="lblIsSmoker" />
                </b>
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;Weight</td>
            <td class="otherRows">
                <b>
                    <asp:Label runat="server" ID="lblWeight" />
                </b>
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
                Height</td>
            <td class="otherRows">
                <b>
                    <asp:Label runat="server" ID="lblHeight" />
                </b>
            </td>
        </tr>
        </table>
</asp:Content>
