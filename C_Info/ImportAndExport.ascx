<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.ImportAndExport" Codebehind="ImportAndExport.ascx.vb" %>
<script>
function checkFile(fileID)
{
	var file=document.getElementById(fileID);
	if(file.value=='')
	{
		alert('<%= GetString("SelectFile")%>');
		return false;
	}
	if(file.value.toLowerCase().indexOf('.zip')==-1)
	{
		alert('<%= GetString("MustBeZip")%>');
		return false;
	}
	return confirm('<%= GetString("ConfirmImport")%>');
}
</script>
<table cellSpacing="1" cellPadding="3" width="100%" class="Normal">
	<tr>
		<td>
			<asp:Label id="lblName" runat="server" resourcekey="FileName">FileName</asp:Label>
			<asp:TextBox id="txtName" runat="server"></asp:TextBox>
			<asp:label id="lblStartDate" runat="server" resourcekey="StartDate">StartDate:</asp:label>
			<asp:textbox id="txtStartDate" runat="server"></asp:textbox>
			<asp:label id="lblEndDate" runat="server" resourcekey="EndDate">EndDate:</asp:label>
			<asp:textbox id="txtEndDate" runat="server"></asp:textbox>&nbsp;
			<asp:button id="btnExport" runat="server" Text="Export" resourcekey="Export"></asp:button>
			<asp:CheckBox id="chkIncludeGuid" runat="server" 
                resourcekey="IncludeGuid" Text="Include Guid"></asp:CheckBox>
		</td>
	</tr>
	<tr>
		<td>
			<INPUT id="fileImport" type="file" name="File1" runat="server">&nbsp;
			<asp:button id="btnImport" runat="server" Text="Import" resourcekey="Import"></asp:button>
		</td>
	</tr>
	<tr>
		<td align="center">
			<asp:Label id="lblMessage" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label><BR>
			<asp:CheckBox id="cboCurrentModule" runat="server" resourcekey="ShowCurrentModule" Text="Only Show Current Module Export Information"
				AutoPostBack="True" Checked="True"></asp:CheckBox></td>
	</tr>
</table>
<asp:datagrid id="dg" runat="server" PageSize="50" CellPadding="4" BorderStyle="None" AllowPaging="True"
	AllowSorting="True" AutoGenerateColumns="False" Width="100%" DataKeyField="FileName" CssClass="datagrid-main">
	<AlternatingItemStyle CssClass="datagrid-Alter"></AlternatingItemStyle>
	<ItemStyle CssClass="datagrid-Item"></ItemStyle>
	<HeaderStyle HorizontalAlign="Center" CssClass="datagrid-Header"></HeaderStyle>
	<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
	<Columns>
		<asp:TemplateColumn HeaderText="FileName">
			<ItemTemplate>
				<%# DataBinder.Eval(Container.DataItem, "FileName")%>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="ModuleTitle">
			<ItemTemplate>
				<%# DataBinder.Eval(Container.DataItem, "ModuleTitle")%>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="Count">
			<ItemTemplate>
				<%# DataBinder.Eval(Container.DataItem, "Count")%>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="CreateDate">
			<ItemTemplate>
				<%# ctype(DataBinder.Eval(Container.DataItem, "CreateDate"),datetime).ToString("yyyy-MM-dd")%>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="StartDate">
			<ItemTemplate>
				<%# ctype(DataBinder.Eval(Container.DataItem, "StartDate"),datetime).ToString("yyyy-MM-dd")%>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="EndDate">
			<ItemTemplate>
				<%# ctype(DataBinder.Eval(Container.DataItem, "EndDate"),datetime).ToString("yyyy-MM-dd")%>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn>
			<ItemTemplate>
				<asp:LinkButton ID="Delete" CommandName="delete" Runat="server">
					<asp:Image Runat="server" ID="Image1" ImageUrl="~/images/delete.gif"></asp:Image>
				</asp:LinkButton>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn>
			<ItemTemplate>
				<asp:LinkButton ID="Import" CommandName="Import" Runat="server" resourcekey="Import">
					Import
				</asp:LinkButton>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn>
			<ItemTemplate>
				<asp:LinkButton ID="DownLoad" CommandName="DownLoad" Runat="server" resourcekey="DownLoad">
					DownLoad
				</asp:LinkButton>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<PagerStyle HorizontalAlign="Left" ForeColor="#003399" BackColor="#99CCCC" Mode="NumericPages"></PagerStyle>
</asp:datagrid>
