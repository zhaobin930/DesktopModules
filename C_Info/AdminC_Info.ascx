<%@ Register TagPrefix="ess" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="webdiyer" Namespace="EasySite.Modules.C_Info.CMSAspNetPager" Assembly="CMSAspNetPager" %>
<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.AdminC_Info" Codebehind="AdminC_Info.ascx.vb" %>
<%@ Register TagPrefix="c_info" TagName="AdminNavigator" Src="~/desktopmodules/c_info/AdminC_InfoNavigator.ascx"%>
<%@ Register TagPrefix="Portal" TagName="SelCategory" Src="~/DesktopModules/C_Info/SelCategory.ascx" %>
<script type="text/javascript">
<!--
    function getdgSelectItems()
	{
		 var strID='';
		 for(var i=0;i < document.forms[0].elements.length;i++)
		 {
			if(document.forms[0].elements[i].type=="checkbox")
			{
				if(document.forms[0].elements[i].name.indexOf("chids")!=-1)
				{
					if(document.forms[0].elements[i].checked)
					{
						if(document.forms[0].elements[i].value!=-1&&document.forms[0].elements[i].value!=-2)
							strID +=document.forms[0].elements[i].value + ",";
					}
				}
			}
		 }
		 return strID;
	}
	function OperateSelectItems(type)
	{
	    if (hasSelectItems()) {
	        var strID = getdgSelectItems();

	        //window.showModelessDialog ('DesktopModules/C_Info/C_InfoCopyMove.aspx?IDs=' + strID);
	        window.open('<%= ModulePath %>C_InfoCopyMove.aspx?moduleid=<%= ModuleId %>&TabID=<%= Request.QueryString("TabID")%>&IDs=' + strID + '&type=' + type, '', 'width=350,height=550');
	        //window.open('DesktopModules/C_Info/C_InfoCopyMove.aspx?IDs=' + strID + '&type=' + type);//,'','width=300,height=200');
	    }
	}
	function hasSelectItems(needConfirm)
	{
		var strID=getdgSelectItems();
		if(strID=='')
		{
			alert('请至少选择一项!');
			return false;}
        if (needConfirm) return confirm("您确定要进行此操作吗？");
		return true;
    }
	function onDeleteSel()
	{
	    getdgSelectItems();
	}
	function onSelectAll(chkControl)
	{
		//?? 方法肯定有问题 暂时不考虑客户端效率的问题--FMJ
		for(var i=0;i <document.forms[0].elements.length;i++)
		 {
			if(document.forms[0].elements[i].type=="checkbox")
			{
				if(document.forms[0].elements[i].name.indexOf("chids")!=-1)
				{
					document.forms[0].elements[i].checked=(event.srcElement.value=='-1')
				}
			}
		 }
		if(event.srcElement.value=='-1')
		{
			event.srcElement.value='-2';		
		}
		else
		{
			event.srcElement.value='-1';			
		}	
	}
