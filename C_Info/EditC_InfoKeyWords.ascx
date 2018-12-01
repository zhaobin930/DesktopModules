<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.EditC_InfoKeyWords" Codebehind="EditC_InfoKeyWords.ascx.vb" %>
<%@ Register TagPrefix="c_info" TagName="AdminNavigator" Src="~/desktopmodules/c_info/AdminC_InfoNavigator.ascx"%>
<c_info:AdminNavigator id="AdminNavigator" runat="server"></c_info:AdminNavigator>
<table width="100%" border="0" cellpadding="3" cellspacing="0" bgcolor="#f1f1e3" style="BORDER-RIGHT:#cccccc 1px solid; BORDER-TOP:#cccccc 1px solid; BORDER-LEFT:#cccccc 1px solid; BORDER-BOTTOM:#cccccc 1px solid"
	class="Normalbold">
	<tr>
		<td><asp:Label Runat="server" ID="lblKeyWords" resourcekey="KeyWords"></asp:Label>
			<asp:textbox id="txtName" runat="server" Width="272px"></asp:textbox></td>
		<td><asp:button id="btnAddSpec" runat="server" resourcekey="Add"></asp:button></td>
	</tr>
</table>
<table cellSpacing="1" cellPadding="3" width="100%">
	<tr>
		<td><asp:datagrid id="dg" runat="server" Width="100%" DataKeyField="KeywordID" AutoGenerateColumns="False"
				AllowSorting="True" AllowPaging="True" BorderStyle="None" BorderWidth="1px" CellPadding="3"
				PageSize="50" CssClass="datagrid-main">
				<AlternatingItemStyle CssClass="datagrid-Alter"></AlternatingItemStyle>
				<ItemStyle CssClass="datagrid-Item"></ItemStyle>
				<HeaderStyle HorizontalAlign="Center" CssClass="datagrid-Header"></HeaderStyle>
				<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
				<Columns>
					<asp:TemplateColumn HeaderText="KeyWords">
						<ItemTemplate>
							<%# DataBinder.Eval(Container.DataItem, "KeywordName")%>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "KeywordName")%>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Edit">
						<ItemTemplate>
							<asp:LinkButton ID="btnEdit" CommandName="edit" Runat="server">
								<asp:Image Runat="server" ID="imgEdit" ImageUrl="~/images/edit.gif"></asp:Image>
							</asp:LinkButton>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:LinkButton ID="btnUpdate" CommandName="update" Runat="server">
								<asp:Image Runat="server" ID="Image2" ImageUrl="~/images/save.gif"></asp:Image>
							</asp:LinkButton>
							<asp:LinkButton ID="btnCancel" CommandName="cancel" Runat="server">
								<asp:Image Runat="server" ID="Image3" ImageUrl="~/images/cancel.gif"></asp:Image>
							</asp:LinkButton>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Delete">
						<ItemTemplate>
							<asp:LinkButton ID="Delete" CommandName="delete" Runat="server">
								<asp:Image Runat="server" ID="Image1" ImageUrl="~/images/delete.gif"></asp:Image>
							</asp:LinkButton>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
				<PagerStyle HorizontalAlign="Left" ForeColor="#003399" BackColor="#99CCCC" Mode="NumericPages"></PagerStyle>
			</asp:datagrid></td>
	</tr>
	<tr>
		<td class="Normal">
			<P align="right"><asp:label id="lblInfo" runat="server"></asp:label></P>
		</td>
	</tr>
</table>
