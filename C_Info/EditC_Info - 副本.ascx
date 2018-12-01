<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.EditC_Info"
    CodeBehind="EditC_Info.vb" %>
<%@ Register TagPrefix="ESS" TagName="label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="Portal" TagName="TreeModules" Src="~/DesktopModules/C_Info/TreeModules.ascx" %>
<%@ Register TagPrefix="Portal" TagName="TreeServerModules" Src="~/DesktopModules/C_Info/TreeServerModules.ascx" %>
<%@ Register TagPrefix="ESS" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="C_Info" TagName="UploadImage" Src="~/DesktopModules/C_Info/UploadC_InfoImage.ascx" %>
<%@ Register TagPrefix="Portal" TagName="SelCategory" Src="~/DesktopModules/C_Info/SelCategory.ascx" %>
<%@ Register TagPrefix="Portal" TagName="DualList" Src="~/controls/DualListControl.ascx" %>
<%@ Register TagPrefix="ess" Namespace="EasySite.UI.WebControls" Assembly="EasySite.WebControls" %>
<%@ Register TagPrefix="ess" Namespace="EasySite.Modules.C_Info.WebControls" Assembly="EasySite.Modules.C_Info" %>
<link id="styletoolbar-style-sheet" href="<%= ModulePath %>images/styletoolbar.css"
    type="text/css" rel="stylesheet">
<style type="text/css">
    .ExtLeft
    {
        width: 85px;
    }
    .ExtRight
    {
    }
    .GroupSuggestMenu
    {
        width: 233px;
        font-size: 12px;
        z-index: 99;
    }
    .Hidden{display:none;}
</style>

<script src="<%= ModulePath %>scripts/StyleToolBar.js" type="text/javascript"></script>
<script src="<%= ModulePath %>scripts/TabCPane.js" type="text/javascript"></script>

