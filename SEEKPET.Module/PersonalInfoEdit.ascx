<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonalInfoEdit.ascx.cs"
    Inherits="SEEKPET.Module.PersonalInfoEdit" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<script>
    
</script>
<div class='mainpage'>
    <h2 class="infotitle">
        主人资料</h2>
    <table style="width: 100%" class="moduletable">
        <tr>
            <td class='tdleft' width="20%">
                年龄：
            </td>
            <td class='tdright'>
                <asp:TextBox runat="server" ID="txtAge" CssClass="normaltext"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="txtAge" ValidationGroup="edit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class='tdleft'>
                性别：
            </td>
            <td class='tdright'>
                <asp:DropDownList runat="server" ID="ddlSex" CssClass="normaldrop">
                    <asp:ListItem>男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class='tdleft'>
                职业：
            </td>
            <td class='tdright'>
                <asp:TextBox runat="server" ID="txtProfession" CssClass="normaltext"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtProfession"
                    ValidationGroup="edit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class='tdleft'>
                地址：
            </td>
            <td class='tdright'>
                <asp:TextBox runat="server" ID="txtAddress" CssClass="normaltext"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtAddress"
                    ValidationGroup="edit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <%--<tr>
            <td class='tdleft'>
            </td>
            <td class='tdright'>
                <span style='color: #188e8e;'>
                    <asp:CheckBox runat="server" ID="chkHasCode" CssClass="chkHasCode" />已拥有芯片</span><span><asp:TextBox
                        runat="server" ID="txtCode" CssClass="normaltext" Width="100px"></asp:TextBox><asp:CustomValidator
                            ID="CustomValidator1" runat="server" ErrorMessage="*" ClientValidationFunction="CheckCode"
                            ControlToValidate="txtCode" ValidationGroup="edit" Display="Dynamic" ValidateEmptyText="true"></asp:CustomValidator></span>
            </td>
        </tr>--%>
        <tr>
            <td colspan="2" align="center" style="padding-top: 30px;">
                <asp:Button runat="server" ID="btnSubmit" Text="提交" ValidationGroup="edit" CssClass="normalbutton"
                    OnClick="btnSubmit_Click" />
            </td>
        </tr>
    </table>
    <div class="peronbottom">
        <h2>
            <img src='/Portals/0/images/uparrow.png' />
        </h2>
        <p>
            <a href='/tabid/64/Default.aspx'>熊孩子登记点这里</a></p>
    </div>
</div>
