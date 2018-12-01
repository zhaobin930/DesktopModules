<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="EditGeneralModule.ascx.cs"
    Inherits="EasySite.Modules.GeneralModule.EditGeneralModule" %>
<%@ Register TagPrefix="ess" TagName="Label" Src="~/Controls/LabelControl.ascx" %>
<table>
    <tr>
        <td class="SubHead">
            <ess:Label id="plControlMode" runat="server" CssClass="Normal" Suffix=":" EnableViewState="False"
                ControlName="drpSkinList">
            </ess:Label>
        </td>
        <td valign="top">
            <asp:RadioButtonList ID="radControlMode" runat="server" CssClass="Normal" RepeatDirection="Horizontal"
                OnSelectedIndexChanged="radControlMode_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Value="Code" resourcekey="Code" Selected="true"></asp:ListItem>
                <asp:ListItem Value="Skin" resourcekey="Skin"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
</table>
<table id="tblSkin" runat="server">
    <tr>
        <td class="SubHead">
            <ess:Label id="plSkins" runat="server" CssClass="Normal" Suffix=":" EnableViewState="False"
                ControlName="drpSkins"></ess:Label>
        </td>
        <td valign="top">
            <asp:DropDownList ID="drpSkins" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
</table>
<table cellpadding="0" cellspacing="0" border="0" width="100%" id="tblCode" runat="server">
    <tr valign="top">
        <td style="width: 200px" class="subhead">
            <ess:Label id="plBeforeLogin" runat="server" CssClass="Normal" Suffix=":" EnableViewState="False"
                ControlName="txtBeforeLogin">
            </ess:Label>
        </td>
        <td>
            <asp:TextBox ID="txtBeforeLogin" runat="server" TextMode="MultiLine"
                Width="600px" Height="300px"></asp:TextBox>
            <asp:Label ID="lblBeforeMessage" runat="server" CssClass="SubHead" Visible="false"
                resourcekey="CanNotEditCode"></asp:Label>
        </td>
    </tr>
    <tr valign="top">
        <td style="width: 200px" class="subhead">
            <ess:Label id="plAfterLogin" runat="server" CssClass="Normal" EnableViewState="False"
                ControlName="txtAfterLogin" Suffix=":">
            </ess:Label>
        </td>
        <td>
            <asp:TextBox ID="txtAfterLogin" runat="server" Height="300px"
                TextMode="MultiLine" Width="600px"></asp:TextBox>
            <asp:Label ID="lblAfterMessage" runat="server" CssClass="SubHead" resourcekey="CanNotEditCode"
                Visible="false"></asp:Label>
        </td>
    </tr>
</table>
<p>
    <asp:LinkButton ID="cmdUpdate" runat="server" EnableViewState="False" resourcekey="cmdUpdate"
        CssClass="AdminButton" OnClick="cmdUpdate_Click">Update</asp:LinkButton>
    &nbsp; &nbsp;
    <asp:LinkButton ID="cmdCancel" runat="server" EnableViewState="False" resourcekey="cmdCancel"
        CssClass="AdminButton" OnClick="cmdCancel_Click">Cancel</asp:LinkButton>
</p>