<table id="Table1" class="SubHead" style="border-right: #d5d5d5 1px solid; border-top: #d5d5d5 1px solid;
    border-left: #d5d5d5 1px solid; border-bottom: #d5d5d5 1px solid" cellspacing="1"
    width="100%">
    <tr>
        <td width="100px">
            <ess:label id="plTitle" runat="server" suffix=":" controlname="txtTitle">
            </ess:label>
        </td>
        <td colspan="3">
                <asp:TextBox ID="txtTitle" runat="server" Width="380px" MaxLength="200"></asp:TextBox><asp:RequiredFieldValidator
                    ID="reqValtxtTitle" runat="server" ControlToValidate="txtTitle" CssClass="NormalRed"
                    ErrorMessage="*" resourcekey="Required.ErrorMessage" Display="Dynamic"></asp:RequiredFieldValidator>
                <img id="toolbarImage" name="toolbarImage" src="<%=ModulePath %>images/styletoolbar.gif"
                    width="54" height="14" toolnum="3" style="visibility: hidden" />
        </td>
    </tr>
    <tr>
        <td>
            <ess:label id="plAuthor" runat="server" suffix=":" controlname="txtAuthor">
            </ess:label>
        </td>
        <td>
            <asp:TextBox ID="txtAuthor" runat="server" Width="120px"></asp:TextBox>
        </td>
        <td width="100px">
            <ess:label id="plShortTitle" runat="server" suffix=":" controlname="txtShortTitle">
            </ess:label>
        </td>
        <td>
            <asp:TextBox ID="txtShortTitle" runat="server" Width="140px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <ess:label id="plSource" runat="server" suffix=":" controlname="txtSource">
            </ess:label>
        </td>
        <td>
            <asp:TextBox ID="txtSource" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td>
            <ess:label id="plCreateDate" runat="server" suffix=":" controlname="txtCreateDate">
            </ess:label>
        </td>
        <td>
            <asp:TextBox ID="txtCreateDate" runat="server" Width="140px"></asp:TextBox><asp:RequiredFieldValidator
                ID="reqValCreateDate" runat="server" ControlToValidate="txtCreateDate" CssClass="NormalRed"
                ErrorMessage="*" resourcekey="Required.ErrorMessage" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr runat="server" id="trCategory" Visible="False">
        <td>
            <asp:Label ID="lblCategory" runat="server">
                <ess:label id="plCategory" runat="server" suffix=":" controlname="cboCategoryID">
                </ess:label>
            </asp:Label>
        </td>
        <td colspan="3">
            <Portal:SelCategory id="cboCategoryID" runat="server" />
        </td>
    </tr>
    <tr style="display: none">
        <td width="100">
        </td>
        <td colspan="3">
            <asp:CheckBox ID="chkApproveStatus" runat="server"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td rowspan="3">
            <ess:label id="plDescription" runat="server" suffix=":" controlname="txtDescription">
            </ess:label>
        </td>
        <td rowspan="3">
            <asp:TextBox ID="txtDescription" runat="server" Width="300px" TextMode="MultiLine"
                Height="80px"></asp:TextBox>
        </td>
        <td>
            <ess:label id="plSortDate" runat="server" suffix=":" controlname="txtSortDate">
            </ess:label>
        </td>
        <td>
            <asp:TextBox ID="txtSortDate" runat="server" Width="140px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <ess:label id="plPubDate" runat="server" suffix=":" controlname="txtPubDate">
            </ess:label>
        </td>
        <td>
            <asp:TextBox ID="txtPubDate" runat="server" Width="140px" onchange="if(this.value.length>0 && this.value.indexOf(':')==-1) this.value+=' 00:00:00'"></asp:TextBox>
            <asp:HyperLink ID="lnkPubDate" runat="server" resourcekey="Calendar"></asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td>
            <ess:label id="plExpireDate" runat="server" suffix=":" controlname="txtExpireDate">
            </ess:label>
        </td>
        <td>
            <asp:TextBox ID="txtExpireDate" runat="server" Width="140px" onchange="if(this.value.length>0 && this.value.indexOf(':')==-1) this.value+=' 00:00:00'"></asp:TextBox>
            <asp:HyperLink ID="lnkExpireDate" runat="server" resourcekey="Calendar"></asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td>
            <ess:label id="plKeyWords" runat="server" suffix=":" controlname="txtKeyWords">
            </ess:label>
        </td>
        <td>
            <ess:ESSTextSuggest ID="txtKeyWords" runat="server" Width="230" Delimiter=" " LookupDelay="50"
                DefaultNodeCssClassOver="SuggestNodeOver" TextSuggestCssClass="SuggestTextMenu GroupSuggestMenu"></ess:ESSTextSuggest>&nbsp;<a
                    onclick="javascript:window.open('<%= ModulePath%>ListC_InfoKeyWords.aspx?TabID=<%= TabID%>&ModuleID=<%= ModuleID%>','_blank','width=766,height=600,scrollbars=yes,left=0,top=0');"
                    href="#none"><%= GetString("SelectKeyWords")%></a>
        </td>
        <td>
            <ess:label id="plExtURL" runat="server" suffix=":" controlname="txtExtURL">
            </ess:label>
        </td>
        <td>
            <asp:TextBox ID="txtExtURL" runat="server" Width="250px"></asp:TextBox>&nbsp;<a onclick="javascript:placeIframeOnBottom($('<%=txtExtURL.ClientID %>'),true,'<%= EditUrl("ctlmode","none","SelPortalResource","inputCtl=" & txtExtURL.ClientID )%>');"
                href="#none"><%=GetString("SelectExtUrl")%></a>
        </td>
    </tr>
