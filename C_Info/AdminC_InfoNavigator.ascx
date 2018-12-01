<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.AdminC_InfoNavigator" Codebehind="AdminC_InfoNavigator.ascx.vb" %>
	<table cellpadding="0" cellSpacing="0" id="toolBar" >
		<tr>
			<td>
				<table cellSpacing="0">
					<tr>
						<td class="toolBarButton" id="btnAddNew"><IMG src="<%= ModulePath %>images/button_new.gif" align="absMiddle"><asp:HyperLink id="lnkEdit" runat="server" resourcekey="NewInfo">新增文章</asp:HyperLink>
						</td>
						<td class="toolBarButton" id="btnList"><IMG src="<%= ModulePath %>images/button_copy.gif" align="absMiddle"><asp:HyperLink id="lnkAdmin" runat="server" resourcekey="InfoList">文章列表</asp:HyperLink>
						</td>
						<td class="toolBarButton" id="btnType"><IMG src="<%= ModulePath %>images/paste.gif" align="absMiddle"><asp:HyperLink id="lnkCategory" runat="server" resourcekey="CategoryManage">分类管理</asp:HyperLink>
						</td>
						<td class="toolBarButton" id="btnExt"><IMG src="<%= ModulePath %>images/icon_NewVSproj.GIF" align="absMiddle"><asp:HyperLink id="lnkExtField" runat="server" resourcekey="ExtField">扩展字段</asp:HyperLink>
						</td>
						<td class="toolBarButton" id="btnSpec"><IMG src="<%= ModulePath %>images/button_list.gif" align="absMiddle"><asp:HyperLink id="lnkSpec" runat="server" resourcekey="SpecManage">专题管理</asp:HyperLink>
						</td>
						<td class="toolBarButton" id="btnKeyword"><IMG src="<%= ModulePath %>images/icon_TaskList.GIF" align="absMiddle"><asp:HyperLink id="lnkKeyWord" runat="server" resourcekey="KeyWords">关键词</asp:HyperLink>
						</td>
						<td class="toolBarButton" id="btnCount"><IMG src="<%= ModulePath %>images/button_export.gif" align="absMiddle"><asp:HyperLink id="lnkStat" runat="server" resourcekey="Stat"> 统计分析</asp:HyperLink>
						</td>
						<td class="toolBarButton" id="btnWorkflow"><IMG src="<%= ModulePath %>images/active.gif" align="absMiddle"><asp:HyperLink id="lnkWorkFlowList" runat="server" resourcekey="WorkFlow">流程管理</asp:HyperLink>
						</td>
						<td class="toolBarButton" id="btnNotification"><IMG src="<%= ModulePath %>images/notes.gif" align="absMiddle"><asp:HyperLink id="lnkNotification" runat="server" resourcekey="Notification">通知设置</asp:HyperLink>
						</td>
						<td class="toolBarButton" id="btnSet"><IMG src="<%= ModulePath %>images/Option.gif" align="absMiddle"><asp:HyperLink id="lnkViewOptions" runat="server" resourcekey="ModuleSetting">模块设置</asp:HyperLink>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<style type="text/css">
	#toolBar 
	{
		width: 100%;
		background: #f1f1f1 right top;
		border-top: 1px white solid;
		border-bottom: 1px gray solid;				
	}
	</style>
	<script type="text/javascript">
	    //var toolBar = {};
	    //toolBar.toolBarButtonCollection = [];
	    //toolBar.toolBarButtons = {};
	    var oTDs = document.getElementById("toolBar").getElementsByTagName('td');
	    for (var i = 0; i < oTDs.length; i++) {
	        if (oTDs[i].className == 'toolBarButton') {
	            oTDs[i].onmouseover = function() { this.className = "toolBarButtonHover"; }
	            oTDs[i].onmouseout = function() { this.className = "toolBarButton"; }
	            oTDs[i].onmousedown = function() { this.className = "toolBarButtonActive"; }
	            oTDs[i].onmouseup = function() { this.className = "toolBarButton"; }
	        }
	    }
	var canManage='<%= CanManage%>';
	if(canManage=="false")
	{
		document.getElementById('btnSet').style.display = 'none';
        document.getElementById('btnWorkflow').style.display='none';
        document.getElementById('btnNotification').style.display='none';
	}
	</script>
