<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonalDetail.ascx.cs"
    Inherits="SEEKPET.Module.PersonalDetail" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<div class="mainpage">
    <div class="detailinfo">
        <h2>
            主人资料</h2>
    </div>
    <div>
        <table cellspacing="0" cellpadding="3" width="100%" class="moduletable infotable">
            <%--<tr>
			<td class='tdLeft'><asp:Label runat='server' ID='lryName' resourcekey='Name' CssClass='subHead'>Name</asp:Label></td>
			<td class='tdRight'><asp:Label runat='server' ID='lblName' CssClass='normal'></asp:Label></td>
		</tr>--%>
            <tr>
                <td class='tdRight'>
                    年龄：<asp:Label runat='server' ID='lblAge' CssClass='normallabel'></asp:Label>
                </td>
            </tr>
            <tr>
                <td class='tdRight'>
                    性别：<asp:Label runat='server' ID='lblSex' CssClass='normallabel'></asp:Label>
                </td>
            </tr>
            <tr>
                <td class='tdRight'>
                    职业：<asp:Label runat='server' ID='lblProfession' CssClass='normallabel'></asp:Label>
                </td>
            </tr>
            <tr>
                <td class='tdRight'>
                    地址：<asp:Label runat='server' ID='lblAddress' CssClass='normallabel'></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div class="personanimal">
        <img src='/Portals/0/images/useranimal.png' />
    </div>
</div>
