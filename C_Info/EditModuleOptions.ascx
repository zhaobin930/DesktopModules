<%@ Register TagPrefix="ess" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="ESS" TagName="TextEditor" Src="~/controls/TextEditor.ascx"%>
<%@ Control Language="vb" AutoEventWireup="false" Inherits=" EasySite.Modules.C_Info.EditModuleOptions" Codebehind="EditModuleOptions.ascx.vb" %>
<%@ Register TagPrefix="Portal" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="Portal" TagName="SelCategory" Src="~/DesktopModules/C_Info/SelCategory.ascx" %>
<%@ Register TagPrefix="Portal" TagName="TreeModules" Src="~/DesktopModules/C_Info/TreeModules.ascx" %>
<table class="SubHead" cellSpacing="1" cellPadding="3" width="100%" border="0">
	<tr>
		<td width="129"><ess:label id="plModuleType" controlname="cboModuleType" suffix=":" runat="server"></ess:label></td>
		<td><asp:dropdownlist id="cboModuleType" runat="server" AutoPostBack="True">
				<asp:ListItem Value="" resourcekey="InfoModule"></asp:ListItem>
				<asp:ListItem Value="Spec" resourcekey="SpecModule"></asp:ListItem>
				<asp:ListItem Value="Category" resourcekey="CategoryModule"></asp:ListItem>
				<asp:ListItem Value="Search" resourcekey="SearchModule"></asp:ListItem>
				<asp:ListItem Value="SearchList" resourcekey="SearchList"></asp:ListItem>
				<asp:ListItem Value="Detail" resourcekey="DetailModule"></asp:ListItem>
				<asp:ListItem Value="UpInfo" resourcekey="UpInfoModule"></asp:ListItem>
				<asp:ListItem Value="MoreList" resourcekey="MoreListModule"></asp:ListItem>
				<asp:ListItem Value="RelativeList" resourcekey="RelativeListModule"></asp:ListItem>
			</asp:dropdownlist></td>
	</tr>
	<tr>
		<td width="129"></td>
		<td><asp:panel id="pnl" runat="server" Visible="False"></asp:panel><asp:panel id="pnlSpec" runat="server" Visible="False">
				<asp:DropDownList id="cboSpecs" runat="server"></asp:DropDownList>
			</asp:panel><asp:panel id="pnlCategory" runat="server" Visible="False">
				<TABLE class="SubHead" cellSpacing="1" cellPadding="3" width="100%" border="0">
					<TR>
						<TD class="SubHead" width="150">
							<ess:label id="plCategoryRows" runat="server" suffix=":" controlname="txtCategoryRows"></ess:label></TD>
						<TD>
							<asp:TextBox id="txtCategoryRows" runat="server">20</asp:TextBox>
							<asp:comparevalidator id="CompareValidator1" runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtCategoryRows"
								ErrorMessage="*"></asp:comparevalidator></TD>
					</TR>
					<TR>
						<TD class="SubHead" width="150">
							<ess:label id="plCategoryColumns" runat="server" suffix=":" controlname="txtCategoryColumns"></ess:label></TD>
						<TD>
							<asp:TextBox id="txtCategoryColumns" runat="server">1</asp:TextBox>
							<asp:comparevalidator id="Comparevalidator2" runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtCategoryColumns"
								ErrorMessage="*"></asp:comparevalidator></TD>
					</TR>
					<TR>
						<TD class="SubHead">
							<ess:label id="plCategoryLinkStyle" runat="server" suffix=":" controlname="cboCategoryLinkStyle"></ess:label></TD>
						<TD>
							<asp:DropDownList id="cboCategoryLinkStyle" runat="server">
								<asp:ListItem Value="_Blank" resourcekey="_Blank"></asp:ListItem>
								<asp:ListItem Value="_self" resourcekey="_Self"></asp:ListItem>
							</asp:DropDownList></TD>
					</TR>
					<TR>
						<TD class="SubHead" width="150">
							<ess:label id="plCategoryStyle" runat="server" suffix=":" controlname="txtCategoryStyle"></ess:label></TD>
						<TD>
							<asp:TextBox id="txtCategoryStyle" runat="server" TextMode="MultiLine" Width="320px">[分类]</asp:TextBox></TD>
					</TR>
					<TR>
					<TD class="SubHead"><ess:label id="plCategory" runat="server" suffix=":"></ess:label></TD>
					<TD><portal:SelCategory runat="Server" ID="drpSelCategory" /></TD>
				    </TR>
					<TR>
						<TD class="SubHead" width="150">
							<ess:label id="plCategoryViewType" runat="server" suffix=":"></ess:label></TD>
						<TD>
							<asp:RadioButtonList id="ralCategoryViewType" runat="server" CssClass="SubHead" RepeatDirection="Horizontal">
								<asp:ListItem Value="1" Selected="True" resourcekey="CategoryViewType-ListCategory">分类列表</asp:ListItem>
								<asp:ListItem Value="2" resourcekey="CategoryViewType-ListArticle">文章列表</asp:ListItem>
								<asp:ListItem Value="3" resourcekey="CategoryViewType-ListCategoryWithSubArticle">分类+文章列表</asp:ListItem>
								<asp:ListItem Value="4" resourcekey="CategoryViewType-ListArticleWithSub">文章+子分类文章</asp:ListItem>
								<asp:ListItem Value="5" resourcekey="CategoryViewType-ListCategoryNoChange">固定列表</asp:ListItem>
							</asp:RadioButtonList></TD>
					</TR>
				</TABLE>
			</asp:panel><asp:panel id="PnlDetail" runat="server" Visible="False"></asp:panel><asp:panel id="PnlSearch" runat="server" Visible="False">
				<TABLE cellSpacing="1" cellPadding="3" width="100%">
					<TR>
						<TD class="SubHead" width="120">
							<ess:label id="plSearchStyle" runat="server" suffix=":" controlname="SearchStyle"></ess:label></TD>
						<TD>
							<ESS:texteditor id="SearchStyle" runat="server" Width="480" Height="300"></ESS:texteditor></TD>
					</TR>
					<TR>
						<TD class="SubHead">
							<ess:label id="plImageURL" runat="server" suffix=":" controlname="ctlImageURL"></ess:label></TD>
						<TD>
							<portal:url id="ctlImageURL" runat="server" width="300" showlog="False" ShowTrack="false" urltype="F" showtabs="False"></portal:url></TD>
					</TR>
					<TR>
						<TD class="SubHead" width="120">
							<ess:label id="plModules" runat="server" suffix=":" controlname="chkModules"></ess:label></TD>
						<TD>
							<portal:TreeModules id="TreemodulesSearch" runat="server" IsOnlyShowEditableModule="False" ShowPortalCheckBox="True"></portal:TreeModules>
							<asp:CheckBoxList id="chkModules" RepeatDirection="Horizontal" RepeatColumns="3" Runat="server"></asp:CheckBoxList></TD>
					</TR>
					<TR style="display:none">
						<TD class="SubHead" width="120">
							<ess:label id="plCSearchAction" runat="server" suffix=":" controlname="chkCSearchAction"></ess:label></TD>
						<TD>
							<asp:CheckBox id="chkCSearchAction" runat="server"></asp:CheckBox></TD>
					</TR>
				</TABLE>
			</asp:panel><asp:panel id="PnlUpInfo" Visible="False" Runat="server">
				<TABLE cellSpacing="1" cellPadding="3" width="100%">
					<TR>
						<TD class="SubHead" width="150">
							<ess:label id="plUpShowMode" runat="server" suffix=":" controlname="cboUpShowMode"></ess:label></TD>
						<TD>
							<asp:DropDownList id="cboUpShowMode" runat="server">
								<asp:ListItem Value="" resourcekey="None_Specified"></asp:ListItem>
								<asp:ListItem Value="SortDate Desc" resourcekey="MostNew"></asp:ListItem>
								<asp:ListItem Value="Hits Desc" resourcekey="MostHot"></asp:ListItem>
								<asp:ListItem Value="Recommend" resourcekey="Recommend"></asp:ListItem>
							</asp:DropDownList></TD>
					</TR>
					<TR>
						<TD class="SubHead">
							<ess:label id="plUpShowDateScope" runat="server" suffix=":" controlname="cboUpShowDateScope"></ess:label></TD>
						<TD>
							<asp:DropDownList id="cboUpShowDateScope" runat="server">
								<asp:ListItem Value="" resourcekey="All"></asp:ListItem>
								<asp:ListItem Value="day" resourcekey="Day"></asp:ListItem>
								<asp:ListItem Value="week" resourcekey="Week"></asp:ListItem>
								<asp:ListItem Value="month" resourcekey="Month"></asp:ListItem>
								<asp:ListItem Value="year" resourcekey="Year"></asp:ListItem>
							</asp:DropDownList></TD>
					</TR>
					<TR>
						<TD class="SubHead" width="150">
							<ess:label id="plUpShowModues" runat="server" suffix=":" controlname="chkUpShowModues"></ess:label></TD>
						<TD>
							<portal:TreeModules id="TreeModulesUpShow" runat="server"  ShowPortalCheckBox="True"></portal:TreeModules>
							<asp:CheckBoxList id="chkUpShowModues" RepeatDirection="Horizontal" RepeatColumns="3" Runat="server"></asp:CheckBoxList></TD>
					</TR>
					<TR>
						<TD class="SubHead"></TD>
						<TD></TD>
					</TR>
				</TABLE>
			</asp:panel><asp:panel id="PnlMoreList" runat="server" Visible="False"></asp:panel>
			<asp:panel id="PnlRelativeList" Visible="False" Runat="server">
				<TABLE cellSpacing="1" cellPadding="3" width="100%">
					<TR>
						<TD class="SubHead" width="150">
							<ess:label id="plRelativeListMode" runat="server" suffix=":" controlname="radRelativeListMode"></ess:label></TD>
						<TD>
							<asp:RadioButtonList id="radRelativeListMode" runat="server" RepeatDirection="Horizontal">
								<asp:ListItem Value="RelativeKeywords" resourcekey="RelativeKeywords" Selected="True" onclick="showOrHideRelativeModules()"></asp:ListItem>
								<asp:ListItem Value="RelativeModule" resourcekey="RelativeModule" onclick="showOrHideRelativeModules()"></asp:ListItem>
							</asp:RadioButtonList>
							</TD>
					</TR>					
					<TR id="trRelativeListModues">
						<TD class="SubHead" width="150">
							<ess:label id="plRelativeListModues" runat="server" suffix=":" controlname="chkRelativeListModues"></ess:label></TD>
						<TD>
							<portal:TreeModules id="TreeModulesRelativeList" runat="server"  ShowPortalCheckBox="True"></portal:TreeModules>
							<asp:CheckBoxList id="chkRelativeListModues" RepeatDirection="Horizontal" RepeatColumns="3" Runat="server"></asp:CheckBoxList></TD>
					</TR>					
				</TABLE>
				<script type="text/javascript">
				    function showOrHideRelativeModules() {
				        var oRadRelativeListMode = document.getElementsByName('<%=radRelativeListMode.UniqueID%>');
				        document.getElementById('trRelativeListModues').style.display = oRadRelativeListMode[0].checked ? "" : "none";
				    }
				    showOrHideRelativeModules();
				</script>
			</asp:panel></td>
	</tr>
	<tr>
		<td colSpan="2">
			<P align="center"><asp:linkbutton id="btnUpdate" runat="server" resourcekey="Save"></asp:linkbutton>&nbsp;
				<asp:hyperlink id="lnkCancel" runat="server" resourcekey="Cancel"></asp:hyperlink></P>
		</td>
	</tr>
</table>
