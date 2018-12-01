<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HospitalEdit.ascx.cs"
    Inherits="SEEKPET.Module.HospitalEdit" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<script src="/DesktopModules/SEEKPET.Module/js/AjaxUpload.js" type="text/javascript"></script>
<script type="text/javascript" src="/DesktopModules/SEEKPET.Module/js/jquery.min.js"></script>
<script>
    jQuery.noConflict();
</script>
<script src="/DesktopModules/SEEKPET.Module/js/jquery.citys.js" type="text/javascript"></script>
<script type="text/javascript">
    jQuery(function () {
        jQuery('#demo').citys({ code: 110000 });
    });
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

    function getvalue() {
        var city = "";
        var province = jQuery("#province").find("option:selected").text();
        if (province == "北京市" || province == "天津市" || province == "上海市" || province == "重庆市") {
            city = province;
        }
        else {
            city = jQuery("#city").find("option:selected").text();
        }
        jQuery('#<%=hidcity.ClientID %>').val(city);
        console.log(city);
        return true;
    }
    function setvalue(province) {
        if (province == "北京市" || province == "天津市" || province == "上海市" || province == "重庆市") {
            jQuery("#province").val(province);
        }
        else {
            jQuery('#demo').citys({ valueType: 'name', city: province });
        }

    }
</script>
<style type="text/css">
    /*上传文件*/ .uploadFile {
        margin-bottom: 10px;
    }
    /*上传图片*/ .uploadImg {
    }

        .uploadImg img {
            width: 102px;
            height: 64px;
            border: 1px solid #CCCCCC;
            display: block;
        }

    .typeclass {
        font-size: larger;
        width: 100%;
        text-align: center;
    }
</style>
<!--******************************编辑信息页面代码********************************-->
<table class='moduletable' cellpadding='3' cellspacing='1' border='0' style="width: 100%">
    <tr>
        <td class='tdLeft' width="20%">医院名称：
        </td>
        <td class='tdRight'>
            <asp:TextBox ID='txtHospitalName' MaxLength='50' runat='server' CssClass='normaltext' /><asp:RequiredFieldValidator
                ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtHospitalName"
                ValidationGroup="edit"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class='tdLeft'>医院地址：
        </td>
        <td class='tdRight'>
            <asp:TextBox ID='txtAddress' MaxLength='50' runat='server' CssClass='normaltext' /><asp:RequiredFieldValidator
                ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtAddress"
                ValidationGroup="edit"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class='tdLeft'>医院城市：
        </td>
        <td class='tdRight'>
            <div id="demo" class="citys">
                <p>
                    <asp:HiddenField runat="server" ID="hidcity" />
                    <select name="province" id="province"></select>
                    <select name="city" id="city"></select>
                    <%--<select name="area"></select>--%>
                </p>
            </div>
        </td>
    </tr>
    <%--<tr>
		<td class='tdLeft'><asp:Label runat='server' ID='lryCoorX' resourcekey='CoorX' CssClass='subHead'>CoorX</asp:Label></td>
		<td class='tdRight'><asp:TextBox ID='txtCoorX' MaxLength='50' runat='server' CssClass='normal' /></td>
	</tr>

	<tr>
		<td class='tdLeft'><asp:Label runat='server' ID='lryCoorY' resourcekey='CoorY' CssClass='subHead'>CoorY</asp:Label></td>
		<td class='tdRight'><asp:TextBox ID='txtCoorY' MaxLength='50' runat='server' CssClass='normal' /></td>
	</tr>--%>
    <tr>
        <td class='tdLeft'>照片：
        </td>
        <td class='tdRight'>
            <div class="uploadImg">
                <img id="imgShow" src="/images/thumbnail.jpg" alt="图片" runat="server" />
                <input type="hidden" id="hidImgName" runat="server" />
                <input type="button" id="btnUploadImg" value="上传" />
                <input type="button" id="btnDeleteImg" value="删除" />
            </div>
        </td>
    </tr>
    <tr>
        <td class='tdLeft'>描述：
        </td>
        <td class='tdRight'>
            <asp:TextBox ID='txtDescription' MaxLength='500' TextMode="MultiLine" Height="100px"
                runat='server' CssClass='normaltext' /><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtDescription"
                    ValidationGroup="edit"></asp:RequiredFieldValidator>
        </td>
    </tr>
</table>
<table cellpadding='0' cellspacing='3' border='0' align='center'>
    <tr>
        <td>
            <asp:LinkButton runat='server' ID='cmdCommand' CssClass='normallinkbutton' OnClick="cmdCommand_Click" OnClientClick="return getvalue()" ValidationGroup="edit">确定</asp:LinkButton>&nbsp;&nbsp;&nbsp;<asp:HyperLink
                runat='server' ID='hlkExit' CssClass='normallinkbutton'>取消</asp:HyperLink>
        </td>
    </tr>
</table>
