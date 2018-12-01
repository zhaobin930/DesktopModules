<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CodeEdit.ascx.cs" Inherits="SEEKPET.Module.CodeEdit" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<!--******************************编辑信息页面代码********************************-->
<table class='moduletable' cellpadding='3' cellspacing='1' border='0' width="100%">
    <tr>
        <td class='tdLeft' width="30%">
            芯片编码：
        </td>
        <td class='tdRight'>
            <asp:TextBox ID='txtCode' MaxLength='50' runat='server' CssClass='normaltext' />
        </td>
    </tr>
    <tr>
        <td class='tdLeft'>
        </td>
        <td class='tdRight'>
            <asp:LinkButton runat='server' ID='cmdCommand' CssClass='normallinkbutton' OnClick="cmdCommand_Click">确定</asp:LinkButton>&nbsp;&nbsp;&nbsp;<asp:HyperLink
                runat='server' ID='hlkExit' CssClass='normallinkbutton'>取消</asp:HyperLink>
        </td>
    </tr>
</table>