</table>
<br />
<div style="text-align: left;">
<ess:TabCPanel ID="tabContainer" runat="server">
    <ess:TabCHeader ID="dshDetailInfo" runat="server" Content="tblDetailInfo"
        ResourceKey="DetailInfo">    
    </ess:TabCHeader>
    <table id="tblDetailInfo" runat="server" cellspacing="2" cellpadding="1" width="100%" style="height:500px">
        <tr>
            <td>
                <ess:texteditor id="editorContent" runat="server" Width="730" Height="400">
                </ess:texteditor>
            </td>
        </tr>
    </table>
    <ess:TabCHeader ID="dshTitleImage" runat="server" Content="tblTitleImage"
        ResourceKey="TitleImage">
    </ess:TabCHeader>
    <table id="tblTitleImage" runat="server" cellspacing="1" cellpadding="3" width="100%"
        border="0">
        <tr>
            <td width="113" class="SubHead">
                <ess:label id="plImage" runat="server" suffix=":" controlname="imgUpload">
                </ess:label>
            </td>
            <td>
                <C_Info:UPLOADIMAGE id="imgUpload" runat="server">
                </C_Info:UPLOADIMAGE>
            </td>
        </tr>
        <tr>
            <td width="113" class="SubHead">
                <ess:label id="plExtImage" runat="server" suffix=":" controlname="txtImage">
                </ess:label>
            </td>
            <td>
                <asp:TextBox ID="txtImage" runat="server" Width="336px"></asp:TextBox><asp:RegularExpressionValidator
                    ID="RegularExpressionValidator1" runat="server" ErrorMessage="* http://" ControlToValidate="txtImage"
                    ValidationExpression="\bhttp://.*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td width="113" height="19" class="SubHead">
                <ess:label id="plImagePosition" runat="server" suffix=":" controlname="cboImagePosition">
                </ess:label>
            </td>
            <td height="19">
                <asp:DropDownList ID="cboImagePosition" runat="server">
                    <asp:ListItem Value="" resourcekey="Default"></asp:ListItem>
                    <asp:ListItem Value="Left" resourcekey="Left">左</asp:ListItem>
                    <asp:ListItem Value="Right" resourcekey="Right">右</asp:ListItem>
                    <asp:ListItem Value="Top" resourcekey="Top">上</asp:ListItem>
                    <asp:ListItem Value="Bottom" resourcekey="Bottom">下</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td width="113" class="SubHead">
                <ess:label id="plImageSize" runat="server" suffix=":" controlname="txtImageSize">
                </ess:label>
            </td>
            <td>
                <asp:TextBox ID="txtImageSize" runat="server" Width="128px"></asp:TextBox><asp:RegularExpressionValidator
                    ID="RegularExpressionValidator2" runat="server" ErrorMessage="* 80*60" ControlToValidate="txtImageSize"
                    ValidationExpression="\d{1,}\*\d{1,}"></asp:RegularExpressionValidator>
            </td>
        </tr>
    </table>
    <ess:TabCHeader ID="dshExtField" runat="server" Content="tblExtField"
        ResourceKey="ExtField" >
    </ess:TabCHeader>
    <table id="tblExtField" runat="server" cellspacing="1" cellpadding="3" width="100%"
        border="0">
        <tr>
            <td>
                <table id="tableExtField" cellspacing="1" cellpadding="3" width="100%" border="0"
                    runat="server">
                </table>
            </td>
        </tr>
    </table>
    <ess:TabCHeader ID="dshBelongSpec" runat="server" Content="tblBelongSpec"
        ResourceKey="BelongSpec">
    </ess:TabCHeader>
    <table id="tblBelongSpec" runat="server" cellspacing="1" cellpadding="3" width="100%"
        border="0">
        <tr>
            <td align="center" class="SubHead" width="260px">
                <ess:label id="plSpecList" runat="server" suffix=":" controlname="lstAllSpec">
                </ess:label><br>
                <asp:ListBox ID="lstAllSpec" runat="server" Width="250px" Height="200px"></asp:ListBox>
            </td>
            <td align="center" width="30px">
                <img style="display: none" src='<%= ResolveURL("~/desktopmodules/C_Info/images/right.gif")%>'
                    handle="right" onclick="HandleSpec()">
                <asp:LinkButton ID="btnRightSpec" runat="server" CausesValidation="False">
                    <asp:Image runat="server" ImageUrl="~/desktopmodules/C_Info/images/right.gif" Width="16"
                        Height="16" border="0" ID="Image1" NAME="Image1"></asp:Image>
                </asp:LinkButton>
                <br>
                <br>
                <asp:LinkButton ID="btnRightSpecAll" runat="server" CausesValidation="False">
							<asp:Image Runat="server" ImageUrl="~/desktopmodules/C_Info/images/rightall.gif" width="16"
								height="16" border="0"></asp:Image>
                </asp:LinkButton>
                <br>
                <br>
                <asp:LinkButton ID="btnLeftSpec" runat="server" CausesValidation="False">
                    <asp:Image runat="server" ImageUrl="~/desktopmodules/C_Info/images/left.gif" Width="16"
                        Height="16" border="0" ID="Image2" NAME="Image2"></asp:Image>
                </asp:LinkButton>
                <br>
                <br>
                <asp:LinkButton ID="btnLeftSpecAll" runat="server" CausesValidation="False">
                    <asp:Image runat="server" ImageUrl="~/desktopmodules/C_Info/images/leftall.gif" Width="16"
                        Height="16" border="0" ID="Image3" NAME="Image3"></asp:Image>
                </asp:LinkButton>
            </td>
            <td align="center" class="SubHead" width="260px">
                <ess:label id="plBelogSpec" runat="server" suffix=":" controlname="lstAllSpecSel">
                </ess:label><br>
                <asp:ListBox ID="lstAllSpecSel" runat="server" Width="250px" Height="200px"></asp:ListBox>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <ess:TabCHeader ID="dshOtherInfomation" runat="server" Content="tblOtherInfomation"
        ResourceKey="OtherInfomation">
    </ess:TabCHeader>
    <table id="tblOtherInfomation" runat="server" cellspacing="1" cellpadding="3" width="100%"
        border="0">
        <tr>
            <td width="115px" class="SubHead">
                <ess:label id="plTitleStyle" runat="server" suffix=":" controlname="txtTitleStyle">
                </ess:label>
            </td>
            <td>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <span id="titleStyleContainer">[TITLE]</span>
                        </td>
                        <td>
                            <table id="toolbarContainer">
                            </table>
                        </td>
                    </tr>
                </table>
                <asp:TextBox ID="txtTitleStyle" runat="server" Width="360px" TextMode="MultiLine"
                    Rows="3">[TITLE]</asp:TextBox>
            </td>
        </tr>
        <tr style="display: none">
            <td width="115px">
                <ess:label id="plSyndicateRss" runat="server" suffix=":" controlname="chkSyndicate">
                </ess:label>
            </td>
            <td>
                <asp:CheckBox ID="chkSyndicate" runat="server"></asp:CheckBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table>
                    <tr valign="top">
                        <td width="115px" class="SubHead">
                            <ess:label id="plSortTop" runat="server" suffix=":" controlname="chkSortTop">
                            </ess:label>
                        </td>
                        <td width="25px">
                            <asp:CheckBox ID="chkSortTop" runat="server"></asp:CheckBox>
                        </td>
                        <td width="115px" class="SubHead">
                            <ess:label id="plRecommend" runat="server" suffix=":" controlname="chkRecommend">
                            </ess:label>
                        </td>
                        <td>
                            <asp:CheckBox ID="chkRecommend" runat="server"></asp:CheckBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td width="115px" class="SubHead">
                <ess:label id="plInfoLink" runat="server" controlname="chkInfoLink">
                </ess:label>
            </td>
            <td>
                <asp:CheckBox ID="chkInfoLink" runat="server" AutoPostBack="true" OnCheckedChanged="chkInfoLink_OnCheckedChanged">
                </asp:CheckBox>
                <asp:DataGrid ID="grdInfoLink" runat="server" Width="550px" Visible="false" AllowCustomPaging="false"
                    AllowPaging="false" AutoGenerateColumns="False" AllowSorting="false" CssClass="datagrid-main"
                    DataKeyField="ID">
                    <ItemStyle CssClass="datagrid-Item"></ItemStyle>
                    <HeaderStyle CssClass="datagrid-Header"></HeaderStyle>
                    <AlternatingItemStyle CssClass="datagrid-Alter"></AlternatingItemStyle>
                    <PagerStyle HorizontalAlign="Center" CssClass="datagrid-Pager" Mode="NumericPages">
                    </PagerStyle>
                    <FooterStyle CssClass="datagrid-Footer"></FooterStyle>
                    <EditItemStyle CssClass="datagrid-Edit"></EditItemStyle>
                    <SelectedItemStyle CssClass="datagrid-Selected"></SelectedItemStyle>
                    <Columns>
                        <asp:BoundColumn DataField="Title" SortExpression="Title" HeaderText="Title"></asp:BoundColumn>
                        <asp:TemplateColumn SortExpression="ExtUrl" HeaderText="ExtUrl">
                            <ItemTemplate>
                                <asp:HyperLink runat="server" NavigateUrl='<%# Eval("ExtUrl") %>' Text='<%# iif(Eval("ExtUrl").ToString().length>65,"..."+Strings.Right(Eval("ExtUrl").ToString(),65),Eval("ExtUrl")) %>'></asp:HyperLink>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="txtExtUrl" Text='<%# Bind("ExtUrl") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="SetOrder" SortExpression="SetOrder" HeaderText="SetOrder">
                            <ItemStyle Width="30px" />
                        </asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="Edit">
                            <ItemStyle Width="40px" />
                            <ItemTemplate>
                                <asp:ImageButton runat="server" CommandName="Edit" AlternateText="Edit" ImageUrl="~/images/edit.gif" />
                                <asp:ImageButton runat="server" CommandName="Delete" AlternateText="Delete" ImageUrl="~/images/delete.gif" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton runat="server" CommandName="Update" AlternateText="Update" ImageUrl="~/images/save.gif" />
                                <asp:ImageButton runat="server" CommandName="Cancel" AlternateText="Cancel" ImageUrl="~/images/cancel.gif" />
                            </EditItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
                <asp:LinkButton runat="server" ID="btnAddInfoLink" OnClick="btnAddInfoLink_OnClick"
                    CausesValidation="false" CssClass="CommandButton" Visible="false" resourcekey="Add"></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td width="115px" class="SubHead">
                <ess:label id="plInfoVersion" runat="server" controlname="chkInfoVersion">
                </ess:label>
            </td>
            <td>
                <asp:CheckBox ID="chkInfoVersion" runat="server" AutoPostBack="true" OnCheckedChanged="chkInfoVersion_OnCheckedChanged">
                </asp:CheckBox>
                <asp:DataGrid ID="grdInfoVersion" runat="server" Width="350px" Visible="false" AllowCustomPaging="false"
                    AllowPaging="false" AutoGenerateColumns="False" AllowSorting="false" CssClass="datagrid-main" DataKeyField="InfoVersionID">
                    <ItemStyle CssClass="datagrid-Item" HorizontalAlign="Center"></ItemStyle>
                    <HeaderStyle CssClass="datagrid-Header" HorizontalAlign="Center"></HeaderStyle>
                    <AlternatingItemStyle CssClass="datagrid-Alter"></AlternatingItemStyle>
                    <PagerStyle HorizontalAlign="Center" CssClass="datagrid-Pager" Mode="NumericPages">
                    </PagerStyle>
                    <FooterStyle CssClass="datagrid-Footer"></FooterStyle>
                    <EditItemStyle CssClass="datagrid-Edit"></EditItemStyle>
                    <SelectedItemStyle CssClass="datagrid-Selected"></SelectedItemStyle>
                    <Columns>
                        <asp:TemplateColumn HeaderText="OrderNum">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#  Container.ItemIndex + 1 %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="CreateDate" HeaderText="CreateDate"></asp:BoundColumn>
                        <asp:BoundColumn DataField="Creator" HeaderText="Creator"></asp:BoundColumn>
                        <asp:TemplateColumn>
                            <ItemTemplate>
                                <asp:HyperLink ImageUrl="~/images/restore.gif" runat="server" ToolTip='<%# Localization.GetString("Restore",Me.LocalResourceFile) %>' NavigateUrl='<%# EditUrl("InfoID",Request.QueryString("InfoID"),"Edit","VersionID=" & Eval("InfoVersionID") ) %>' ></asp:HyperLink>
                                <asp:HyperLink ImageUrl="~/images/view.gif" runat="server" Target="_blank" ToolTip='<%# Localization.GetString("View",Me.LocalResourceFile) %>' NavigateUrl='<%# EditUrl("InfoID",Request.QueryString("InfoID"),"InfoDetail","VersionID=" & Eval("InfoVersionID") ) %>' ></asp:HyperLink>
                                <asp:ImageButton ImageUrl="~/images/delete.gif" runat="server" CommandName="Delete" ToolTip='<%# Localization.GetString("cmdDelete") %>' OnClientClick='<%# String.Format("return confirm(""{0}"")",  Localization.GetString("DeleteItem"))  %>'></asp:ImageButton>
                            </ItemTemplate>
                        </asp:TemplateColumn>                       
                    </Columns>
                </asp:DataGrid>
            </td>
        </tr>
    </table>
    <ess:TabCHeader ID="dshInfoRightSetting" runat="server" Content="tblInfoRightSetting"
        ResourceKey="InfoRightSetting">
    </ess:TabCHeader>
    <table id="tblInfoRightSetting" runat="server" cellspacing="1" cellpadding="3" width="100%"
        border="0">
        <tr>
            <td width="180px" class="Normal">
                <ess:Label runat="server" ID="plAssignInfoViewRight" Suffix=":">
                </ess:Label>
            </td>
            <td>
                <Portal:duallist id="dulInfoRight" runat="server" ListBoxWidth="130" ListBoxHeight="130"
                    DataValueField="RoleId" DataTextField="RoleName">
                </Portal:duallist>
            </td>
        </tr>
    </table>
    <ess:TabCHeader ID="dshPublishModules" runat="server" Content="tblPublishModules"
        ResourceKey="PublishModules">
    </ess:TabCHeader>
    <table class="Normal" id="tblPublishModules" runat="server" cellspacing="1" cellpadding="3"
        width="100%" border="0">
        <tr>
            <td>
                <Portal:TreeModules id="TreeModulesMore" runat="server" ShowPortalType="CurrentPortal">
                </Portal:TreeModules>
                <asp:CheckBoxList ID="chkInfoModules" Visible="False" runat="server" RepeatColumns="4"
                    Width="100%">
                </asp:CheckBoxList>
            </td>
        </tr>
    </table>
    <ess:TabCHeader ID="dshCopyModules" runat="server" Content="tblCopyModules"
        ResourceKey="CopyModules">
    </ess:TabCHeader>
    <table class="Normal" id="tblCopyModules" runat="server" cellspacing="1" cellpadding="3"
        width="100%" border="0">
        <tr>
            <td>
                <Portal:TreeModules id="TreeModulesCopy" runat="server" IncludeCurrentModule="true">
                </Portal:TreeModules>
            </td>
        </tr>
    </table>
    <ess:TabCHeader ID="dshTargetModule" runat="server" Content="tblTargetModule"
        ResourceKey="TargetModule" visible="false">
    </ess:TabCHeader>
    <table class="Normal" id="tblTargetModule" runat="server" cellspacing="1" cellpadding="3"
        width="100%" border="0" visible="false">
        <tr>
            <td>
                <Portal:TreeModules id="TreeModulesTarget" runat="server" ShowPortals="OtherPortal"
                    Visible="False">
                </Portal:TreeModules>
            </td>
        </tr>
    </table>
    <ess:TabCHeader ID="dshServerModule" runat="server" Content="tblServerModule"
        ResourceKey="ServerModule" visible="false">
    </ess:TabCHeader>
    <table class="Normal" id="tblServerModule" runat="server" cellspacing="1" cellpadding="3"
        width="100%" border="0" visible="false">
        <tr>
            <td>
                <Portal:TreeServerModules id="TreeServerModules" runat="server">
                </Portal:TreeServerModules>
            </td>
        </tr>
    </table>
  </ess:TabCPanel>
    <div style="margin:8px;padding-left:80px;">
            <asp:Label ID="lblmessage" CssClass="NormalRed" runat="server" EnableViewState="False"></asp:Label>
            <asp:ValidationSummary runat="server" ID="valSummary" CssClass="NormalRed" />

            <asp:LinkButton ID="btnUpdate" class="CommandButton" runat="server" resourcekey="Update"></asp:LinkButton>&nbsp;
            <asp:LinkButton ID="btnUpdateAndContinue" class="CommandButton" runat="server" resourcekey="UpdateAndContinue"
                Visible="False"></asp:LinkButton>&nbsp;
            <asp:LinkButton ID="btnSaveDraft" class="CommandButton" runat="server" resourcekey="SaveDraft"
                Visible="False"></asp:LinkButton>&nbsp;
            <asp:LinkButton ID="btnSaveAndVersioned" class="CommandButton" runat="server" resourcekey="SaveAndVersioned">SaveAndVersioned</asp:LinkButton>&nbsp;
            <asp:LinkButton ID="btnPushUpdate" class="CommandButton" runat="server" Visible="False"></asp:LinkButton>&nbsp;
            <asp:LinkButton ID="btnCancel" class="CommandButton" runat="server" CausesValidation="False"
                resourcekey="cmdReturn"></asp:LinkButton>&nbsp;
            <asp:LinkButton ID="btnDelete" class="CommandButton" runat="server" CausesValidation="False"
                resourcekey="Delete"></asp:LinkButton>&nbsp;
            <asp:LinkButton ID="btnToDraft" class="CommandButton" runat="server" CausesValidation="True"
                resourcekey="ToDraft" Visible="false"></asp:LinkButton>&nbsp;
            <asp:LinkButton ID="btnCheckout" class="CommandButton" runat="server" resourcekey="Checkout" CausesValidation="false"></asp:LinkButton>
            <asp:LinkButton ID="btnCheckin" class="CommandButton" runat="server" resourcekey="Checkin" CausesValidation="false"></asp:LinkButton>&nbsp;
            <asp:LinkButton ID="btnPager" class="CommandButton" runat="server" resourcekey="Serialise"></asp:LinkButton>&nbsp;
            <asp:HyperLink ID="lnkAudit" class="CommandButton" runat="server" Visible="False"
                Target="_blank" resourcekey="Audit"></asp:HyperLink>&nbsp;
            <asp:LinkButton ID="btnAuditAgree" class="CommandButton" runat="server" Visible="False"
                resourcekey="AuditPass"></asp:LinkButton>
    </div>
