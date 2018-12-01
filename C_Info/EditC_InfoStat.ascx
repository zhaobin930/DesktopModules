<%@ Register TagPrefix="c_info" TagName="AdminNavigator" Src="~/desktopmodules/c_info/AdminC_InfoNavigator.ascx"%>
<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.EditC_InfoStat" Codebehind="EditC_InfoStat.ascx.vb" %>
<c_info:adminnavigator id="AdminNavigator" runat="server"></c_info:adminnavigator>
<table cellSpacing="1" cellPadding="3" width="100%">
	<tr>
		<TD class="SubHead">
			<asp:Label id="lblDateTime" runat="server" resourcekey="DateTime"></asp:Label>
			<asp:textbox id="txtStartDate" Width="88px" runat="server"></asp:textbox><asp:hyperlink id="lnkStartDate" runat="server" resourcekey="SelectDate"></asp:hyperlink>-
			<asp:textbox id="txtEndDate" Width="88px" runat="server"></asp:textbox><asp:hyperlink id="lnkEndDate" runat="server" resourcekey="SelectDate"></asp:hyperlink>&nbsp;&nbsp;
			<asp:Label id="Label1" runat="server" resourcekey="Category"></asp:Label>
			<asp:dropdownlist id="cboType" runat="server">
				<asp:ListItem Value="0" resourcekey="ModuleStat"></asp:ListItem>
				<asp:ListItem Value="1" resourcekey="TabStat"></asp:ListItem>
				<asp:ListItem Value="2" resourcekey="SiteStat"></asp:ListItem>
				<asp:ListItem Value="3" resourcekey="UserStat"></asp:ListItem>
				<asp:ListItem Value="4" resourcekey="UserRoleStat"></asp:ListItem>
				<asp:ListItem Value="5" resourcekey="SpecStat"></asp:ListItem>
				<asp:ListItem Value="6" resourcekey="HitsStat"></asp:ListItem>
				<asp:ListItem Value="7" resourcekey="AuditStat"></asp:ListItem>
			</asp:dropdownlist>&nbsp;
			<asp:button id="btnStat" runat="server" resourcekey="Stat"></asp:button></TD>
	</tr>
</table>
<br>
<center>
	<asp:datagrid id="dg" Runat="server" CellSpacing="1" AutoGenerateColumns="true" HeaderStyle-CssClass="NormalBold"
		ItemStyle-CssClass="Normal" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
		CssClass="datagrid-main" BorderStyle="None" BorderWidth="0" CellPadding="3">
		<AlternatingItemStyle CssClass="datagrid-Alter"></AlternatingItemStyle>
		<ItemStyle CssClass="datagrid-Item"></ItemStyle>
		<HeaderStyle HorizontalAlign="Center" CssClass="datagrid-Header"></HeaderStyle>
		<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
	</asp:datagrid>
</center>
