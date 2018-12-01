<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HelpEdit.ascx.cs" Inherits="SEEKPET.Module.HelpEdit" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<script src="/DesktopModules/SEEKPET.Module/js/AjaxUpload.js" type="text/javascript"></script>
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
                if (!(ext && /^(jpg|JPG|png|PNG|gif|GIF|jpeg|JPEG)$/.test(ext))) {
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
    
</script>
<div class="mainpage" style="padding-top: 50px;">
    <!--******************************编辑信息页面代码********************************-->
    <table class='moduletable' cellpadding='3' cellspacing='1' border='0' width="100%">
        <tr>
            <td class='tdLeft' width="20%">
                特征：
            </td>
            <td class='tdRight'>
                <asp:TextBox ID='txtFeature' MaxLength='200' runat='server' CssClass='normaltext' /><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtFeature"
                    ValidationGroup="edit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class='tdLeft'>
                地点：
            </td>
            <td class='tdRight'>
                <asp:TextBox ID='txtAddress' MaxLength='200' runat='server' CssClass='normaltext' /><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtAddress"
                    ValidationGroup="edit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <%--<tr style="display:none">
            <td class='tdLeft'>
                报酬：
            </td>
            <td class='tdRight'>
                <asp:TextBox ID='txtPay' MaxLength='50' runat='server' CssClass='normaltext' /><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtPay"
                    ValidationGroup="edit"></asp:RequiredFieldValidator>
            </td>
        </tr>--%>
        <tr>
            <td class='tdLeft'>
                说明：
            </td>
            <td class='tdRight'>
                <asp:TextBox ID='txtDescription' MaxLength='1000' runat='server' CssClass='normaltext' /><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtDescription"
                    ValidationGroup="edit"></asp:RequiredFieldValidator>
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
                    <input type="button" id="btnUploadImg" value="选择" class='normalbutton' style='width: 50px' />
                    <input type="button" id="btnDeleteImg" value="删除" class='normalbutton' style='width: 50px' />
                </div>
            </td>
            <tr>
                <td colspan="2" align="center">
                    <asp:LinkButton runat='server' ID='cmdCommand' CssClass='normallinkbutton2' Width="200px"
                        ValidationGroup="edit" OnClick="cmdCommand_Click">提交</asp:LinkButton>
                </td>
            </tr>
    </table>
</div>
