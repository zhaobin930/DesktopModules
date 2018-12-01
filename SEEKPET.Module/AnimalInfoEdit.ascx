<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AnimalInfoEdit.ascx.cs"
    Inherits="SEEKPET.Module.AnimalInfoEdit" %>
<script src="/DesktopModules/SEEKPET.Module/js/AjaxUpload.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<script type="text/javascript">
    window.onload = function () {
        init();  //初始化  
    }
    //初始化
    function init() {

        //初始化图片上传
        var btnImg = document.getElementById("btnUploadImg");
        var img = document.getElementById("<%=imgShow.ClientID %>");
        var hidImgName = document.getElementById("<%=hidImgName.ClientID %>");
        document.getElementById("btnDeleteImg").onclick = function () { DelImg(img, hidImgName); };
        g_AjxUploadImg(btnImg, img, hidImgName);
    }
    var g_AjxTempDir = "/Portals/SEEKPETInfo/";
    //图片上传
    function g_AjxUploadImg(btn, img, hidPut) {
        var button = btn, interval;
        new AjaxUpload(button, {
            action: '/DesktopModules/SEEKPET.Module/appservices/UploadHandler.ashx?fileType=img',
            data: {},
            name: 'myfile',
            onSubmit: function (file, ext) {
                if (!(ext && /^(jpg|JPG|png|PNG|gif|GIF)$/.test(ext))) {
                    alert("您上传的图片格式不对，请重新选择！");
                    return false;
                }
            },
            onComplete: function (file, response) {
                flagValue = response;
                if (flagValue == "1") {
                    alert("您上传的图片格式不对，请重新选择！");
                }
                else if (flagValue == "2") {
                    alert("您上传的图片大于1M，请重新选择！");
                }
                else if (flagValue == "3") {
                    alert("图片上传失败！");
                }
                else {
                    hidPut.value = response;
                    img.src = g_AjxTempDir + response;
                }
            }
        });
    }
    //删除图片
    function DelImg(img, hidPut) {
        hidPut.value = "";
        img.src = "/images/thumbnail.jpg";
    }
    
    function CheckCode(obj, args) {
        if (jQuery('#<%=chkHasCode.ClientID %>').attr('checked')) {
            if (args.Value != "") {
                args.IsValid = true;
            }
            else {
                args.IsValid = false;
            }
        }
        else {
            args.IsValid = true;
        }
    }
</script>

<div class='mainpage'>
    <h2 class="infotitle">
        宠物资料</h2>
    <table style="width: 100%" class="moduletable">
        <tr>
            <td class='tdleft' width="20%">
                名称：
            </td>
            <td class='tdright'>
                <asp:TextBox runat="server" ID="txtName" CssClass="normaltext"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtName"
                    ValidationGroup="edit"></asp:RequiredFieldValidator>
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
                种类：
            </td>
            <td class='tdright'>
                <asp:TextBox runat="server" ID="txtKind" CssClass="normaltext"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtKind"
                    ValidationGroup="edit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class='tdleft'>
                年龄：
            </td>
            <td class='tdright'>
                <asp:TextBox runat="server" ID="txtAge" CssClass="normaltext"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtAge"
                    ValidationGroup="edit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class='tdleft'>
                毛色：
            </td>
            <td class='tdright'>
                <asp:TextBox runat="server" ID="txtColor" CssClass="normaltext"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtColor"
                    ValidationGroup="edit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class='tdleft'>
                简介：
            </td>
            <td class='tdright'>
                <asp:TextBox runat="server" ID="txtDescription" CssClass="normaltext"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtDescription"
                    ValidationGroup="edit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class='tdleft'>
                是否免疫：
            </td>
            <td class='tdright'>
                <asp:DropDownList runat="server" ID="ddlIsImmune" CssClass="normaldrop">
                    <asp:ListItem>是</asp:ListItem>
                    <asp:ListItem>否</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class='tdleft'>
                是否绝育：
            </td>
            <td class='tdright'>
                <asp:DropDownList runat="server" ID="ddlIsJY" CssClass="normaldrop">
                    <asp:ListItem>是</asp:ListItem>
                    <asp:ListItem>否</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class='tdleft'>
                照片
            </td>
            <td class='tdright'>
                <div class="uploadImg">
                    <img id="imgShow" src="/images/thumbnail.jpg" alt="图片" runat="server" />
                    <input type="hidden" id="hidImgName" runat="server" />
                    <input type="button" id="btnUploadImg" value="选择" class='normalbutton' style='width:50px' />
                    <input type="button" id="btnDeleteImg" value="删除" class='normalbutton'  style='width:50px' />
                </div>
            </td>
        </tr>
        <tr>
            <td class='tdleft'>
            </td>
            <td class='tdright'>
                <span style='color: #188e8e;'>
                    <asp:CheckBox runat="server" ID="chkHasCode" CssClass="chkHasCode" />已拥有芯片</span><span><asp:TextBox
                        runat="server" ID="txtCode" CssClass="normaltext" Width="100px"></asp:TextBox><asp:CustomValidator
                            ID="CustomValidator1" runat="server" ErrorMessage="*" ClientValidationFunction="CheckCode"
                            ControlToValidate="txtCode" ValidationGroup="edit" Display="Dynamic" ValidateEmptyText="true"></asp:CustomValidator></span>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button runat="server" ID="btnSubmit" ValidationGroup="edit" Text="提交" CssClass="normalbutton"
                    OnClick="btnSubmit_Click" />
            </td>
        </tr>
    </table>
    <div class="peronbottom">
        <h2>
            <img src='/Portals/0/images/uparrow.png' />
        </h2>
        <p>
            <a href='/tabid/63/Default.aspx'>主人登记点这里</a></p>
    </div>
</div>
