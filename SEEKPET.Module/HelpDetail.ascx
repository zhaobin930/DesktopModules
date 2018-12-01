<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HelpDetail.ascx.cs"
    Inherits="SEEKPET.Module.HelpDetail" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<!--******************************详细信息页面代码********************************-->
<div id="InfoDiv" runat="server">
    <table border="0" cellspacing="0" cellpadding="3" class="normaltable moduletable" width="100%">
        <tr>
            <td class='tdLeft'>
                特征：
            </td>
            <td class='tdRight'>
                <asp:Label runat='server' ID='lblFeature' CssClass='normal'></asp:Label>
            </td>
        </tr>
        <tr>
            <td class='tdLeft'>
                地点：
            </td>
            <td class='tdRight'>
                <asp:Label runat='server' ID='lblAddress' CssClass='normal'></asp:Label>
            </td>
        </tr>
        <tr>
            <td class='tdLeft'>
                报酬：
            </td>
            <td class='tdRight'>
                <asp:Label runat='server' ID='lblPay' CssClass='normal'></asp:Label>
            </td>
        </tr>
        <tr>
            <td class='tdLeft'>
                说明：
            </td>
            <td class='tdRight'>
                <asp:Label runat='server' ID='lblDescription' CssClass='normal'></asp:Label>
            </td>
        </tr>
        <tr>
            <td class='tdLeft'>
            </td>
            <td class='tdRight'>
                <asp:Image runat='server' ID='imgPicture' CssClass='normal' Width="300px"></asp:Image>
            </td>
        </tr>
        <tr>
            <td class='tdLeft'>
                时间：
            </td>
            <td class='tdRight'>
                <asp:Label runat='server' ID='lblCreateTime' CssClass='normal'></asp:Label>
            </td>
        </tr>
        <tr>
            <td class='tdRight' colspan="2">
                <asp:HyperLink runat='server' ID='hlkExit' CssClass='ButtonCss80'>返回</asp:HyperLink>
            </td>
        </tr>
    </table>
</div>
