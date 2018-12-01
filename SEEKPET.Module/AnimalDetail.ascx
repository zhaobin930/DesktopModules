<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AnimalDetail.ascx.cs"
    Inherits="SEEKPET.Module.AnimalDetail" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<div class="mainpage">
    <div class="detailpicinfo">
        <asp:Image runat="server" ID="imPicture" Width="100px" />
    </div>
    <div>
        <table cellspacing="0" cellpadding="3" width="100%" class="moduletable infotable">
            <tr>
                <td class='tdRight'>
                    编号：<asp:Label runat='server' ID='lblNo' CssClass='normallabel'></asp:Label>
                </td>
            </tr>
            <tr>
                <td class='tdRight'>
                    名称：<asp:Label runat='server' ID='lblName' CssClass='normallabel'></asp:Label>
                </td>
            </tr>
            <tr>
                <td class='tdRight'>
                    性别：<asp:Label runat='server' ID='lblSex' CssClass='normallabel'></asp:Label>
                </td>
            </tr>
            <tr>
                <td class='tdRight'>
                    种类：<asp:Label runat='server' ID='lblKind' CssClass='normallabel'></asp:Label>
                </td>
            </tr>
            <tr>
                <td class='tdRight'>
                    年龄：<asp:Label runat='server' ID='lblAge' CssClass='normallabel'></asp:Label>
                </td>
            </tr>
            <tr>
                <td class='tdRight'>
                    毛色：<asp:Label runat='server' ID='lblColor' CssClass='normallabel'></asp:Label>
                </td>
            </tr>
            <tr>
                <td class='tdRight'>
                    简介：<asp:Label runat='server' ID='lblDescription' CssClass='normallabel'></asp:Label>
                </td>
            </tr>
            <tr>
                <td class='tdRight'>
                    <asp:Label runat='server' ID='lblIsImmune' CssClass='normallabel'></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</div>
