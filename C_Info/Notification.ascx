<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.NotificationSetting"
    CodeBehind="Notification.ascx.vb" %>
<%@ Register TagPrefix="c_info" TagName="AdminNavigator" Src="~/desktopmodules/c_info/AdminC_InfoNavigator.ascx" %>
<%@ Register TagPrefix="ess" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="ess" TagName="SectionHead" Src="~/controls/SectionHeadControl.ascx" %>
<c_info:adminnavigator id="AdminNavigator" runat="server">
</c_info:adminnavigator>
<div style="border: #cccccc 1px solid; background-color: white">
    <table id="tblBasic" runat="server" border="0" cellpadding="3" cellspacing="1" class="SubHead"
        width="500">
        <tr>
            <td>
                <asp:Label ID="lblBasicSettings" runat="server" CssClass="Head" resourcekey="BasicSettings">Basic Settings</asp:Label>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <ess:label id="plModuleOwner" runat="server" controlname="txtModuleOwner" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:TextBox ID="txtModuleOwner" runat="server"></asp:TextBox><asp:HyperLink runat="server"
                    ID="lnkSelUser" ImageUrl="~/images/icon_users_32px.gif">
                </asp:HyperLink>
                <input type="hidden" runat="server" id="hiddenUserType" value='0'>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <ess:SectionHead ID="dshSMS" CssClass="Head" runat="server" Text="SMS Setting" IsExpanded="False"
                    Section="tblSMS" ResourceKey="SMSSetting">
                </ess:SectionHead>
                <table class="SubHead" id="tblSMS" runat="server" cellspacing="1" cellpadding="3"
                    border="0">
                    <tr>
                        <td>
                            <ess:label id="plSMSAddress" runat="server" controlname="txtSMSAddress" suffix=":">
                            </ess:label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSMSAddress" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <ess:label id="plSMSPort" runat="server" controlname="txtSMSPort" suffix=":">
                            </ess:label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSMSPort" runat="server"></asp:TextBox><asp:RangeValidator ID="RangeValidator1"
                                runat="server" CssClass="NormalRed" ErrorMessage="[0-65535]" ControlToValidate="txtSMSPort"
                                MinimumValue="0" MaximumValue="65535" Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <ess:label id="plEnableSMS" runat="server" controlname="chkEnableSMS" suffix=":">
                            </ess:label>
                        </td>
                        <td>
                            <asp:CheckBox ID="chkEnableSMS" runat="server"></asp:CheckBox>
                        </td>
                    </tr>
                </table>
                <ess:SectionHead ID="dshEmail" runat="server" CssClass="Head" ResourceKey="EmailSetting"
                    IsExpanded="True" Section="tblEmail" Text="Email Setting">
                </ess:SectionHead>
                <table id="tblEmail" runat="server" border="0" cellpadding="3" cellspacing="1" class="SubHead">
                    <tr>
                        <td>
                            <ess:label id="plEnableEmail" runat="server" controlname="chkEnableEmail" suffix=":">
                            </ess:label>
                        </td>
                        <td align="left">
                            <asp:CheckBox ID="chkEnableEmail" runat="server" />
                        </td>
                    </tr>
                </table>
                <ess:SectionHead ID="dshLog" runat="server" CssClass="Head" ResourceKey="LogSetting"
                    IsExpanded="True" Section="tblLog" Text="Log Setting">
                </ess:SectionHead>
                <table id="tblLog" runat="server" border="0" cellpadding="3" cellspacing="1" class="SubHead">
                    <tr>
                        <td>
                            <ess:label id="plEnableLog" runat="server" controlname="chkEnableLog" suffix=":">
                            </ess:label>
                        </td>
                        <td align="left">
                            <asp:CheckBox ID="chkEnableLog" runat="server" Checked="true" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table class="SubHead" cellspacing="1" cellpadding="3" width="500" border="0">
        <tr>
            <td>
                <asp:Label ID="lblNotifyEvents" runat="server" CssClass="Head" resourcekey="NotifyEvents">Notify Events</asp:Label>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <ess:label id="plNotifyEvents" runat="server" suffix=":">
                </ess:label>
            </td>
            <td>
                <asp:CheckBoxList ID="chkNotifyEvents" runat="server" RepeatDirection="Horizontal"
                    CssClass="Normal">
                    <asp:ListItem Value="2" resourcekey="Add" Selected="True">Add</asp:ListItem>
                    <asp:ListItem Value="4" resourcekey="Delete" Selected="True">Delete</asp:ListItem>
                    <asp:ListItem Value="8" resourcekey="Modify" Selected="True">Modify</asp:ListItem>
                    <asp:ListItem Value="16" resourcekey="Approve" Selected="True">Approve</asp:ListItem>
                    <asp:ListItem Value="32" resourcekey="Reject" Selected="True">Reject</asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <ess:SectionHead ID="dshInfoUpdateXmlSettings" runat="server" CssClass="Head" ResourceKey="InfoUpdateXmlSettings"
                    IsExpanded="False" Section="tblInfoUpdateXmlSettings" Text="InfoUpdateXmlSettings">
                </ess:SectionHead>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table id="tblInfoUpdateXmlSettings" runat="server" border="0" cellpadding="3" cellspacing="1"
                    class="SubHead">
                    <tr>
                        <td>
                            <ess:label id="plDepartmentId" runat="server" controlname="txtDepartmentId" suffix=":">
                            </ess:label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtDepartmentId" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <ess:label id="plServiceTypeExtField" runat="server" controlname="txtServiceTypeExtField"
                                suffix=":">
                            </ess:label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtServiceTypeExtField" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <asp:LinkButton ID="cmdUpdate" runat="server" resourcekey="cmdUpdate" CssClass="CommandButton">Update</asp:LinkButton>
</div>
