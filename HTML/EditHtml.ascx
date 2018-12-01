<%@ Register TagPrefix="ess" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Control language="vb" Inherits="EasySite.Modules.Html.EditHtml" AutoEventWireup="false" Explicit="True" Codebehind="EditHtml.ascx.vb" %>
<%@ Register TagPrefix="ess" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<table cellspacing="2" cellpadding="2" summary="Edit HTML Design Table" border="0">
    <tr valign="top">
        <td colspan="2"><ess:texteditor id="teContent" runat="server" height="400" width="660" ></ess:texteditor></td>
    </tr>
    <tr height="10"><td></td></tr>
    <tr>
        <td class="SubHead"><ess:label id="plDesktopSummary" runat="server" controlname="txtDesktopSummary" suffix=":"></ess:label></td>
    </tr>
    <tr>
        <td><asp:textbox id="txtDesktopSummary" runat="server" textmode="multiline" rows="4" width="600px" columns="75" cssclass="NormalTextBox"></asp:textbox></td>
    </tr>
</table>
<p>
    <asp:linkbutton class="CommandButton" id="cmdUpdate" resourcekey="cmdUpdate" runat="server" borderstyle="none" text="Update"></asp:linkbutton>&nbsp;
    <asp:linkbutton class="CommandButton" id="cmdCancel" resourcekey="cmdCancel" runat="server" borderstyle="none" text="Cancel" causesvalidation="False"></asp:linkbutton>&nbsp;
    <asp:linkbutton class="CommandButton" id="cmdPreview" resourcekey="cmdPreview" runat="server" borderstyle="none" text="Preview" causesvalidation="False"></asp:linkbutton>&nbsp;
</p>
<table cellspacing="0" cellpadding="0" width="600">
    <tr valign="top">
        <td><asp:label id="lblPreview" cssclass="Normal" runat="server"></asp:label></td>
    </tr>
</table>
