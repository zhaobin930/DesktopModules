<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.EditWorkFlow" Codebehind="EditWorkFlow.ascx.vb" %>
<table width="100%" border="0" cellPadding="3" cellSpacing="1" bgcolor="#f1f1e3" class="Normalbold"
	style="BORDER-RIGHT:#cccccc 1px solid; BORDER-TOP:#cccccc 1px solid; BORDER-LEFT:#cccccc 1px solid; BORDER-BOTTOM:#cccccc 1px solid">
	<TBODY>
		<tr>
			<td><img src="<%= ModulePath%>images/active32.gif" width="32" height="32" align="absMiddle">
				<asp:Label Runat="server" ID="lblWorkFlowStep" resorucekey="WorkFlowStep"></asp:Label>
				<asp:Label id="lblmessage" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
			<td>
				<asp:linkbutton id="btnAdd" runat="server" Visible="False">
					<img src="<%= ModulePath%>images/addcontent.gif" width="16" height="16" border="0" align="absmiddle">
					<asp:Label Runat="server" ID="lblAddStep" resourcekey="AddStep"></asp:Label>
				</asp:linkbutton>
				&nbsp;
				<asp:hyperlink id="lnkBack" runat="server" resourcekey="Back"></asp:hyperlink></td>
		</tr>
		<tr>
			<td colspan="2"><asp:Label Runat="server" ID="lblWorkFlowName" resourcekey="WorkFlowName"></asp:Label>
				<asp:Label id="lblwfName" runat="server"></asp:Label></td>
		</tr>
	</TBODY>
</table>
<table cellSpacing="1" cellPadding="3" width="100%" border="0" class="Normal">
	<tr>
		<td colSpan="2">
			<asp:datagrid id="dg" runat="server" DataKeyField="ActiveID" CellPadding="4" BorderStyle="None"
				AutoGenerateColumns="False" Width="100%" CssClass="datagrid-main">
				<AlternatingItemStyle CssClass="datagrid-Alter"></AlternatingItemStyle>
				<ItemStyle CssClass="datagrid-Item"></ItemStyle>
				<HeaderStyle HorizontalAlign="Center" CssClass="datagrid-Header"></HeaderStyle>
				<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
				<Columns>
					<asp:TemplateColumn HeaderText="Edit">
						<ItemTemplate>
							<div runat=server visible='<%# DataBinder.Eval(Container.DataItem, "StepNum")<>1%>'>
								<asp:imagebutton id="edit" runat="server" causesvalidation="false" commandname="edit" ImageUrl="~/images/edit.gif"
									alt="Edit"></asp:imagebutton>
								<asp:imagebutton id="delete" runat="server" causesvalidation="false" commandname="delete" ImageUrl="~/images/delete.gif"
									alt="Delete"></asp:imagebutton>
							</div>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:imagebutton id="update" runat="server" causesvalidation="false" commandname="update" ImageUrl="~/images/save.gif"
								alt="Save"></asp:imagebutton>
							<asp:imagebutton id="cancel" runat="server" causesvalidation="false" commandname="cancel" ImageUrl="~/images/cancel.gif"
								alt="Cancel"></asp:imagebutton>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Step">
						<HeaderStyle HorizontalAlign="Center" CssClass="NormalBold"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center" CssClass="Normal"></ItemStyle>
						<ItemTemplate>
							<%# DataBinder.Eval(Container.DataItem, "StepNum")%>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Name">
						<HeaderStyle CssClass="NormalBold"></HeaderStyle>
						<ItemStyle CssClass="Normal"></ItemStyle>
						<ItemTemplate>
							<%# DataBinder.Eval(Container.DataItem, "ActiveName")%>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox Width=100 runat="server" id="txtActiveName" Text='<%# DataBinder.Eval(Container.DataItem, "ActiveName")%> ' />
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="UserOrRole">
						<HeaderStyle CssClass="NormalBold"></HeaderStyle>
						<ItemStyle CssClass="Normal"></ItemStyle>
						<ItemTemplate>
							<%# IIF(DataBinder.Eval(Container.DataItem, "ActionUser")=-1,"Start",iif(DataBinder.Eval(Container.DataItem, "ActionType")=0,DataBinder.Eval(Container.DataItem, "UserName"),DataBinder.Eval(Container.DataItem, "RoleName")))%>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ContentEditable="false" Width=100 runat="server" id="txtActionUser" Columns="30" MaxLength="50" Text='<%# iif(DataBinder.Eval(Container.DataItem, "ActionType")=0,DataBinder.Eval(Container.DataItem, "UserName"),DataBinder.Eval(Container.DataItem, "RoleName"))%> ' />
							<!--<img src="images/icon_users_32px.gif" onmouseover="this.style.cursor = 'hand';">-->
							<asp:HyperLink Runat="server" ID="lnkSelUser">
								<asp:Image Runat="server" ImageUrl="~/desktopmodules/C_Info/images/icon_users_32px.gif"></asp:Image>
							</asp:HyperLink>
							<INPUT type="hidden" runat="server" id="hiddenUserType" value='<%# DataBinder.Eval(Container.DataItem, "ActionType")%>'>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Action" Visible="False">
						<HeaderStyle CssClass="NormalBold"></HeaderStyle>
						<ItemStyle CssClass="Normal"></ItemStyle>
						<ItemTemplate>
							<%# DataBinder.Eval(Container.DataItem, "Action")%>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:DropDownList ID="cboAction" Runat="server" CssClass="NormalTextBox" SelectedIndex='<%# GetActionIndex(DataBinder.Eval(Container.DataItem, "Action"))%>'>
								<asp:ListItem Value="Start">开始</asp:ListItem>
								<asp:ListItem Value="Audit">审批</asp:ListItem>
								<asp:ListItem Value="Finish">结束</asp:ListItem>
								<asp:ListItem Value="Archive">归档</asp:ListItem>
							</asp:DropDownList>
						</EditItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="AfterReject">
						<HeaderStyle CssClass="NormalBold"></HeaderStyle>
						<ItemStyle CssClass="Normal"></ItemStyle>
						<ItemTemplate>
							<%# DataBinder.Eval(Container.DataItem, "RejectActiveName")%>
						</ItemTemplate>
						<EditItemTemplate>
							<asp:DropDownList ID="cboReject" Runat="server" CssClass="NormalTextBox"></asp:DropDownList>
						</EditItemTemplate>
					</asp:TemplateColumn>
				</Columns>
			</asp:datagrid>
		</td>
	</tr>
</table>
<script type="text/jscript">
function openWin(vUrl)
{
    window.parent.open( vUrl,"_blank","width=300,height=450");
}
</script>
