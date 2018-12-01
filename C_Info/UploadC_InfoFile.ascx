<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.UploadC_InfoFile"
    CodeBehind="UploadC_InfoFile.ascx.vb" %>
<table width="100%" cellpadding="0" cellspacing="0" class="Normal" id="tblContainer">
    <tr>
        <td height="25">
            <input id="fileUpload" type="file" runat="server" />
            <asp:Button ID="btnUpload" runat="server" CausesValidation="false" resourcekey="cmdUpload"
                CssClass="CommandButton" EnableViewState="false"></asp:Button>&nbsp;
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" EnableViewState="false"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:HyperLink runat="server" ID="lnkFile" CssClass="Normal" EnableViewState="false"></asp:HyperLink>
            <asp:LinkButton ID="btnDelete" runat="server" Visible="False" CausesValidation="false" EnableViewState="false">
				<asp:Image Runat="server" ImageUrl="~/images/delete.gif"></asp:Image>
            </asp:LinkButton>
        </td>
    </tr>
</table>
