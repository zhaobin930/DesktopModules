<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.EditC_InfoCategory" Codebehind="EditC_InfoCategory.ascx.vb" %>
<%@ Register TagPrefix="c_info" TagName="AdminNavigator" Src="~/desktopmodules/c_info/AdminC_InfoNavigator.ascx"%>
<c_info:adminnavigator id="AdminNavigator" runat="server"></c_info:adminnavigator>
<table class="SubHead" style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid"
	cellSpacing="0" cellPadding="3" width="100%" bgColor="#f1f1e3" border="0">
	<tr>
		<td><asp:label id="Label1" resourcekey="CategoryTitle" Runat="server"></asp:label><asp:textbox id="txtName" runat="server"></asp:textbox><asp:label id="Label2" resourcekey="ParentCatetory" Runat="server"></asp:label>
			<asp:dropdownlist id="cboParentCategory" runat="server"></asp:dropdownlist></td>
		<TD>
			<asp:CheckBox id="chkShowPortal" runat="server" resourcekey="ShowPortal" AutoPostBack="True" CssClass="SubHead"></asp:CheckBox></TD>
		<td><asp:button id="btnAddCategory" runat="server" resourcekey="Add"></asp:button></td>
	</tr>
</table>
<table class="SubHead" cellSpacing="1" cellPadding="3" width="100%">
	<tr>
		<td><asp:datagrid id="dg" runat="server" CssClass="datagrid-main" DataKeyField="CategoryID" Width="100%"
				AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" BorderStyle="None" CellPadding="4"
				PageSize="20">
				<AlternatingItemStyle CssClass="datagrid-Alter"></AlternatingItemStyle>
				<ItemStyle CssClass="datagrid-Item"></ItemStyle>
				<HeaderStyle HorizontalAlign="Center" CssClass="datagrid-Header"></HeaderStyle>
				<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
				<Columns>
					<asp:TemplateColumn HeaderText="CategoryTitle">
						<ItemTemplate>
							<%# GetTitle(DataBinder.Eval(Container.DataItem, "name"),DataBinder.Eval(Container.DataItem, "level"))%>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "name")%>'>
							</asp:TextBox>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Grade">
						<ItemTemplate>
							<%# DataBinder.Eval(Container.DataItem, "level")%>
						</ItemTemplate>
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
							<asp:LinkButton ID="Delete" CommandName="delete" Runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "HasChildren")%>' >
								<asp:Image Runat="server" ID="Image1" ImageUrl="~/images/delete.gif"></asp:Image>
							</asp:LinkButton>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Move">
						<ItemTemplate>
							<asp:LinkButton ID="btnUp" CommandName="up" CommandArgument="1" Runat="server">
								<asp:Image Runat="server" ID="Image4" ImageUrl="~/images/up.gif"></asp:Image>
							</asp:LinkButton>
							<asp:LinkButton ID="btnDown" CommandName="down" CommandArgument="-1" Runat="server">
								<asp:Image Runat="server" ID="Image5" ImageUrl="~/images/dn.gif"></asp:Image>
							</asp:LinkButton>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
				<PagerStyle HorizontalAlign="Left" ForeColor="#003399" BackColor="#99CCCC" Mode="NumericPages"></PagerStyle>
			</asp:datagrid></td>
	</tr>
	<tr>
		<td>
			<P align="right"><asp:label id="lblInfo" runat="server"></asp:label></P>
		</td>
	</tr>
</table>
