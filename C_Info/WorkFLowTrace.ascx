<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.WorkFLowTrace" Codebehind="WorkFLowTrace.ascx.vb" %>
<asp:PlaceHolder Runat="server" ID="plhDetail"></asp:PlaceHolder>
<asp:label ID="lblTitle" Runat="server"></asp:label>
<br>
<asp:Label ID="lblAuditStatus" Runat="server"></asp:Label>
<asp:datagrid id="dg" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="4"
	BorderWidth="1px" BorderStyle="None" GridLines="Horizontal" CssClass="datagrid-main" AllowPaging="True">
	<AlternatingItemStyle CssClass="datagrid-Alter"></AlternatingItemStyle>
	<ItemStyle CssClass="datagrid-Item"></ItemStyle>
	<HeaderStyle HorizontalAlign="Center" CssClass="datagrid-Header"></HeaderStyle>
	<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
	<Columns>
		<asp:TemplateColumn HeaderText="AuditUser">
			<ItemTemplate>
				<%# iif(DataBinder.Eval(Container.DataItem, "ActionUser")=-1,GetString("CreateUser") & DataBinder.Eval(Container.DataItem, "createuser"),DataBinder.Eval(Container.DataItem, "AuditUserName"))%>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="AuditDate">
			<ItemTemplate>
				<%# Ctype(DataBinder.Eval(Container.DataItem, "CreateDate"),DateTime).ToString("g")%>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="AuditFinish">
			<ItemTemplate>
				<%# iif(DataBinder.Eval(Container.DataItem, "wfStatus")=1,GetString("AuditPass"),GetString("AuditReject"))%>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="AuditIdea">
			<ItemTemplate>
				<%# DataBinder.Eval(Container.DataItem, "Remark").replace(Microsoft.VisualBasic.ControlChars.Lf,"<br>")%>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="AuditTime">
			<ItemTemplate>
				<%# GetAuditTime(DataBinder.Eval(Container.DataItem, "AuditMinutes"))%>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
	<PagerStyle HorizontalAlign="Right" ForeColor="#4A3C8C" BackColor="#E7E7FF" Mode="NumericPages"></PagerStyle>
</asp:datagrid><asp:label id="lblPager" Runat="server" CssClass="Normal"></asp:label>
<div align="center">
	<A class="CommandButton" onclick="javascript:window.open('<%= GetwfURL()%>','','width=766,height=600,scrollbars=yes')" href="#" >
		<%= GetString("ViewWorkFlow")%>
	</A>
</div>
<table id="tableAudit" cellSpacing="1" cellPadding="3" width="100%" runat="server" visible="false">
	<TR>
		<TD class="Normal"></TD>
		<TD>
			<asp:Label id="lblChooseStep" runat="server" CssClass="Normal" resourcekey="ChooseStep" Visible="False"></asp:Label>&nbsp;
			<asp:DropDownList id="drpSteps" runat="server" Visible="False" DataTextField="ActiveName" DataValueField="ActiveID"></asp:DropDownList></TD>
	</TR>
	<tr>
		<td class="Normal"><%= GetString("AuditIdea.Text")%></td>
		<td><asp:textbox id="txtRemark" runat="server" TextMode="MultiLine" Width="416px" Height="88px"></asp:textbox></td>
	</tr>
	<tr>
		<td></td>
		<td>
			<asp:button id="btnAgree" runat="server" CommandArgument="1" resourcekey="Pass"></asp:button>
			<asp:button id="btnReject" runat="server" resourcekey="Reject" CommandArgument="0"></asp:button>
			<asp:button id="btnArchive" runat="server" CommandArgument="2" resourcekey="Archive" Visible="False"></asp:button>
		</td>
	</tr>
</table>
<script type="text/javascript">
function checkValid(auditType)
{
	var vAlertText;
	var eleSteps = document.getElementById('<%= drpSteps.ClientID%>');
	var vCurrentActId = <%= ActiveID%>;
	if(auditType == 'agree')
	{
		vAlertText = '<%= GetString("ConfirmPass")%>';
		if (eleSteps)
		{
			var vSelVal = eleSteps.value;
			if(parseInt(vSelVal)<=parseInt(vCurrentActId))
			{
				alert('<%= GetString("ApprovePreStep.ErrorMessage")%>');
				window.event.returnValue = false;
				window.event.cancelBubble = true;
				return;
			}
		}		
	}
	else if(auditType == 'reject')
	{
		vAlertText = '<%= GetString("ConfirmReject")%>';
		if (eleSteps)
		{
			var vSelVal = eleSteps.value;
			if(parseInt(vSelVal)>=parseInt(vCurrentActId))
			{
				alert('<%= GetString("RejectNextStep.ErrorMessage")%>');
				window.event.returnValue = false;
				window.event.cancelBubble = true;
				return;
			}
		}		
	}
	else if(auditType == 'archive')
	{
		vAlertText = '<%= GetString("ConfirmArchive")%>';
	}
	var vReturnVal = confirm(vAlertText);
	if(!vReturnVal)
	{
		window.event.returnValue = false;
		window.event.cancelBubble = true;
	}
}	
</script>