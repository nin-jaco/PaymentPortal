<%@ Page Title="" Language="C#" MasterPageFile="~/StudentPlanNMP.master" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="StudentPlan.Success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CustomPageScript" runat="server">
    <style type="text/css">

        .style1
        {
            font-size: 25px;
            color: #3366CC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <img alt="" src="Images/applynowFlash.jpg" 
            style="width: 979px; height: 359px" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyText" runat="server">
    <h1>Online Application Form for membership on the CompCare Wellness NetworX Option</h1>
                <p class="radialShadow">&nbsp;</p>
    <table cellpadding="5" cellspacing="0" style="width:100%">
        <tr>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x">&nbsp;</td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x">
                <img src="Images/step4.png" alt="Step 4" /></td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x"><h3 class="formHeading">
                Select your preferred Service Provider</h3></td>
            <td style="background-image:url('Images/stepsBack.png'); background-repeat:repeat-x"></td>
        </tr>
        <tr>
            <td colspan="4">
                <table cellpadding="5" cellspacing="0" align="center">
                    <tr>
                        <td>Status:</td>
                        <td>APPROVED</td>
                    </tr>
                    <tr>
                        <td>Reference Number:</td>
                        <td><asp:Label runat="server" ID="lblReferenceNumber" /></td>
                    </tr>
                    <tr>
                        <td>Authorisation Number:</td>
                        <td><asp:Label runat="server" ID="lblAuthorisationNumber" /></td>
                    </tr>
                    <tr>
                        <td>Card Holder Name:</td>
                        <td><asp:Label runat="server" ID="lblCardHolderName" /></td>
                    </tr>
                    <tr>
                        <td>Amount:</td>
                        <td><asp:Label runat="server" ID="lblAmount" /></td>
                    </tr>
                    <tr>
                        <td>Card Type:</td>
                        <td><asp:Label runat="server" ID="lblCartType" /></td>
                    </tr>
                    <tr>
                        <td>Description of Goods:</td>
                        <td><asp:Label runat="server" ID="lblDescriptionOfGoods" /></td>
                    </tr>
                    <tr>
                        <td>Card Holder Email Address:</td>
                        <td><asp:Label runat="server" ID="lblCardHolderEmail" /></td>
                    </tr>
                    <tr>
                        <td>Masked Card Number:</td>
                        <td><asp:Label runat="server" ID="lblMaskedCardNumber" /></td>
                    </tr>
                </table>
                <br />
                <asp:Label runat="server" ID="SuccessText"></asp:Label><asp:HiddenField runat="server" ID="hfSupplierSelected" /><asp:HiddenField runat="server" ID="hfIdStudent" /></td>
        </tr>
        <tr>
            <td colspan="4">
                <p>
                    <strong><span class="style1"><img src="Images/1.jpg" style="float:left; margin-right:10px;" alt="Step 1" /></span>Please select a supplier from the list:</strong></p>
                    <asp:GridView ID="gvProviders" runat="server" AutoGenerateColumns="false" EmptyDataText="No Data Available" ForeColor="#333333" GridLines="None" 
                                DataKeyNames="IdSupplier" AutoGenerateSelectButton="true" OnSelectedIndexChanged="gvProviders_SelectedIndexChanged" CellPadding="4" Width="100%"
                                AllowPaging="false" PageSize="20" PagerSettings-Mode="NextPreviousFirstLast" OnPageIndexChanging="gridView_PageIndexChanging"
                                OnSorting="gridView_Sorting">
                            <FooterStyle BackColor="White" Font-Bold="True" ForeColor="Black" />
                            <RowStyle BackColor="#EFF3FB" />
                            <Columns>
                                <%--<asp:BoundField DataField="SupplierBHFNumber" HeaderText="BHF Number" />--%>
                                <asp:BoundField DataField="SupplierName" HeaderText="Name" />
                                <asp:BoundField DataField="SupplierPhysicalAddress1" HeaderText="Address1" />
                                <asp:BoundField DataField="SupplierPhysicalAddress2" HeaderText="Address2" />
                                <asp:BoundField DataField="SupplierPhysicalAddress3" HeaderText="Suburb" />
                                <asp:BoundField DataField="SupplierPhysicalAddress4" HeaderText="City" />
                            </Columns>
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="3">
            <p>
                    <span class="style1"><strong>
                        <img src="Images/2.jpg" style="float:left; margin-right:10px" alt="Step 2"/></strong></span><strong>Review his/her particulars..</strong></p>
                <asp:DetailsView ID="dvSuppliers" runat="server" AllowPaging="false"
                                DefaultMode="ReadOnly" DataKeyNames="IdSupplier" AutoGenerateRows="false" EmptyDataText ="None Selected"
                                RowStyle-CssClass="redColumn3" FieldHeaderStyle-CssClass="darkGrayColumn2" FieldHeaderStyle-Width="120px" RowStyle-Width="160px" GridLines="None" >
                                <Fields>
                                    <asp:BoundField DataField="SupplierTitle" HeaderText="Title" />
                                    <asp:BoundField DataField="SupplierName" HeaderText="Name" />
                                    <asp:BoundField DataField="SupplierTelephone" HeaderText="Telephone" />
                                    <asp:BoundField DataField="Latitude" HeaderText="Latitude" />
                                    <asp:BoundField DataField="Longitude" HeaderText="Longitude" />
                                    <asp:BoundField DataField="SupplierEmailAddress" HeaderText="Email" />
                                    <asp:BoundField DataField="SupplierPhysicalAddress1" HeaderText="PhysicalAddress1" />
                                    <asp:BoundField DataField="SupplierPhysicalAddress2" HeaderText="PhysicalAddress2" />
                                    <asp:BoundField DataField="SupplierPhysicalAddress3" HeaderText="PhysicalAddress3" />
                                    <asp:BoundField DataField="SupplierPhysicalAddress4" HeaderText="PhysicalAddress4" />
                                    <asp:BoundField DataField="SupplierPhysicalProvince" HeaderText="Province" />
                                    <asp:BoundField DataField="SupplierPhysicalPostalCode" HeaderText="PostalCode" />
                                </Fields>
                                <RowStyle BackColor="#EFF3FB" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:DetailsView>
                        </td>
            <td colspan="1">
            <p><span class="style1"><strong><img src="Images/3.png" style="float:left; margin-right:10px" alt="Step 2" /></strong></span><strong>Confirm and have your certificate issued..</strong></p>
                <asp:Button runat="server" ID="btnAccept" CssClass="normalButtons" 
                    Text="Accept" onclick="btnAccept_Click" />
                    <asp:Button runat="server" ID="Button1" CssClass="normalButtons" 
                    Text="CreateApplicationForm" onclick="Button1_Click" />
                    <asp:TextBox runat="server" ID="tbManualApp" ></asp:TextBox>
            </td>
        </tr>
    </table>
    
    </asp:Content>
