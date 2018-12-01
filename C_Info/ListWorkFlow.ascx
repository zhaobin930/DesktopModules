<%@ Register TagPrefix="c_info" TagName="AdminNavigator" Src="~/desktopmodules/c_info/AdminC_InfoNavigator.ascx"%>
<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.ListWorkFlow" Codebehind="ListWorkFlow.ascx.vb" %>
<c_info:adminnavigator id="AdminNavigator" runat="server"></c_info:adminnavigator>
<table class="Normalbold" style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid"
	height="40" cellSpacing="0" cellPadding="3" width="100%" bgColor="#f1f1e3" border="0">
	<tr>
		<td><img height=32 src="<%= ModulePath%>images/active32.gif" width=32 align=absMiddle>
			<%= GetString("WorkFlowManage")%>
		</td>
		<td><asp:linkbutton id="btnAddWorkFlow" runat="server">
				<img src="<%= ModulePath%>images/addcontent.gif" width="16" height="16" border="0" align="absmiddle">
				<asp:Label Runat="server" ID="lblAddWorkFlow" resourcekey="AddWorkFlow"></asp:Label>
			</asp:linkbutton>
		</td>
	</tr>
</table>
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tr>
		<td><asp:datagrid id="dg" runat="server" CssClass="datagrid-main" GridLines="Horizontal" DataKeyField="wfID"
				BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="100%" AutoGenerateColumns="False">
				<AlternatingItemStyle CssClass="datagrid-Alter"></AlternatingItemStyle>
				<ItemStyle CssClass="datagrid-Item"></ItemStyle>
				<HeaderStyle HorizontalAlign="Center" CssClass="datagrid-Header"></HeaderStyle>
				<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
				<Columns>
					<asp:TemplateColumn HeaderText="Edit">
						<ItemTemplate>
							<asp:imagebutton id="edit" runat="server" causesvalidation="false" commandname="edit" ImageUrl="~/images/edit.gif"
								AlternateText="Edit"></asp:imagebutton>
							<asp:imagebutton id="delete" runat="server" causesvalidation="false" commandname="delete" ImageUrl="~/images/delete.gif"
								AlternateText="Delete"></asp:imagebutton>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:imagebutton id="cmdSaveUserDefinedField" runat="server" causesvalidation="false" commandname="update"
								ImageUrl="~/images/save.gif" AlternateText="Save"></asp:imagebutton>
							<asp:imagebutton id="cmdCancelUserDefinedField" runat="server" causesvalidation="false" commandname="cancel"
								ImageUrl="~/images/cancel.gif" AlternateText="Cancel"></asp:imagebutton>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn DataField="wfName" HeaderText="WorkFlowName"></asp:BoundColumn>
					<asp:BoundColumn DataField="wfDescription" HeaderText="WorkFlowSummary"></asp:BoundColumn>
					<asp:TemplateColumn HeaderText="AddUser">
						<ItemTemplate>
							<%# DataBinder.Eval(Container.DataItem, "UserName")%>
						</ItemTemplate>
						<EditItemTemplate>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="CreateDate">
						<ItemTemplate>
							<%# ctype(DataBinder.Eval(Container.DataItem, "CreateDate"),DateTime).ToString("yyyy-MM-dd")%>
						</ItemTemplate>
						<EditItemTemplate>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="WorkFlowDefine">
						<ItemTemplate>
							<asp:HyperLink Runat=server NavigateUrl='<%# GetwfDefineURL(DataBinder.Eval(Container.DataItem, "wfID"))%>' resourcekey="WorkFlowDefine">
							</asp:HyperLink>
						</ItemTemplate>
						<EditItemTemplate>
						</EditItemTemplate>
					</asp:TemplateColumn>
				</Columns>
				<PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
			</asp:datagrid></td>
	</tr>
</table>
