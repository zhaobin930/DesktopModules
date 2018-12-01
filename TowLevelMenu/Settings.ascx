<%@ Register TagPrefix="ess" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.TowLevelMenu.Settings"
    Codebehind="Settings.ascx.vb" %>
<table class="SubHead"  cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr id="trPortals" runat="server">
        <td width="175px">
            <ess:label id="plPortals"  controlname="drpPortals" suffix=":"
                runat="server">
            </ess:label></td>
        <td>
            <asp:DropDownList ID="drpPortals" runat="server" Width="250px"
                AutoPostBack="True" DataTextField="PortalName" DataValueField="PortalID">
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td>
            <ess:label id="plTabs"  controlname="drpTabs" suffix=":" runat="server">
            </ess:label></td>
        <td>
            <asp:DropDownList ID="drpTabs" runat="server" Width="250px"
                DataTextField="TabName" DataValueField="TabId">
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td>
            <ess:label id="plDisplaySubLevel" controlname="drpDisplayLevel"
                suffix=":" runat="server">
            </ess:label></td>
        <td>
            <font face="ËÎÌו">
                <asp:CheckBox ID="chkDisplaySubLevel" runat="server" ></asp:CheckBox></font></td>
    </tr>
</table>
<table class="SubHead"  cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr>
        <td width="175px" nowrap>
            <ess:label id="plMenuHeader" controlname="txtMenuHeader"
                suffix=":" runat="server">
            </ess:label></td>
        <td>
            <asp:TextBox ID="txtMenuHeader"  runat="server" Width="592px"
                TextMode="MultiLine" Height="80px"></asp:TextBox></td>
    </tr>
    <tr>
        <td nowrap="nowrap" width="175px">
            <ess:label id="plMenuFirstLevelFirstHeader"  controlname="txtMenuFirstLevelFirstHeader"
                suffix=":" runat="server">
            </ess:label>
        </td>
        <td>
            <asp:TextBox ID="txtMenuFirstLevelFirstHeader"  runat="server" Width="592px" TextMode="MultiLine"
                Height="80px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td nowrap>
            <ess:label id="plMenuFirstLevelHeader"  controlname="txtMenuFirstLevelHeader"
                suffix=":" runat="server">
            </ess:label></td>
        <td>
            <asp:TextBox ID="txtMenuFirstLevelHeader" runat="server"
                Width="592px" TextMode="MultiLine" Height="60px"></asp:TextBox></td>
    </tr>
    <tr>
        <td nowrap>
            <ess:label id="plMenuFirstLevelFooter" runat="server" suffix=":" controlname="txtMenuFirstLevelFooter"
                >
            </ess:label></td>
        <td>
            <asp:TextBox ID="txtMenuFirstLevelFooter" runat="server"
                Width="592px" Height="60px" TextMode="MultiLine"></asp:TextBox></td>
    </tr>
     <tr>
        <td nowrap="nowrap" width="175px">
            <ess:label id="plMenuFirstLevelLastFooter"  controlname="txtMenuFirstLevelLastFooter"
                suffix=":" runat="server">
            </ess:label>
        </td>
        <td>
            <asp:TextBox ID="txtMenuFirstLevelLastFooter"  runat="server" Width="592px" TextMode="MultiLine"
                Height="80px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td nowrap>
            <ess:label id="plSubGroupHeader" controlname="txtMenuFirstLevelFooter" suffix=":"
                runat="server">
            </ess:label></td>
        <td>
            <asp:TextBox ID="txtSubGroupHeader" runat="server" Width="592px" TextMode="MultiLine"
                Height="60px"></asp:TextBox></td>
    </tr>
    <tr>
        <td nowrap>
            <ess:label id="plMenuSecondLevelHeader" controlname="txtMenuSecondLevelHeader"
                suffix=":" runat="server">
            </ess:label></td>
        <td>
            <asp:TextBox ID="txtMenuSecondLevelHeader"  runat="server"
                Width="592px" TextMode="MultiLine" Height="60px"></asp:TextBox></td>
    </tr>
    <tr>
        <td nowrap>
            <ess:label id="plMenuSecondLevelFooter" runat="server" suffix=":" controlname="txtMenuSecondLevelFooter"
                >
            </ess:label></td>
        <td>
            <asp:TextBox ID="txtMenuSecondLevelFooter" runat="server" 
                Width="592px" Height="60px" TextMode="MultiLine"></asp:TextBox></td>
    </tr>
    <tr>
        <td nowrap>
            <ess:label id="plSubGroupFooter" runat="server" suffix=":" controlname="txtMenuSecondLevelFooter">
            </ess:label></td>
        <td>
            <asp:TextBox ID="txtSubGroupFooter" runat="server" Width="592px" Height="60px" TextMode="MultiLine"></asp:TextBox></td>
    </tr>
    <tr>
        <td nowrap>
            <ess:label id="plMenuFooter"  controlname="txtMenuFooter"
                suffix=":" runat="server">
            </ess:label></td>
        <td>
            <asp:TextBox ID="txtMenuFooter" runat="server" Width="592px" TextMode="MultiLine"
                Height="60px"></asp:TextBox></td>
    </tr>
    <tr>
        <td nowrap>
            <ess:label id="plMenuItemTemplate"  controlname="txtMenuItemTemplate"
                suffix=":" runat="server">
            </ess:label></td>
        <td>
            <asp:TextBox ID="txtMenuItemTemplate" runat="server" Width="592px" TextMode="MultiLine"
                Height="60px"></asp:TextBox></td>
    </tr>
