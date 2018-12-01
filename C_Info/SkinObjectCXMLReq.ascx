<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="SkinObjectCXMLReq.ascx.vb" Inherits="EasySite.Modules.C_Info.SkinObjectCXMLReq" %>
<script type="text/javascript">
var currentInfoId = <%= Me.CurrentInfoID %>;
var currentTabId = <%= Me.PortalSettings.ActiveTab.TabId %>;
var currentPortalId = <%= Me.PortalSettings.PortalId %>;
var thumbHandler = '<%= Me.TemplateSourceDirectory%>/thumbnail.ashx';
var reqControlId = '<%= Me.ID %> <%= Me.ClientID %>';
var thumbWidth = '<%= Me.ThumbWidth %>';
var thumbHeight = '<%= Me.ThumbHeight %>';
</script>
