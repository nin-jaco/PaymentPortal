<%@ Page Title="Compcare Wellness: Your Limits" Language="C#" MasterPageFile="~/ExistingMembers/LoggedInNMP.master"
    AutoEventWireup="true" CodeBehind="YourLimits.aspx.cs" Inherits="CompCare.ExistingMembers.YourLimits" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <table cellpadding="5" cellspacing="0">
        <tr>
            <td style="width: 20px">
                &nbsp;
            </td>
            <td style="width: 100%; text-align: left">
                <h3>Your Limits for <asp:Label ID="lblYear" runat="server"></asp:Label></h3>
                <div class="radialShadow" style="width: 100%; height: 15px">
                </div>
                <h5>
                    Your Limits</h5>
                    <asp:Label runat="server" ID="lblError" ForeColor="Red" />
                <div style="overflow: auto; width: 900px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="dataTable"
                        CellSpacing="0" EmptyDataText="No data available." CellPadding="5" Width="900px">
                        <Columns>
                            <%--<asp:TemplateField>
                                <HeaderTemplate>
                                    Member</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Eval("Dependant.DependantName")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="LimitYear" HeaderText="Limit Year" />--%>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Category</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Eval("Category.CategoryDescription")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="LimitDescription" HeaderText="Description" />
                            <asp:BoundField DataField="LimitCeiling" HeaderText="Ceiling" />
                            <asp:BoundField DataField="LimitBenefit" HeaderText="Benefit Used" />
                            <asp:BoundField DataField="LimitExgratia" HeaderText="Exgratia" />
                        </Columns>
                    </asp:GridView>
                </div>
            </td>
            <td style="width: 20px">
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
