<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="EasySite.Modules.C_Info.C_InfoSkin" %><%@ Register TagPrefix="ess" TagName="TITLE" Src="~/DesktopModules/C_Info/ShowField.ascx" %>
<%@ Register TagPrefix="ess" TagName="SOURCE" Src="~/DesktopModules/C_Info/ShowField.ascx" %>
<%@ Register TagPrefix="ess" TagName="AUTHOR" Src="~/DesktopModules/C_Info/ShowField.ascx" %>
<%@ Register TagPrefix="ess" TagName="CREATEDATE" Src="~/DesktopModules/C_Info/ShowDateTime.ascx" %>
<%@ Register TagPrefix="ess" TagName="IMAGE" Src="~/DesktopModules/C_Info/ShowPicture.ascx" %>
<%@ Register TagPrefix="ess" TagName="CONTENT" Src="~/DesktopModules/C_Info/ShowField.ascx" %>
<%@ Register TagPrefix="ess" TagName="HITS" Src="~/DesktopModules/C_Info/ShowField.ascx" %>
<%@ Register TagPrefix="ess" TagName="SERIALISE" Src="~/DesktopModules/C_Info/ShowPager.ascx" %>
<%@ Register TagPrefix="ess" TagName="REMARK" Src="~/DesktopModules/C_Info/ShowRemark.ascx" %>
<%@ Register TagPrefix="ess" TagName="RELATIVE" Src="~/DesktopModules/C_Info/Showrelative.ascx" %>
<table class=Normal cellSpacing=1 cellPadding=3 width="96%" align=center border=0>
<tbody>
<tr>
<td align=center height=50px>
<h1><ess:TITLE runat="server" id="essTITLE" DataField="Title" /></h1>
<hr noShade SIZE=1>
</td></tr>
<tr>
<td align=center height=30>来源：<ess:SOURCE runat="server" id="essSOURCE" DataField="Source" />&nbsp;作者：<ess:AUTHOR runat="server" id="essAUTHOR" DataField="Author" />&nbsp;日期：<ess:CREATEDATE runat="server" id="essCREATEDATE" DataField="CreateDate" DateTimeFormat="yyyy-MM-dd" /></td></tr>
<tr>
<td><ess:IMAGE runat="server" id="essIMAGE" DataField="Image" Align="Left" Border="0" /></td></tr>
<tr>
<td><font class=Normal id=zoom><ess:CONTENT runat="server" id="essCONTENT" DataField="Content" /></font></td></tr>
<tr>
<td align=right>
<table class=Normal cellSpacing=1 cellPadding=3 width="100%" border=0>
<tbody>
<tr>
<td>&nbsp;</td>
<td align=right width=120px>浏览次数：<ess:HITS runat="server" id="essHITS" DataField="Hits" /></td>
<td align=center width=180px><ess:SERIALISE runat="server" id="essSERIALISE" PagerStyle="[Pager]" /></td></tr></tbody></table></td></tr>
<tr>
<td align=right height=30px><ess:REMARK runat="server" id="essREMARK" RemarkName="【评论】" />【<a href="javascript:doZoom(16)">大</a> <a href="javascript:doZoom(14)">中</a> <a href="javascript:doZoom(12)">小</a>】【<a href="javascript:print()">打印</a>】【<a href="javascript:close()">关闭</a>】 </td></tr>
<tr>
<td>&nbsp;</td></tr>
<tr>
<td><ess:RELATIVE runat="server" id="essRELATIVE" ShowRows="5" /></td></tr></tbody></table>
<SCRIPT language=JavaScript>
	function doZoom(size){
		document.getElementById('zoom').style.fontSize=size+'px';

	}
</SCRIPT>