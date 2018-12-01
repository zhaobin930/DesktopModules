<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="SelPortalResource.ascx.vb"
    Inherits="EasySite.Entities.Modules.PortalModuleBase" %>
<%@ Register TagPrefix="ess" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="ess" TagName="URL" Src="~/controls/URLControl.ascx" %>
<ess:URL ID="ctlURL" runat="server" Width="300" ShowLog="False" ShowNone="False"
    ShowTrack="False">
</ess:URL>
<div style="width: 100%; text-align: left;padding-left:10px;">
    <asp:LinkButton OnClick="Select_Click" runat="server" CssClass="StandardButton">确定</asp:LinkButton>&nbsp;&nbsp;&nbsp;<a href="javascript:hideMe();" class="StandardButton">关闭</a></div>
    <br />
<script runat="server">
    Private Sub Select_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Dim strRet As String = Me.ctlURL.Url
        If strRet.Length > 0 Then
            Select Case Me.ctlURL.UrlType
                Case "T"
                    strRet = EasySite.Common.Globals.NavigateURL(Int32.Parse(strRet))
                Case "F"
                    Dim objFileController As New EasySite.Services.FileSystem.FileController
                    Dim objFileInfo As EasySite.Services.FileSystem.FileInfo = objFileController.GetFileById(strRet.Split("="c)(1), Me.PortalId)
                    strRet = PortalSettings.HomeDirectory + objFileInfo.Folder + objFileInfo.FileName
            End Select
        End If
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "retvalue", String.Format("var retValue = ""{0}"";var inputCtl = ""{1}"";selectResource();", strRet, Request.QueryString("inputCtl")), True)
    End Sub
</script>
<script type="text/javascript">
function selectResource()
{
    if(retValue!="")
    {
        this.parent.document.getElementById(inputCtl).value = retValue;
    }
   hideMe();
}
function hideMe()
{
    this.frameElement.style.display = "none";
}
</script>