//-->
</script>
<c_info:adminnavigator id="AdminNavigator" runat="server"></c_info:adminnavigator>
<table cellSpacing="0" cellPadding="3px" width="100%" border="0">
	<tr>
		<td>
			<table class="SubHead" style="BORDER-RIGHT: #d5d5d5 1px solid; BORDER-TOP: #d5d5d5 1px solid; BORDER-LEFT: #d5d5d5 1px solid; BORDER-BOTTOM: #d5d5d5 1px solid"
				cellSpacing="0" cellPadding="3px" width="100%" bgColor="#f1f1e3" border="0">
				<tr>
					<td>
						<asp:Label Runat="server" id="Label1" resourcekey="plDateTime"></asp:Label>
						<asp:textbox id="txtStartDate" runat="server" Width="88px"></asp:textbox><asp:CompareValidator ID="cmpValStartDate" runat="server" ControlToValidate="txtStartDate" CssClass="NormalRed" ErrorMessage="时间格式" resourcekey="DateFormat.ErrorMessage" Display="Dynamic" Operator="DataTypeCheck" Type="Date" ValidationGroup="Search"></asp:CompareValidator>
						<asp:hyperlink id="lnkStartDate" runat="server" resourcekey="Calendar"></asp:hyperlink>-
						<asp:textbox id="txtEndDate" runat="server" Width="88px"></asp:textbox></asp:textbox><asp:CompareValidator ID="cmpValEndDate" runat="server" ControlToValidate="txtEndDate" CssClass="NormalRed" ErrorMessage="时间格式" resourcekey="DateFormat.ErrorMessage" Display="Dynamic" Operator="DataTypeCheck" Type="Date" ValidationGroup="Search"></asp:CompareValidator>
						<asp:hyperlink id="lnkEndDate" runat="server" resourcekey="Calendar"></asp:hyperlink>&nbsp;
						<asp:Label Runat="server" id="Label2" resourcekey="plShowLines"></asp:Label>
						<asp:dropdownlist id="cboShowRows" runat="server" AutoPostBack="True"></asp:dropdownlist>
						<asp:Label Runat="server" id="Label3" resourcekey="plType"></asp:Label>
						<asp:dropdownlist id="cboAudit" runat="server">
							<asp:ListItem resourcekey="AllDoc" Value=""></asp:ListItem>
							<asp:ListItem resourcekey="WaitAudit" Value="0"></asp:ListItem>
							<asp:ListItem resourcekey="PassDoc" Value="1"></asp:ListItem>
							<asp:ListItem resourcekey="RejDoc" Value="2"></asp:ListItem>
							<asp:ListItem resourcekey="MyDoc" Value="3"></asp:ListItem>
							<asp:ListItem resourcekey="DraftDoc" Value="4"></asp:ListItem>
							<asp:ListItem resourcekey="ExpiredDoc" Value="5"></asp:ListItem>
						</asp:dropdownlist>
						<asp:Label Runat="server" id="Label4" resourcekey="plKeyWord"></asp:Label>
						<asp:textbox id="txtKeyWord" runat="server"></asp:textbox>
						<asp:label id="lblCategory" runat="server" resourcekey="Category" Visible="False"></asp:label>
						<Portal:SelCategory id="cboCategory" runat="server" Visible="False"/></td>
					<td align="center" width="100"><asp:button id="btnSearch" runat="server" resourcekey="Search" ValidationGroup="Search"></asp:button></td>
				</tr>
			</table>
			<asp:datagrid id="dg" runat="server" Width="100%" DataKeyField="InfoID" AutoGenerateColumns="False"
				AllowSorting="True" CellPadding="4" PageSize="20" CssClass="datagrid-main">
				<AlternatingItemStyle CssClass="datagrid-Alter"></AlternatingItemStyle>
				<ItemStyle CssClass="datagrid-Item"></ItemStyle>
				<HeaderStyle HorizontalAlign="Center" CssClass="datagrid-Header"></HeaderStyle>
				<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
				<Columns>
					<asp:TemplateColumn ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<input type="checkbox" id="chids" value='<%# DataBinder.Eval(Container.DataItem, "InfoID")%>' runat="server" name="chids" Visible='<%# IsInfoCanDelete(Container.DataItem)%>' />
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Title" SortExpression="Title">
						<ItemTemplate>
							<font color="Red" runat="server" visible='<%# DataBinder.Eval(Container.DataItem, "ApproveStatus")=0%>' ID="Font1">
								*</font>
							<font color="Red" runat="server" visible='<%# DataBinder.Eval(Container.DataItem, "ApproveStatus")=-1%>' ID="Font2">
								#</font>
							<font color="Red" runat="server" visible='<%# DataBinder.Eval(Container.DataItem, "PubDate") isnot DBNull.Value andalso DataBinder.Eval(Container.DataItem, "PubDate")>DateTime.Now%>' ID="Font3">
								@</font>
							<%# GetInfoURL(Container.DataItem)%>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn DataField="CategoryName" HeaderText="Category" Visible="False"></asp:BoundColumn>
					<asp:BoundColumn DataField="CreateDate" HeaderText="CreateDate" DataFormatString="{0:g}" SortExpression="CreateDate"></asp:BoundColumn>
					<asp:BoundColumn DataField="SortDate" HeaderText="SortDate" DataFormatString="{0:g}" SortExpression="SortDate"></asp:BoundColumn>
					<asp:BoundColumn DataField="PubDate" HeaderText="PubDate" DataFormatString="{0:g}" SortExpression="PubDate"></asp:BoundColumn>
					<asp:BoundColumn DataField="Author" HeaderText="Author" SortExpression="Author"></asp:BoundColumn>
					<asp:BoundColumn DataField="Specs" HeaderText="Spec"></asp:BoundColumn>
					<asp:TemplateColumn HeaderText="AuditState" SortExpression="ApproveStatus">
						<ItemTemplate>
							<%#GetString(DataBinder.Eval(Container.DataItem, "WorkFlowStatus").ToString())%>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:BoundColumn DataField="VersionCount" HeaderText="VersionCount"></asp:BoundColumn>
					<asp:TemplateColumn>
						<ItemTemplate>
							<asp:HyperLink Runat="server" NavigateUrl='<%# GetEditURL(Container.DataItem)%>' ID="edit" Visible='<%# IsInfoCanDelete(Container.DataItem)%>'>
								<asp:Image Runat="server" ID="imgEdit" ImageUrl="~/images/edit.gif"></asp:Image>
							</asp:HyperLink>
							<asp:LinkButton ID="delete" CommandName="delete" Runat="server" Visible='<%# IsInfoCanDelete(Container.DataItem)%>'>
								<asp:Image Runat="server" ID="Image1" ImageUrl="~/images/delete.gif"></asp:Image>
							</asp:LinkButton>
							<asp:label runat="server" ID="lblCheckoutUser"></asp:label>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Remark">
						<ItemTemplate>
							<asp:HyperLink Runat=server Target=_blank resourcekey="Remark" NavigateUrl='<%# GetRemarkURL(DataBinder.Eval(Container.DataItem, "InfoID"))%>' ID="Hyperlink2" NAME="Hyperlink2">评论</asp:HyperLink>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Pager">
						<ItemTemplate>
							<asp:HyperLink Runat=server resourcekey="Pager" NavigateUrl='<%# GetPagerInfoURL(DataBinder.Eval(Container.DataItem, "InfoID"))%>' ID="Hyperlink3" NAME="Hyperlink3">分页</asp:HyperLink>
							<font color="red">
								<%# iif(DataBinder.Eval(Container.DataItem, "Pagers")<>"","(" & DataBinder.Eval(Container.DataItem, "Pagers") & ")","")%>
							</font>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="Audit">
						<ItemTemplate>
							<asp:HyperLink Target=_blank Runat=server resourcekey="Audit" ID=lnkAudit NavigateUrl='<%# GetWorkFlowTraceURL(DataBinder.Eval(Container.DataItem, "InfoID"))%>'>审批</asp:HyperLink>
							<%#GetNextStepString(DataBinder.Eval(Container.DataItem, "WorkFlowNextStep").ToString())%>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
				<PagerStyle HorizontalAlign="Left" ForeColor="#003399" BackColor="#99CCCC" Mode="NumericPages"></PagerStyle>
			</asp:datagrid>
			<webdiyer:aspnetpager id="AspNetPager" runat="server" CssClass="Normal" Width="100%" PageSize="20" ShowCustomInfoSection="Right"
				NumericButtonCount="20" FirstPageText="<<" PrevPageText="<" NextPageText=">" LastPageText=">>" ></webdiyer:aspnetpager>
			<BR>
			<table cellSpacing="0" cellPadding="3" width="100%" border="0">
				<tr>
					<td>
						<asp:button id="btnAudit" runat="server" resourcekey="AuditPass" Visible="False"></asp:button>&nbsp;
						<asp:button id="btnReject" runat="server" resourcekey="Reject" Visible="False"></asp:button>&nbsp;
					</td>
					<td>
						<asp:button id="btnDelete" runat="server" resourcekey="SelDelete" OnClientClick="return hasSelectItems(true)"></asp:button>
						&nbsp; 
						<INPUT id=btnMove onclick="OperateSelectItems('move')" type=button value='<%= GetString("SelMore")%>'>
						&nbsp;
						<INPUT id=btnRef onclick="OperateSelectItems('ref')" type=button value='<%= GetString("SelRef")%>'>
						&nbsp;
						<INPUT id=btnCopy onclick="OperateSelectItems('copy')" type=button value='<%= GetString("SelCopy")%>'>
						&nbsp;
						<INPUT id=btnSpec onclick="OperateSelectItems('spec')" type=button value='<%= GetString("SelSpec")%>'>
						&nbsp;
						<asp:button id="btnExportToWord" runat="server" resourcekey="btnExportToWord" OnClientClick="return hasSelectItems()" Text="导出到Word"></asp:button>
						&nbsp;
						<asp:button id="btnSelectStaticDeploy" runat="server" resourcekey="SelectDeploy" Visible="False" OnClientClick="return hasSelectItems()"></asp:button>
						&nbsp;
						<asp:button id="btnBatchAuditPass" runat="server" CommandName="Pass" resourcekey="btnBatchAuditPass" OnClientClick="return hasSelectItems(true)" ToolTip="当列表为待审文档时此按钮有效"></asp:button>
						&nbsp;
						<asp:button id="btnBatchAuditReject" runat="server" CommandName="Reject" resourcekey="btnBatchAuditReject" OnClientClick="return hasSelectItems(true)" ToolTip="当列表为待审文档时此按钮有效"></asp:button>
						&nbsp;
						<asp:button id="btnPagerStaticDeploy" runat="server" resourcekey="PagerDeploy" Visible="False" style="display:none"></asp:button>
						&nbsp;
						<asp:button id="btnAllStaticDeploy" runat="server" resourcekey="AllDeploy" Visible="False" style="display:none"></asp:button>						
					</td>
				</tr>
			</table>
			<br>
		</td>
	</tr>
</table>
