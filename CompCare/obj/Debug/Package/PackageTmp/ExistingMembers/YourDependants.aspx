<%@ Page Title="Compcare Wellness: Your Dependants" Language="C#" MasterPageFile="~/ExistingMembers/LoggedInNMP.master" AutoEventWireup="true" CodeBehind="YourDependants.aspx.cs" Inherits="CompCare.ExistingMembers.YourDependants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageBody" runat="server">
    <table cellpadding="5" cellspacing="0">
        <tr>
            <td style="width: 20px">
                &nbsp;
            </td>
            <td style="width: 100%; text-align: left">
                <h3>
                    Your Dependants</h3>
                <div class="radialShadow" style="width: 100%; height: 15px">
                </div>
                <h5>
                    Your Dependants</h5>
                <asp:Label runat="server" ID="lblError" ForeColor="Red" />
                &nbsp;<div style="overflow: auto; width: 900px">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="dataTable"
                        CellSpacing="0" EmptyDataText="No data available." CellPadding="5" Width="900px">
                        <Columns>
                            <asp:BoundField DataField="DependantName" HeaderText="Name" />
                            <asp:BoundField DataField="DependantSurname" HeaderText="Surname" />
                            <%--<asp:TemplateField>
                                <HeaderTemplate>
                                    Membership Number</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Eval("Member.MembershipNumber")%>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <%--<asp:BoundField DataField="DependantNumber" HeaderText="Dependant Number" />--%>
                            <asp:BoundField DataField="IdentityNumber" HeaderText="Identity Number" />
                            <asp:BoundField DataField="DateOfBirth" HeaderText="Date of Birth" DataFormatString="{0:d}"
                                HtmlEncode="false" />
                            <asp:BoundField DataField="JoiningDate" HeaderText="Joining Date" DataFormatString="{0:d}"
                                HtmlEncode="false" />
                            <asp:BoundField DataField="WaitingPeriodEndDate" HeaderText="Benefit Date" DataFormatString="{0:d}"
                                HtmlEncode="false" />
                            <asp:BoundField DataField="ResignationDate" HeaderText="ResignationDate" DataFormatString="{0:d}"
                                HtmlEncode="false" />
                            <%--<asp:BoundField DataField="SuspendedFrom" HeaderText="Suspended Date" DataFormatString="{0:d}"
                                HtmlEncode="false" />
                            <asp:BoundField DataField="SuspendedTo" HeaderText="Suspended To" DataFormatString="{0:d}"
                                HtmlEncode="false" />--%>
                            <%--<asp:BoundField DataField="Gender" HeaderText="Gender" />--%>
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
