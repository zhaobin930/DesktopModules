<%@ Page Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.C_InfoCopyMove"
    CodeBehind="C_InfoCopyMove.aspx.vb" %>

<%@ Register TagPrefix="Portal" TagName="TreeModules" Src="~/DesktopModules/C_Info/TreeModules.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        TD
        {
            font-size: 12px;
            color: #000000;
        }
        P
        {
            font-size: 12px;
            color: #666666;
        }
        LI
        {
            font-size: 12px;
            color: #666666;
        }
        SELECT
        {
            font-size: 12px;
            color: #666666;
        }
        INPUT
        {
            font-size: 12px;
            color: #666666;
        }
        .input01
        {
            font-size: 12px;
            width: 120px;
            color: #000000;
            height: 20px;
        }
        .input02
        {
            font-size: 12px;
            width: 160px;
            color: #000000;
            height: 20px;
        }
        .button01
        {
            font-size: 12px;
            width: 120px;
            cursor: hand;
            height: 20px;
        }
        .button00
        {
            font-size: 12px;
            cursor: hand;
            height: 20px;
        }
    </style>
</head>
<body>
    <form id="Form" runat="server" target="_self">
    <table width="100%" height="40" border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee">
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <font color="#000000" size="4"><strong>
                    <asp:Label ID="lblSelDoc" runat="server"></asp:Label></strong></font>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
    <table width="100%" cellpadding="3" cellspacing="0">
        <tr>
            <td>
                <asp:Button ID="btnConfirm" runat="server"></asp:Button>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCopyMove" runat="server"></asp:Label>
                <Portal:TreeModules id="TreeModulesMore" runat="server" PageLoadBindTree="true">
                </Portal:TreeModules>
                <asp:DropDownList ID="cboCopyMove" runat="server" Visible="false">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