</table>
<table class="SubHead"  cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr>
        <td width="175px">
            <ess:label id="plMenuFirstLevelRepeatDirection"  controlname="rbMenuFirstLevelRepeatDirection"
                suffix=":" runat="server">
            </ess:label></td>
        <td>
            <asp:RadioButtonList ID="rbMenuFirstLevelRepeatDirection"
                runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                <asp:ListItem Value="H" Selected="True" resourcekey="horz">Horz</asp:ListItem>
                <asp:ListItem Value="V" resourcekey="vert">Vert</asp:ListItem>
            </asp:RadioButtonList></td>
    </tr>
    <tr>
        <td width="175px">
            <ess:label id="plMenuFirstLevelColumns" controlname="drpTabs"
                suffix=":" runat="server">
            </ess:label></td>
        <td>
            <asp:TextBox ID="txtMenuFirstLevelColumns" runat="server"
                Width="48px"></asp:TextBox>
            <asp:CompareValidator ID="cmpMenuFirstLevelColumns" runat="server" 
                CssClass="normalred" ErrorMessage="Must Greater Than Zero" Type="Integer" Display="Dynamic"
                ControlToValidate="txtMenuFirstLevelColumns" ValueToCompare="0" Operator="GreaterThan"></asp:CompareValidator></td>
    </tr>
    <tr>
        <td width="175px">
            <ess:label id="plMenuSecondLevelRepeatDirection" controlname="rbMenuSecondLevelRepeatDirection"
                suffix=":" runat="server">
            </ess:label></td>
        <td>
            <asp:RadioButtonList ID="rbMenuSecondLevelRepeatDirection" runat="server" RepeatLayout="Flow"
                RepeatDirection="Horizontal">
                <asp:ListItem Value="H" Selected="True" resourcekey="horz">Horz</asp:ListItem>
                <asp:ListItem Value="V" resourcekey="vert">Vert</asp:ListItem>
            </asp:RadioButtonList></td>
    </tr>
    <tr>
        <td width="175px">
            <ess:label id="plMenuSecondLevelColumns"  controlname="drpTabs"
                suffix=":" runat="server">
            </ess:label></td>
        <td>
            <asp:TextBox ID="txtMenuSecondLevelColumns" runat="server" Width="48px"></asp:TextBox>
            <asp:CompareValidator ID="cmpMenuSecondLevelColumns" runat="server" CssClass="normalred"
                ErrorMessage="Must Greater Than Zero" Type="Integer" Display="Dynamic" ControlToValidate="txtMenuSecondLevelColumns"
                ValueToCompare="0" Operator="GreaterThan"></asp:CompareValidator></td>
    </tr>
    <tr>
        <td width="175px">
            <ess:label id="plDisplayHiddenTabs"  controlname="chkDisplayHiddenTabs"
                suffix=":" runat="server">
            </ess:label></td>
        <td>
            <asp:CheckBox ID="chkDisplayHiddenTabs"  runat="server"></asp:CheckBox></td>
    </tr>
    <tr>
        <td width="175px">
            <ess:label id="plDisplayCurrentSubTabs" runat="server" suffix=":" controlname="chkDisplayCurrentSubTabs"
               >
            </ess:label></td>
        <td>
            <asp:CheckBox ID="chkDisplayCurrentSubTabs" runat="server" ></asp:CheckBox></td>
    </tr>
</table>
<table class="SubHead"  cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr>
        <td width="175px">
            <ess:label id="plStyleName"  controlname="txtStyleName" suffix=":"
                runat="server">
            </ess:label></td>
        <td>
            <asp:TextBox ID="txtStyleName" runat="server" Width="150px"></asp:TextBox>&nbsp;
            <asp:LinkButton ID="lnkSaveStyle" runat="server" CssClass="CommonButton"
                resourcekey="SaveStyle">Save Style</asp:LinkButton></td>
    </tr>
    <tr>
        <td width="175px">
            <ess:label id="plStyles" controlname="drpStyles" suffix=":" runat="server">
            </ess:label></td>
        <td>
            <asp:DropDownList ID="drpStyles" runat="server" Width="150px" DataTextField="TabName"
                DataValueField="TabId">
            </asp:DropDownList>&nbsp;
            <asp:LinkButton ID="lnkLoadStyle" runat="server" CssClass="CommonButton"
                resourcekey="LoadStyle">Load Style</asp:LinkButton>&nbsp;&nbsp;
            <asp:LinkButton ID="lnkDeleteStyle" runat="server" CssClass="CommonButton" resourcekey="DeleteStyle">Delete Style</asp:LinkButton></td>
    </tr>
</table>