</div>

<script language="javascript">
    function getKeyWordClientID() {
        return '<%= txtKeyWords.ClientID %>'
    }
    function HandleSpec() {
        var leftList = document.getElementById('<%= lstAllSpec.ClientID%>');
        var rightList = document.getElementById('<%= lstAllSpecSel.ClientID%>');
        switch (event.srcElement.handle) {
            case "right":
                if (leftList.selectedIndex == -1)
                    return false;
                var oSelect = leftList.options[leftList.selectedIndex]
                var oOption = document.createElement("option");
                rightList.options.add(oOption);
                oOption.innerText = oSelect.text;
                oOption.value = oSelect.value;
                leftList.options.remove(oSelect);

            case "rightAll":
        }
    }
    function initStyleToolbar() {
        var oStyleToolbar = new StyleToolbar(document.getElementById("titleStyleContainer"), document.getElementById("<%=txtTitleStyle.ClientID %>"), document.getElementById("toolbarContainer"), document.getElementById("toolbarImage"));
        oStyleToolbar.initToolbar();
    }
    ess.dom.attachEvent(window, "onload", initStyleToolbar);
    
    function placeIframeOnBottom(oCont, bShow, sSrc) {
        var oIFR = ess.dom.getById('ifr' + oCont.id);

        if (bShow) {
            if (oIFR == null) {
                var oIFR = document.createElement('iframe');
                oIFR.id = 'ifr' + oCont.id;
                if (sSrc != null)
                    oIFR.src = sSrc;

                oIFR.style.top = '0px';
                oIFR.style.left = '0px';
                oIFR.style.width = '310px';
                oIFR.style.height = '210px';
                oIFR.style.filter = "progid:DXImageTransform.Microsoft.Alpha(opacity=90)";
                oIFR.scrolling = 'no';
                oIFR.frameBorder = 'no';
                oIFR.style.border = '1px solid';
                oIFR.style.position = 'absolute';
                oCont.parentNode.appendChild(oIFR);
            }

            var oDims = new ess.dom.positioning.dims(oCont);

            //oIFR.style.width=oDims.w;
            //oIFR.style.height=oDims.h;
            oIFR.style.top = oDims.t + oDims.h + 'px';
            oIFR.style.left = oDims.l + 'px';

            var iIndex = ess.dom.getCurrentStyle(oCont, 'zIndex');
            if (iIndex == null || iIndex == 0)
                oCont.style.zIndex = 1;
            oIFR.style.zIndex = oCont.style.zIndex + 1;
            oIFR.style.display = "block";

        }
        else if (oIFR != null)
            oIFR.style.display = 'none';
    }   
