<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.PagerEditC_Info" Codebehind="PagerEditC_Info.ascx.vb" %>
<%@ Register TagPrefix="ESS" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Register TagPrefix="ess" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table width="100%" cellpadding="3" cellspacing="0" class="Normal">
	<tr runat="server" id="trSetOrder" visible="false">
		<td width="120" class="SubHead">
			<ess:label resourcekey="plSetOrder" runat="server" suffix=":" controlname="txtSetOrder" id="Label1"></ess:label>
		</td>
		<td>
			<asp:TextBox id="txtSetOrder" runat="server"></asp:TextBox>
			<asp:CompareValidator id="CompareValidator1" runat="server" ErrorMessage="Please Enter A Number" ControlToValidate="txtSetOrder"
				Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator></td>
	</tr>
	<tr>
		<td class="SubHead"><ess:label resourcekey="plTitle" runat="server" suffix=":" controlname="txtTitle" id="Label2"></ess:label></td>
		<td>
			<asp:TextBox id="txtTitle" runat="server" Width="416px"></asp:TextBox></td>
	</tr>
	<tr>
		<td class="SubHead"><ess:label resourcekey="pleditorContent" runat="server" suffix=":" controlname="editorContent"
				id="Label3"></ess:label></td>
		<td>
			<ESS:texteditor id="editorContent" runat="server" Height="400" Width="600"></ESS:texteditor></td>
	</tr>
	<tr>
		<td colspan="2" align="left" style="padding-left:500px">
			<asp:LinkButton id="btnUpdate" runat="server" resourcekey="Save" CssClass="CommandButton"></asp:LinkButton>
			<asp:LinkButton id="btnCancel" runat="server" resourcekey="Cancel" CssClass="CommandButton"></asp:LinkButton></td>
	</tr>
</table>
