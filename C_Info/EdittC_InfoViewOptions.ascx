<%@ Register TagPrefix="Portal" TagName="TreeModules" Src="~/DesktopModules/C_Info/TreeModules.ascx" %>
<%@ Register TagPrefix="Portal" TagName="TreeServerModules" Src="~/DesktopModules/C_Info/TreeServerModules.ascx" %>
<%@ Register TagPrefix="ESS" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="Portal" TagName="Skin" Src="~/controls/SkinControl.ascx" %>
<%@ Register TagPrefix="Portal" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.EdittC_InfoViewOptions"
    CodeBehind="EdittC_InfoViewOptions.ascx.vb" %>
<%@ Register TagPrefix="Portal" TagName="SelWorkFlow" Src="~/DesktopModules/C_Info/SelWorkFlow.ascx" %>
<%@ Register TagPrefix="ess" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="ess" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<link id="luna-tab-style-sheet" href="<%= ModulePath %>images/tabpane.css" type="text/css"
    rel="stylesheet">
<div id="tabContainer" runat="server" style="text-align: left">
    <ess:SectionHead ID="dshNormalInfomation" CssClass="Head" runat="server" Section="tblNormalInfomation"
        ResourceKey="NormalInfomation" IsTabPane="true">
    </ess:SectionHead>
    <table id="tblNormalInfomation" runat="server" cellspacing="2" cellpadding="1" width="100%">
        <tr>
            <td class="SubHead" width="160">
                <ess:label id="plRows" runat="server" controlname="txtRows" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:TextBox ID="txtRows" runat="server">5</asp:TextBox><asp:CompareValidator ID="CompareValidator1"
                    runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtRows"
                    ErrorMessage="整数格式" resourcekey="IntegerFormat.ErrorMessage" CssClass="NormalRed"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plColumns" runat="server" controlname="txtColumns" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:TextBox ID="txtColumns" runat="server">1</asp:TextBox><asp:CompareValidator
                    ID="CompareValidator2" runat="server" Operator="DataTypeCheck" Type="Integer"
                    ControlToValidate="txtColumns" ErrorMessage="整数格式" resourcekey="IntegerFormat.ErrorMessage"
                    CssClass="NormalRed"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plMoreRows" runat="server" controlname="txtMoreRows" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:TextBox ID="txtMoreRows" runat="server">25</asp:TextBox><asp:CompareValidator
                    ID="CompareValidator3" runat="server" Operator="DataTypeCheck" Type="Integer"
                    ControlToValidate="txtMoreRows" ErrorMessage="整数格式" resourcekey="IntegerFormat.ErrorMessage"
                    CssClass="NormalRed"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plMoreColumns" runat="server" controlname="txtMoreColumns" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:TextBox ID="txtMoreColumns" runat="server">1</asp:TextBox><asp:CompareValidator
                    ID="CompareValidator4" runat="server" Operator="DataTypeCheck" Type="Integer"
                    ControlToValidate="txtMoreColumns" ErrorMessage="整数格式" resourcekey="IntegerFormat.ErrorMessage"
                    CssClass="NormalRed"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plTitleCount" runat="server" controlname="txtTitleCount" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:TextBox ID="txtTitleCount" runat="server"></asp:TextBox><asp:CompareValidator
                    ID="CompareValidator5" runat="server" Operator="DataTypeCheck" Type="Integer"
                    ControlToValidate="txtTitleCount" ErrorMessage="整数格式" Display="Dynamic" resourcekey="IntegerFormat.ErrorMessage"
                    CssClass="NormalRed"></asp:CompareValidator><br />
                <asp:CheckBox ID="chkShowTitleAlter" runat="server" resourcekey="ShowTitleAlter"
                    CssClass="Normal"></asp:CheckBox><asp:CheckBox ID="chkShowShortTitle" runat="server" resourcekey="ShowShortTitle"
                    CssClass="Normal"></asp:CheckBox>
                
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plDescriptionCount" runat="server" controlname="txtDescriptionCount"
                    suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:TextBox ID="txtDescriptionCount" runat="server"></asp:TextBox><asp:CompareValidator
                    ID="cmpValDescription" runat="server" Operator="DataTypeCheck" Type="Integer"
                    ControlToValidate="txtDescriptionCount" ErrorMessage="整数格式" Display="Dynamic"
                    resourcekey="IntegerFormat.ErrorMessage" CssClass="NormalRed"></asp:CompareValidator><asp:CheckBox ID="chkAutoSummary" runat="server" resourcekey="AutoSummary"
                    CssClass="Normal"></asp:CheckBox>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plExceHtml" runat="server" controlname="txtExceHtml" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:TextBox ID="txtExceHtml" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plInfoTarget" runat="server" controlname="cboInfoTarget" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:DropDownList ID="cboInfoTarget" runat="server">
                    <asp:ListItem Value="_blank" resourcekey="_Blank"></asp:ListItem>
                    <asp:ListItem Value="_self" resourcekey="_Self"></asp:ListItem>
                    <asp:ListItem Value="disable" resourcekey="Disable"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plSort" runat="server" controlname="cboSort" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:DropDownList ID="cboSort" runat="server">
                    <asp:ListItem Value="CreateDate DESC" resourcekey="CreateDateDesc"></asp:ListItem>
                    <asp:ListItem Value="CreateDate ASC" resourcekey="CreateDateAsc"></asp:ListItem>
                    <asp:ListItem Value="SortDate DESC" resourcekey="SortDesc"></asp:ListItem>
                    <asp:ListItem Value="SortDate ASC" resourcekey="SortAsc"></asp:ListItem>
                    <asp:ListItem Value="Title ASC" resourcekey="TitleAsc"></asp:ListItem>
                    <asp:ListItem Value="Title DESC" resourcekey="TitleDesc"></asp:ListItem>
                    <asp:ListItem Value="Author ASC" resourcekey="AuthorAsc"></asp:ListItem>
                    <asp:ListItem Value="Author DESC" resourcekey="AuthorDesc"></asp:ListItem>
                    <asp:ListItem Value="ApproveStatus ASC" resourcekey="ApproveStatusAsc"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plTimeFormat" runat="server" controlname="cboTimeFormat" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:DropDownList ID="cboTimeFormat" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="" resourcekey="PleaseSelect"></asp:ListItem>
                    <asp:ListItem Value="yyyy-MM-dd">1980-2-20</asp:ListItem>
                    <asp:ListItem Value="MM/dd/yyyy">02/20/1980</asp:ListItem>
                    <asp:ListItem Value="MM-dd">2-20</asp:ListItem>
                    <asp:ListItem Value="yyyy$$MM$$dd" resourcekey="UserDefine"></asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txtTimeFormat" runat="server" Visible="False" Width="240px">yy-MM-dd</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plShowType" runat="server" suffix=":" controlname="radShowType" DESIGNTIMEDRAGDROP="913">
                </ess:label>
            </td>
            <td class="Normal">
                <asp:RadioButtonList ID="radShowType" runat="server" Width="216px" RepeatDirection="Horizontal"
                    CssClass="Normal">
                    <asp:ListItem Value="More" Selected="True" resourcekey="More"></asp:ListItem>
                    <asp:ListItem Value="Pager" resourcekey="Pager"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="SubHead" height="15">
                <ess:label id="plShowMode" runat="server" controlname="cboShowMode" suffix=":">
                </ess:label>
            </td>
            <td class="SubHead" height="15">
                <asp:DropDownList ID="cboShowMode" runat="server">
                    <asp:ListItem Value="Table">Table</asp:ListItem>
                    <asp:ListItem Value="Flow">Flow</asp:ListItem>
                    <asp:ListItem Value="UL">UL</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plWorkFlow" runat="server" controlname="SelWorkFlow" suffix=":">
                </ess:label>
            </td>
            <td>
                <Portal:SELWORKFLOW id="SelWorkFlow" runat="server">
                </Portal:SELWORKFLOW>
                <asp:CheckBox ID="chkAllowFlowStepChoice" runat="server" resourcekey="AllowFlowStepChoice"
                    CssClass="Normal"></asp:CheckBox>
            </td>
        </tr>
        <tr>
            <td class="SubHead" height="15">
                <ess:label id="plNeedPublisherAudit" runat="server" controlname="chkNeedPublisherAudit"
                    suffix=":">
                </ess:label>
            </td>
            <td class="SubHead" height="15">
                <asp:CheckBox ID="chkNeedPublisherAudit" runat="server"></asp:CheckBox>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plPassStatus" runat="server" controlname="cboPassStatus" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:DropDownList ID="cboPassStatus" runat="server">
                    <asp:ListItem Value="0" resourcekey="CanModify"></asp:ListItem>
                    <asp:ListItem Value="1" resourcekey="AdminCanModify"></asp:ListItem>
                    <asp:ListItem Value="2" resourcekey="Archives"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plManageRole" runat="server" controlname="radManageRole" suffix=":">
                </ess:label>
            </td>
            <td class="Normal">
                <asp:RadioButtonList ID="radManageRole" runat="server" Width="216px" RepeatDirection="Horizontal"
                    CssClass="Normal">
                    <asp:ListItem Value="edit" resourcekey="EditRole" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="admin" resourcekey="AdminRole"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plOnlyCreatorEdit" runat="server" suffix=":" controlname="radManageRole">
                </ess:label>
            </td>
            <td class="Normal">
                <asp:CheckBox ID="chkOnlyCreatorEdit" runat="server"></asp:CheckBox>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plAllowSingleRight" runat="server" controlname="radManageRole" suffix=":">
                </ess:label>
            </td>
            <td class="Normal">
                <asp:CheckBox ID="chkAllowSingleRight" runat="server"></asp:CheckBox>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plRemarkType" runat="server" controlname="chkAnonyRemark" suffix=":">
                </ess:label>
            </td>
            <td class="SubHead">
                <asp:RadioButtonList ID="radRemarkType" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" resourcekey="DisableRemark">DisableRemark</asp:ListItem>
                    <asp:ListItem Value="2" resourcekey="AnonymousRemark" Selected="True">AnonymousRemark</asp:ListItem>
                    <asp:ListItem Value="3" resourcekey="UserRemark">UserRemark</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="display: none">
            <td class="SubHead">
                <ess:label id="plDeployTabWhenUpdate" runat="server" controlname="chkDeployTabWhenUpdate"
                    suffix=":">
                </ess:label>
            </td>
            <td class="SubHead">
                <asp:CheckBox ID="chkDeployTabWhenUpdate" runat="server" Checked="True"></asp:CheckBox>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plDeplayTabs" runat="server" controlname="txtDeplayTabs" suffix=":">
                </ess:label>
            </td>
            <td class="SubHead">
                <asp:TextBox ID="txtDeplayTabs" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plRss" runat="server" controlname="lblRss" suffix=":">
                </ess:label>
            </td>
            <td class="SubHead">
                <asp:Label ID="lblRss" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <ess:SectionHead ID="dshSkinSetup" CssClass="Head" runat="server" Section="tblSkinSetup"
        ResourceKey="SkinSetup" IsTabPane="true">
    </ess:SectionHead>
    <table id="tblSkinSetup" runat="server" cellspacing="1" cellpadding="3" width="100%">
        <tr>
            <td class="SubHead" width="160">
                <ess:label id="plTabID" runat="server" controlname="cboTabID" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:DropDownList ID="cboTabID" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plMoreTabID" runat="server" controlname="cboMoreTabID" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:DropDownList ID="cboMoreTabID" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plDetailSkin" runat="server" controlname="DetailSkin" suffix=":">
                </ess:label>
            </td>
            <td>
                <Portal:skin id="DetailSkin" runat="server">
                </Portal:skin>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plDocStandard" runat="server" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:RadioButtonList ID="radDocStandard" runat="server" CssClass="Normal" RepeatDirection="Horizontal">
                    <asp:ListItem Value="NoStandard" resourcekey="NoStandard">NoStandard</asp:ListItem>
                    <asp:ListItem Value="CNGOV" Selected="True" resourcekey="CNGOV">CNGOV</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plMoreSkin" runat="server" controlname="MoreSkin" suffix=":">
                </ess:label>
            </td>
            <td>
                <Portal:skin id="MoreSkin" runat="server">
                </Portal:skin>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plMoreTabSkin" runat="server" controlname="MoreTabSkin" suffix=":">
                </ess:label>
            </td>
            <td>
                <Portal:skin id="MoreTabSkin" runat="server">
                </Portal:skin>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plEditorDefineStyle" runat="server" controlname="EditorDefineStyle"
                    suffix=":">
                </ess:label>
            </td>
            <td>
                <ess:texteditor id="EditorDefineStyle" runat="server" Width="600" Height="300" HtmlEncode="False">
                </ess:texteditor>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plEditorModuleStyle" runat="server" controlname="EditorModuleStyle"
                    suffix=":">
                </ess:label>
            </td>
            <td>
                <ess:texteditor id="EditorModuleStyle" runat="server" Height="300" Width="600" HtmlEncode="False">
                </ess:texteditor>
            </td>
        </tr>
    </table>
    <ess:SectionHead ID="dshImage" CssClass="Head" runat="server" Section="tblImage"
        ResourceKey="Image" IsTabPane="true">
    </ess:SectionHead>
    <table id="tblImage" runat="server" cellspacing="3" cellpadding="2" width="100%"
        border="0">
        <tr>
            <td width="200" class="SubHead">
                <ess:label id="plImageShowType" runat="server" CssClass="SubHead" controlname="radImageShowType"
                    suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:RadioButtonList runat="server" CssClass="Normal" ID="radImageShowType" AutoPostBack="true"
                    OnSelectedIndexChanged="radImageShowType_CheckedChanged" RepeatDirection="Horizontal">
                    <asp:ListItem resourcekey="OriginalImage" Selected="True" Value="OriginalImage">Original Image</asp:ListItem>
                    <asp:ListItem resourcekey="AlternateImage" Value="AlternateImage">Alternate Image</asp:ListItem>
                    <asp:ListItem resourcekey="AlternateText" Value="AlternateText">Alternate Text</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table id="tblOriginalImage" runat="server" visible="false">
                    <tr>
                        <td class="SubHead" width="200">
                            <ess:label id="plImageInfoRows" runat="server" controlname="txtImageInfoRows" suffix=":">
                            </ess:label>
                        </td>
                        <td class="SubHead">
                            <asp:TextBox ID="txtImageInfoRows" runat="server"></asp:TextBox><asp:CompareValidator
                                ID="Comparevalidator7" runat="server" Operator="DataTypeCheck" Type="Integer"
                                ControlToValidate="txtImageInfoRows" resourcekey="IntegerFormat.ErrorMessage"
                                ErrorMessage="整数格式" CssClass="NormalRed"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="SubHead">
                            <ess:label id="plImgAlign" runat="server" controlname="cboImgAlign" suffix=":">
                            </ess:label>
                        </td>
                        <td>
                            <asp:DropDownList ID="cboImgAlign" runat="server">
                                <asp:ListItem Value="" resourcekey="None"></asp:ListItem>
                                <asp:ListItem Value="left" resourcekey="Left"></asp:ListItem>
                                <asp:ListItem Value="right" resourcekey="Right"></asp:ListItem>
                                <asp:ListItem Value="top" resourcekey="Top"></asp:ListItem>
                                <asp:ListItem Value="bottom" resourcekey="Bottom"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="SubHead">
                            <ess:label id="plImageWidth" runat="server" controlname="txtImageWidth" suffix=":">
                            </ess:label>
                        </td>
                        <td class="Normal">
                            <asp:TextBox ID="txtImageWidth" runat="server"></asp:TextBox><asp:CompareValidator
                                ID="Comparevalidator8" runat="server" Operator="DataTypeCheck" Type="Integer"
                                ControlToValidate="txtImageWidth" ErrorMessage="整数格式" resourcekey="IntegerFormat.ErrorMessage"
                                CssClass="NormalRed"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="SubHead">
                            <ess:label id="plImageHeight" runat="server" controlname="txtImageHeight" suffix=":">
                            </ess:label>
                        </td>
                        <td class="Normal">
                            <asp:TextBox ID="txtImageHeight" runat="server"></asp:TextBox><asp:CompareValidator
                                ID="Comparevalidator9" runat="server" Operator="DataTypeCheck" Type="Integer"
                                ControlToValidate="txtImageHeight" resourcekey="IntegerFormat.ErrorMessage" ErrorMessage="整数格式"
                                CssClass="NormalRed"></asp:CompareValidator>
                        </td>
                    </tr>
                </table>
                <table runat="server" id="tblAlternateImage" visible="false">
                    <tr>
                        <td class="SubHead" width="200">
                            <ess:label id="plAlternateImageURL" runat="server" controlname="ctlAlternateImageURL"
                                suffix=":">
                            </ess:label>
                        </td>
                        <td>
                            <Portal:url id="ctlAlternateImageURL" runat="server" showlog="False" showtabs="False"
                                urltype="U" width="250" ShowTrack="false" FileFilter="jpg,jpeg,gif,png,bmp">
                            </Portal:url>
                        </td>
                    </tr>
                </table>
                <table id="tblAlternateText" runat="server" visible="false">
                    <tr>
                        <td class="SubHead" width="200">
                            <ess:label id="plAlternateText" runat="server" controlname="txtAlternateText" suffix=":">
                            </ess:label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAlternateText" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plWaterMark" runat="server" controlname="ctlWaterMarkURL" suffix=":">
                </ess:label>
            </td>
            <td class="Normal">
                <Portal:url id="ctlWaterMarkURL" runat="server" width="300" urltype="U" showlog="False"
                    showtabs="False" ShowTrack="false" FileFilter="jpg,jpeg,gif,png,bmp">
                </Portal:url>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plLogoURL" runat="server" controlname="ctlLogoURL" suffix=":">
                </ess:label>
            </td>
            <td>
                <Portal:url id="ctlLogoURL" runat="server" width="300" showlog="False" showtabs="False"
                    ShowTrack="false" urltype="U" FileFilter="jpg,jpeg,gif,png,bmp">
                </Portal:url>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plNewURL" runat="server" controlname="ctlNewURL" suffix=":">
                </ess:label>
            </td>
            <td>
                <Portal:url id="ctlNewURL" runat="server" width="300" showlog="False" showtabs="False"
                    ShowTrack="false" urltype="U">
                </Portal:url>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plTopURL" runat="server" controlname="ctlTopURL" suffix=":">
                </ess:label>
            </td>
            <td>
                <Portal:url id="ctlTopURL" runat="server" width="300" showlog="False" showtabs="False"
                    ShowTrack="false" urltype="U" FileFilter="jpg,jpeg,gif,png,bmp">
                </Portal:url>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plHotURL" runat="server" controlname="ctlHotURL" suffix=":">
                </ess:label>
            </td>
            <td>
                <Portal:url id="ctlHotURL" runat="server" width="300" showlog="False" showtabs="False"
                    ShowTrack="false" urltype="U">
                </Portal:url>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plRecommendURL" runat="server" controlname="ctlRecommendURL" suffix=":">
                </ess:label>
            </td>
            <td>
                <Portal:url id="ctlRecommendURL" runat="server" width="300" showlog="False" showtabs="False"
                    ShowTrack="false" urltype="U">
                </Portal:url>
            </td>
        </tr>
        <tr>
            <td class="Normal" colspan="2">
                <asp:CheckBox ID="chkIsRelease" runat="server" resourcekey="IsDirectPublish" Visible="False">
                </asp:CheckBox><asp:CheckBox ID="ChkIsShowNewIcon" Checked="true" runat="server" Visible="False" resourcekey="IsShowNewIcon"
                    CssClass="SubHead"></asp:CheckBox>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plNewDayCount" runat="server" controlname="txtNewDayCount" suffix=":">
                </ess:label>
            </td>
            <td class="Normal">
                <asp:TextBox ID="txtNewDayCount" runat="server">3</asp:TextBox><asp:CompareValidator
                    ID="Comparevalidator6" runat="server" Operator="DataTypeCheck" Type="Integer"
                    ControlToValidate="txtNewDayCount" resourcekey="IntegerFormat.ErrorMessage" ErrorMessage="整数格式"
                    CssClass="NormalRed"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plHotCount" runat="server" controlname="txtHotCount" suffix=":">
                </ess:label>
            </td>
            <td class="Normal">
                <asp:TextBox ID="txtHotCount" runat="server">100</asp:TextBox><asp:CompareValidator
                    ID="Comparevalidator10" runat="server" Operator="DataTypeCheck" Type="Integer"
                    ControlToValidate="txtHotCount" resourcekey="IntegerFormat.ErrorMessage" ErrorMessage="整数格式"
                    CssClass="NormalRed"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plMoreStyle" runat="server" controlname="txtMoreStyle" suffix=":">
                </ess:label>
            </td>
            <td class="Normal">
                <asp:TextBox ID="txtMoreStyle" runat="server" Width="192px">More...</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plMoreURL" runat="server" controlname="ctlMoreURL" suffix=":">
                </ess:label>
            </td>
            <td>
                <Portal:url id="ctlMoreURL" runat="server" width="300" urltype="U" showlog="False"
                    showtabs="False" ShowTrack="false">
                </Portal:url>
            </td>
        </tr>
    </table>
    <ess:SectionHead ID="dshOtherSetup" CssClass="Head" runat="server" Section="tblOtherSetup"
        ResourceKey="OtherSetup" IsTabPane="true">
    </ess:SectionHead>
    <table id="tblOtherSetup" runat="server" cellspacing="3" cellpadding="2" width="100%"
        border="0">
        <tr>
            <td class="SubHead" width="200">
                <ess:label id="plTitleLeftHTML" runat="server" controlname="txtTitleLeftHTML" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:TextBox ID="txtTitleLeftHTML" runat="server" Width="304px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plTitleRightHTML" runat="server" suffix=":" controlname="txtTitleRightHTML">
                </ess:label>
            </td>
            <td>
                <asp:TextBox ID="txtTitleRightHTML" runat="server" Width="304px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="SubHead" width="200">
                <ess:label id="plBeDetailStyleModule" runat="server" controlname="chkBeDetailStyleModule"
                    suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:CheckBox ID="chkBeDetailStyleModule" runat="server" />
            </td>
        </tr>
        <tr id="trIsCInfoShareModule" runat="server" visible="false">
            <td class="SubHead" width="200">
                <ess:label id="plIsCInfoShareModule" runat="server" controlname="chIsCInfoShareModule"
                    suffix="?">
                </ess:label>
            </td>
            <td>
                <asp:CheckBox ID="chkIsCInfoShareModule" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="SubHead" width="200">
                <ess:label id="plContainerCssClass" runat="server" controlname="txtContainerCssClass"
                    suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:TextBox ID="txtContainerCssClass" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="SubHead" width="200">
                <ess:label id="plItemCssClass" runat="server" controlname="txtItemCssClass" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:TextBox ID="txtItemCssClass" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="SubHead" width="200">
                <ess:label id="plAlterItemCssClass" runat="server" controlname="txtAlterItemCssClass"
                    suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:TextBox ID="txtAlterItemCssClass" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="SubHead" width="200">
                <ess:label id="plSplitor" runat="server" controlname="txtSplitor" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:TextBox ID="txtSplitor" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="SubHead">
                <ess:label id="plMoreModules" runat="server" controlname="chkMoreModules" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:CheckBoxList ID="chkMoreModules" runat="server" Visible="False" Width="100%"
                    RepeatColumns="4">
                </asp:CheckBoxList>
                <Portal:treemodules id="TreeModulesMore" runat="server">
                </Portal:treemodules>
            </td>
        </tr>
        <tr id="trCInfoDefaultShareModule" runat="server" visible="false">
            <td class="SubHead" width="200">
                <ess:label id="plCInfoDefaultShareModule" runat="server" controlname="TreeCInfoDefaultShareModule"
                    suffix=":">
                </ess:label>
            </td>
            <td>
                <Portal:TreeServerModules id="TreeCInfoDefaultShareModule" runat="server">
                </Portal:TreeServerModules>
            </td>
        </tr>
    </table>
</div>
<table cellspacing="2" cellpadding="1" width="100%" id="Table5">
    <tr>
        <td align="center">
            <asp:LinkButton ID="btnUpdate" runat="server" resourcekey="Update" class="CommandButton"></asp:LinkButton>&nbsp;
            <asp:LinkButton ID="btnCancel" runat="server" resourcekey="Cancel" class="CommandButton"
                CausesValidation="false"></asp:LinkButton>
        </td>
    </tr>
</table>
