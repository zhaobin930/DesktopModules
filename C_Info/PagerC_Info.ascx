<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.PagerC_Info" Codebehind="PagerC_Info.ascx.vb" %>
<table width="100%" height="40" border="0" cellpadding="3" cellspacing="0" bgcolor="#f1f1e3"
	class="Normalbold" style="BORDER-RIGHT:#cccccc 1px solid; BORDER-TOP:#cccccc 1px solid; BORDER-LEFT:#cccccc 1px solid; BORDER-BOTTOM:#cccccc 1px solid">
	<tr>
		<td><img src="<%=ModulePath%>images/page.gif" align="absMiddle"><%= GetString("PagerManage")%></td>
		<td>
			<img src="<%=ModulePath%>images/addcontent.gif" width="16" height="16" border="0" align="absMiddle">
			<asp:HyperLink id="lnkAddPage" runat="server" resourcekey="AddNewPager"></asp:HyperLink>&nbsp;
			<asp:HyperLink id="lnkBack" runat="server" resourcekey="Back"></asp:HyperLink>
		</td>
	</tr>
	<tr>
		<td colspan="2"><asp:Label ID="lblTitle" Runat="server" ForeColor="red"></asp:Label></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td><asp:datagrid id="dg" runat="server" Width="100%" AllowPaging="False" PageSize="20" CellPadding="4"
				BorderWidth="1px" BorderStyle="None" AllowSorting="True" AutoGenerateColumns="False" DataKeyField="PageID"
				CssClass="datagrid-main">
				<AlternatingItemStyle CssClass="datagrid-Alter"></AlternatingItemStyle>
				<ItemStyle CssClass="datagrid-Item"></ItemStyle>
				<HeaderStyle HorizontalAlign="Center" CssClass="datagrid-Header"></HeaderStyle>
				<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
				<Columns>
					<asp:BoundColumn DataField="Title" HeaderText="Title"></asp:BoundColumn>
					<asp:BoundColumn DataField="SetOrder" HeaderText="Sort"></asp:BoundColumn>
					<asp:TemplateColumn HeaderText="Delete">
						<ItemTemplate>
							<asp:LinkButton ID="delete" CommandName="delete" Runat="server" Visible='<%# DataBinder.Eval(Container.DataItem, "PageID")<>-1%>' resourcekey="Delete">
							</asp:LinkButton>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Edit">
						<ItemTemplate>
							<asp:HyperLink Runat=server NavigateUrl='<%# GetEditPageURL(DataBinder.Eval(Container.DataItem, "PageID"))%>' resourcekey="Edit">
							</asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
				<PagerStyle HorizontalAlign="Left" ForeColor="#003399" BackColor="#99CCCC" Mode="NumericPages"></PagerStyle>
			</asp:datagrid>
		</td>
	</tr>
</table>