</script>

<%--<%@ Import NameSpace="LionSky.WebControls"%>
<script runat=server>
Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init 
CType(editorContent.RichText.HtmlEditorControl, LionSky.WebControls.WebHtmlEditor).AllowScript = False
            Dim toolbar1 As New Toolbar
            toolbar1.Name = "BasicToolbar"
            toolbar1.IsDockable = False
            toolbar1.DockingZone = ToolbarDockingZone.None
            toolbar1.Tools.Add(New ToolbarButton(LionSky.WebControls.ButtonType.Button, "CTRL+B", "Bold"))
            toolbar1.Tools.Add(New ToolbarButton(LionSky.WebControls.ButtonType.Button, "CTRL+I", "Italic"))
            toolbar1.Tools.Add(New ToolbarButton(LionSky.WebControls.ButtonType.Button, "CTRL+U", "Underline"))
            toolbar1.Tools.Add(New ToolbarDropDown(LionSky.WebControls.ButtonType.DropDown, String.Empty, "FontName"))
            toolbar1.Tools.Add(New ToolbarDropDown(LionSky.WebControls.ButtonType.DropDown, String.Empty, "FontSize"))
            toolbar1.Tools.Add(New ToolbarDropDown(LionSky.WebControls.ButtonType.DropDown, String.Empty, "ForeColor"))
            toolbar1.Tools.Add(New ToolbarDropDown(LionSky.WebControls.ButtonType.DropDown, String.Empty, "BackColor"))
            toolbar1.Tools.Add(New ToolbarButton(LionSky.WebControls.ButtonType.Button, String.Empty, "Superscript"))
            toolbar1.Tools.Add(New ToolbarButton(LionSky.WebControls.ButtonType.Button, String.Empty, "Subscript"))
            toolbar1.Tools.Add(New ToolbarButton(LionSky.WebControls.ButtonType.Button, String.Empty, "JustifyLeft"))
            toolbar1.Tools.Add(New ToolbarButton(LionSky.WebControls.ButtonType.Button, String.Empty, "JustifyCenter"))
            toolbar1.Tools.Add(New ToolbarButton(LionSky.WebControls.ButtonType.Button, String.Empty, "JustifyRight"))
            toolbar1.Tools.Add(New ToolbarButton(LionSky.WebControls.ButtonType.Button, String.Empty, "JustifyFull"))
            toolbar1.Tools.Add(New ToolbarButton(LionSky.WebControls.ButtonType.Button, String.Empty, "InsertOrderedList"))
            toolbar1.Tools.Add(New ToolbarButton(LionSky.WebControls.ButtonType.Button, String.Empty, "InsertUnorderedList"))
            toolbar1.Tools.Add(New ToolbarButton(LionSky.WebControls.ButtonType.Button, String.Empty, "Indent"))
            toolbar1.Tools.Add(New ToolbarButton(LionSky.WebControls.ButtonType.Button, String.Empty, "Outdent"))
            toolbar1.Tools.Add(New ToolbarDropDown(LionSky.WebControls.ButtonType.DropDown, String.Empty, "InsertEmot"))
			toolbar1.Tools.Add(New ToolbarButton(ButtonType.Button, String.Empty, "PasteFromWord"))
			Dim oTool As New ToolbarButton(ButtonType.Button, String.Empty, "CustomPasteWord")
			oTool.CustomOnClickEventBody = "CustomPasteWord(editor)"
			toolbar1.Tools.Add(oTool)
			oTool = New ToolbarButton(ButtonType.Button, String.Empty, "CustomIndent")
			oTool.CustomOnClickEventBody = "CustomIndent(editor)"
			toolbar1.Tools.Add(oTool)
            CType(editorContent.RichText.HtmlEditorControl, LionSky.WebControls.WebHtmlEditor).Toolbars.Add(toolbar1)
End Sub
</script>--%>