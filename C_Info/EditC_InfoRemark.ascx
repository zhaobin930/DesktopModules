<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.EditC_InfoRemark" Codebehind="EditC_InfoRemark.ascx.vb" %>
<div align="center"><asp:label id="lblTitle" runat="server"></asp:label></div>
<hr/>
<asp:datagrid id="dg" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False"
	CssClass="datagrid-main" ShowHeader="False">
	<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
	<AlternatingItemStyle CssClass="datagrid-Alter"></AlternatingItemStyle>
	<ItemStyle CssClass="datagrid-Item"></ItemStyle>
	<HeaderStyle HorizontalAlign="Center" CssClass="datagrid-Header"></HeaderStyle>
	<Columns>
		<asp:TemplateColumn>
			<ItemTemplate>
				<table width="100%" cellpadding="3" cellspacing="1" class="Normal">
					<tr>
						<td bgcolor="#eeeeee">
							<asp:Image Runat="server" ID="Image1" ImageUrl="~/images/action_right.gif"></asp:Image>
							<asp:LinkButton CommandName="delete" CausesValidation=False CommandArgument='<%# DataBinder.Eval(Container.DataItem,"RemarkID")%>' ID="delete" Runat="server" Visible='<%# isEditAble%>'>
								<asp:Image Runat="server" ID="Image3" ImageUrl="~/images/delete.gif"></asp:Image>
							</asp:LinkButton>
							<%#CType(DataBinder.Eval(Container.DataItem, "CreateDate"), DateTime).ToString("yyyy-MM-dd hh:mm")%>
							&nbsp;
							<%# DataBinder.Eval(Container.DataItem,"UserName")%>
							&nbsp;
							<asp:Label Runat="server" ID="lblIP" resourcekey="RemarkIP"></asp:Label>
							<%# DataBinder.Eval(Container.DataItem,"UserIP")%>
						</td>
					</tr>
					<tr>
						<td><%# DataBinder.Eval(Container.DataItem,"Remark").Replace(Microsoft.VisualBasic.ControlChars.Lf,"<br>")%></td>
					</tr>
				</table>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<PagerStyle HorizontalAlign="Center" PageButtonCount="30" Mode="NumericPages"></PagerStyle>
</asp:datagrid><br>
<table id="Table1" cellSpacing="1" cellPadding="3" width="100%" class="SubHead">
	<tr>
		<td width="108"><asp:Label Runat="server" ID="Label1" resourcekey="UserName"></asp:Label></td>
		<td><asp:textbox id="txtUserName" runat="server"></asp:textbox>
			<asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtUserName"></asp:requiredfieldvalidator>
			<asp:CheckBox ID="chkAnonymous" runat="server" onclick="javascript:setAnonnymousName();" resourcekey="Anonymous" /></td>
	</tr>
	<tr>
		<td width="108"><asp:Label Runat="server" ID="Label2" resourcekey="RemarkContent"></asp:Label></td>
		<td><asp:textbox id="txtRemark" runat="server" Width="392px" TextMode="MultiLine" Height="182px"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtRemark"></asp:requiredfieldvalidator></td>
	</tr>
	<tr>
		<td colSpan="2" align="center">
			<asp:LinkButton id="btnSubmit" runat="server">
				<asp:Label Runat="server" ID="Label3" resourcekey="SubmitRemark"></asp:Label>
			</asp:LinkButton>
			<INPUT id="hidcontent" type="hidden" name="hidcontent" runat="server">
		</td>
	</tr>
</table>
<script language="javascript">
var contentCllientID='<%= txtRemark.ClientID%>';
var beforeCllientID='<%= hidcontent.ClientID%>';
function checkrepeat()
{
	var strbefore=document.getElementById(beforeCllientID).value;
	var strcurrent=document.getElementById(contentCllientID).value;
	if(strbefore!='')
	{
		if(strbefore==strcurrent)
		{
			alert('请不要输入重复的内容');
			return false;
		}
	}
	document.getElementById(beforeCllientID).value=strcurrent;
	return true;
}
function setAnonnymousName()
{
    var ctlUserName = document.getElementById('<%= txtUserName.ClientID%>');
    if(event.srcElement.checked) ctlUserName.value='<%=GetString("WebFriend")%>';
}
</script>
