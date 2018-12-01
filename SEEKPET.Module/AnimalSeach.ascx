<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AnimalSeach.ascx.cs"
    Inherits="SEEKPET.Module.AnimalSeach" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<script>
    jQuery(function () {
        jQuery(".normaltextsearch2").blur(function () {
            if (jQuery(this).val() == '') {
                jQuery(this).val('芯片编码');
            }
        });
        jQuery(".normaltextsearch2").focus(function () {
            if (jQuery(this).val() == '芯片编码') {
                jQuery(this).val('');
            }
        });
    });
</script>
<div class="mainpage">
    <asp:Panel runat="server" ID="paSeach">
        <asp:TextBox runat="server" ID="txtCode" CssClass="normaltextsearch2" Text="芯片编码"></asp:TextBox><br />
        <asp:Button runat="server" ID="btnSeach" Text="查询" OnClick="btnSeach_Click" CssClass="normalbuttonsearch2" />
        <div class="personanimal">
            <img src='/Portals/0/images/searchtip.png' />
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="paDetail" Visible="false">
        <!--******************************详细信息页面代码********************************-->
        <div id="InfoDiv">
            <div style="text-align: center; padding-top: 40px; padding-bottom: 40px">
                <asp:Image runat="server" ID="imgPicture" Width="200px" /></div>
            <table border="0" cellspacing="0" cellpadding="3" class="moduletable infotable" width="100%">
                <tr>
                    <td class='tdLeft' width="20%">
                        编号：
                    </td>
                    <td class='tdRight'>
                        <asp:Label runat='server' ID='lblNo' CssClass='normallabel'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class='tdLeft'>
                        名称：
                    </td>
                    <td class='tdRight'>
                        <asp:Label runat='server' ID='lblName' CssClass='normallabel'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class='tdLeft'>
                        性别：
                    </td>
                    <td class='tdRight'>
                        <asp:Label runat='server' ID='lblSex' CssClass='normallabel'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class='tdLeft'>
                        种类：
                    </td>
                    <td class='tdRight'>
                        <asp:Label runat='server' ID='lblKind' CssClass='normallabel'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class='tdLeft'>
                        年龄：
                    </td>
                    <td class='tdRight'>
                        <asp:Label runat='server' ID='lblAge' CssClass='normallabel'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class='tdLeft'>
                        毛色：
                    </td>
                    <td class='tdRight'>
                        <asp:Label runat='server' ID='lblColor' CssClass='normallabel'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class='tdLeft'>
                        <asp:Label runat='server' ID='lblIsImmune' CssClass='normallabel'></asp:Label>
                    </td>
                    <td class='tdRight'>
                    </td>
                </tr>
                <tr>
                    <td class='tdLeft'>
                        简介：
                    </td>
                    <td class='tdRight'>
                        <asp:Label runat='server' ID='lblDescription' CssClass='normallabel'></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
</div>
