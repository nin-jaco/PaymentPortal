<%@ Page Title="" Language="C#" MasterPageFile="~/ExistingMembers/LoggedInNMP.master" AutoEventWireup="true" CodeBehind="Statements.aspx.cs" Inherits="CompCare.ExistingMembers.Statements" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="customScript" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageBody" runat="server">
    <h3>
        Statements and Medical Tax Certificates</h3>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <div class="radialShadow" style="width: 100%; height: 15px">
    </div>
    <table cellpadding="5" cellspacing="5" style="width:100%">
        <tr>
            <td colspan="2">
                <h5>
                Statements</h5>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td colspan="2">
                <h5>
                    Medical Tax Certificates</h5>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label runat="server" ID="lblError" ForeColor="Red" />
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td colspan="2"><asp:Label runat="server" ID="lblError0" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td>
                Date from:</td>
            <td class="otherRows">
                <asp:TextBox ID="tbDateFrom" runat="server" Width="200"></asp:TextBox>
                <asp:CalendarExtender ID="tbDateFrom_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="tbDateFrom" Format="yyyy/MM/dd">
                </asp:CalendarExtender>
                <br />
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                Tax
                Year:</td>
            <td class="otherRows">
                <asp:DropDownList ID="ddlYear" runat="server">
                    <asp:ListItem Text="2010" Value="2010" />
                    <asp:ListItem Text="2011" Value="2011" />
                    <asp:ListItem Text="2012" Value="2012" />
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Date to:</td>
            <td class="otherRows">
                <asp:TextBox ID="tbDateTo" runat="server" Width="200"></asp:TextBox>
                <asp:CalendarExtender ID="tbDateTo_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="tbDateTo" Format="yyyy/MM/dd">
                </asp:CalendarExtender>
                <br />
            </td>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                Email Address:</td>
            <td class="otherRows">
                <asp:TextBox ID="tbEmail2" runat="server" Width="200"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td>Email Address:</td>
            <td class="otherRows">
                <asp:TextBox ID="tbEmail" runat="server" Width="200"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="otherRows">
                <asp:Button Text="Submit" runat="server" ID="btnIRP5" CssClass="normalButtons"
                    onclick="btnIRP5_Click" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="otherRows">
                <asp:Button Text="Submit" runat="server" ID="btnStatement" CssClass="normalButtons"
                    onclick="btnStatement_Click" /></td>
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
        </table>
</asp:Content>
