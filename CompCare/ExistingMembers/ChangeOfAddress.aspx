<%@ Page Title="Compcare Wellness: Change of Address" Language="C#" MasterPageFile="~/ExistingMembers/LoggedInNMP.master"
    AutoEventWireup="true" CodeBehind="ChangeOfAddress.aspx.cs" Inherits="CompCare.ExistingMembers.ChangeOfAddress" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
        <script type="text/javascript" src="../Scripts/jquery-1.4.4.js"></script>

   <%-- <script type="text/javascript">

        $(document).ready(function () {
            alert("ready");
        });
        $('#cInitials').click(function () {
            alert('Handler for .click() called.');
        });

        $('#target').click(function () {
            alert('Handler for .click() called.');
        });
    </script>--%>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageBody" runat="server">
    <table cellpadding="5" cellspacing="0">
        <tr>
            <td style="width: 20px">
                &nbsp;
            </td>
            <td style="width: 100%; text-align: left">
                <h3>
                    Update your Details</h3>
                <div class="radialShadow" style="width: 100%; height: 15px">
                </div>
                <h5>
                    New Contact Details</h5>
                <p>
                    Please only provide those details that have changed in the form below.&nbsp; 
                    Please note that your contact details is managed centrally by the administrative 
                    department and by submitting this form they will be notified of the changes to 
                    your contact details.&nbsp; This method does not directly update the database 
                    and you may be contacted by the admin department to verify the changes requested 
                    in this form.</p>
                            <table cellpadding="5" cellspacing="5" align="center">
                                <tr>
                                    <td colspan="3">

                                        <asp:Label runat="server" ID="lblError" ForeColor="Red" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Email:
                                    </td>
                                    <td class="otherRows"><asp:Label ID="lblEmail" runat="server" 
                                            style="font-weight: 700"></asp:Label>
                                        <asp:TextBox runat="server" ID="tbEmail" /></td>
                                    <td class="otherRows">
                                        <asp:Button CssClass="btnChange" runat="server" ID="chEmail" 
                                            onclick="chEmail_Click" /></td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Home Telephone Number:</td>
                                    <td class="otherRows"><asp:Label ID="lblTelephone" runat="server" 
                                            style="font-weight: 700" />
                                        <asp:TextBox runat="server" ID="tbTelephone" />
                                            </td>
                                    <td class="otherRows">
                                        <asp:Button CssClass="btnChange" runat="server" ID="chTel" 
                                            onclick="chTel_Click" /></td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Cellular Number:</td>
                                    <td class="otherRows"><asp:Label runat="server" ID="lblCellular" 
                                            style="font-weight: 700"></asp:Label>
                                        <asp:TextBox runat="server" ID="tbCellular" />
                                    </td>
                                    <td class="otherRows">
                                        <asp:Button CssClass="btnChange" runat="server" ID="chCell" 
                                            onclick="chCell_Click" /></td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Work Telephone Number:
                                    </td>
                                    <td class="otherRows">
                                        <asp:Label runat="server" ID="lblWorkNumber" Style="font-weight: 700"></asp:Label>
                                        <asp:TextBox runat="server" ID="tbWorkNumber" />
                                    </td>
                                    <td class="otherRows">
                                        <asp:Button CssClass="btnChange" runat="server" ID="chWork" 
                                            onclick="chWork_Click" /></td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Fax Number:
                                    </td>
                                    <td class="otherRows">
                                        <asp:Label runat="server" ID="lblFaxNumber" Style="font-weight: 700"></asp:Label>
                                        <asp:TextBox runat="server" ID="tbFaxNumber" />
                                    </td>
                                    <td class="otherRows">
                                        <asp:Button CssClass="btnChange" runat="server" ID="chFax" 
                                            onclick="chFax_Click" /></td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Postal Address:
                                    </td>
                                    <td class="otherRows">
                                        <div runat="server" id="groupPostalLB">
                                        <b>
                                            <asp:Label runat="server" ID="lblAddress1" /><br />
                                            <asp:Label runat="server" ID="lblAddress2" /><br />
                                            <asp:Label runat="server" ID="lblAddress3" /><br />
                                            <asp:Label runat="server" ID="lblAddress4" /><br />
                                            <asp:Label runat="server" ID="lblPostalCode" />
                                        </b>
                                        </div>
                                        <div runat="server" id="groupPostalTB">
                                            <asp:TextBox runat="server" ID="tbAdddress1" /><br />
                                            <asp:TextBox runat="server" ID="tbAddress2" /><br />
                                            <asp:TextBox runat="server" ID="tbAddress3" /><br />
                                            <asp:TextBox runat="server" ID="tbAddress4" /><br />
                                            <asp:TextBox runat="server" ID="tbPostalCode" />
                                       </div>
                                    </td>
                                    <td class="otherRows">
                                        <asp:Button CssClass="btnChange" runat="server" ID="chPostal" 
                                            onclick="chPostal_Click" /></td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        Physical Address:
                                    </td>
                                    <td class="otherRows">
                                        <div runat="server" id="groupPhysicalLB">
                                        <b>
                                            <asp:Label runat="server" ID="lblPhysical1" /><br />
                                            <asp:Label runat="server" ID="lblPhysical2" /><br />
                                            <asp:Label runat="server" ID="lblPhysical3" /><br />
                                            <asp:Label runat="server" ID="lblPhysical4" /><br />
                                            <asp:Label runat="server" ID="lblProvince" /><br />
                                            <asp:Label runat="server" ID="lblPhysicalCode" />
                                        </b>
                                        </div>
                                        <div runat="server" id="groupPhysicalTB">
                                            <asp:TextBox runat="server" ID="tbPhysical1" /><br />
                                            <asp:TextBox runat="server" ID="tbPhysical2" /><br />
                                            <asp:TextBox runat="server" ID="tbPhysical3" /><br />
                                            <asp:TextBox runat="server" ID="tbPhysical4" /><br />
                                            <asp:DropDownList runat="server" ID="ddlProvince" DataTextField="Name" DataValueField="Name" /><br />
                                            <asp:TextBox runat="server" ID="tbPhysicalCode" />
                                        </div>
                                    </td>
                                    <td class="otherRows">
                                        <asp:Button CssClass="btnChange" runat="server" ID="chPhysical" 
                                            onclick="chPhysical_Click" /></td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        &nbsp;</td>
                                    <td class="otherRows">
                            <asp:Button runat="server" ID="btnSubmit" CssClass="normalButtons" 
                                Text="Submit" onclick="btnSubmit_Click" />
                                    </td>
                                    <td class="otherRows">
                                        &nbsp;</td>
                                </tr>
                            </table>
            </td>
            <td style="width: 20px">
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
