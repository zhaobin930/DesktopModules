<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UniteLogin.ascx.cs"
    Inherits="SEEKPET.Module.UniteLogin" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js"
    data-appid="101443949" data-redirecturi="http://www.seekpetm.xin/tabid/72/Default.aspx"
    charset="utf-8"></script>
<script type="text/javascript">
    jQuery(function () {
        var url = "/DesktopModules/SEEKPET.Module/appservices/isuserlogin.ashx";
        jQuery.post(url, function (data) {
            //alert(data);
            if (data != "1") {
                QC.Login.signOut();
            }
        });
        var url = 'https://graph.qq.com/oauth2.0/authorize?client_id=101443949&response_type=token&scope=all&redirect_uri=http://www.seekpetm.xin/tabid/72/Default.aspx';
        jQuery("#qqLoginBtn").attr("href", url);
        if (QC.Login.check()) {//如果已登录  
            //从页面收集OpenAPI必要的参数。get_user_info不需要输入参数，因此paras中没有参数
            var paras = {};
            //用JS SDK调用OpenAPI
            QC.api("get_user_info", paras)
            //指定接口访问成功的接收函数，s为成功返回Response对象
	 .success(function (s) {
	     //成功回调，通过s.data获取OpenAPI的返回数据
	     //	     jQuery(".bottomlogin").hide();
	     //	     jQuery(".bottomloginafer").show();
	     //	     jQuery(".bottomloginafter").append("<span class='spimage'><img src='" + s.data.figureurl_2 + "' class=''/></span>");
	     //	     jQuery(".bottomloginafter").append("<span class='spname'>" + s.data.nickname + "</span>");
	     //	     jQuery(".bottomloginafter").append("<span class='spsignout'><a href='javascript:userloginout()'>退出</a></span>");
	     QC.Login.getMe(function (openId, accessToken) {
	         var url = "/tabid/72/Default.aspx?o=" + openId + "&a=" + accessToken + "&n=" + s.data.nickname + "&random=" + Math.random();
	         //alert(url);
	         location.href = url;
	     })

	 })
            //指定接口访问失败的接收函数，f为失败返回Response对象
	.error(function (f) {
	    //失败回调
	    alert("获取用户信息失败！");
	})
            //指定接口完成请求后的接收函数，c为完成请求返回Response对象
	.complete(function (c) {
	    //完成请求回调
	    //alert("获取用户信息完成！");
	});
        }
        else {
            jQuery(".bottomlogin").show();
            jQuery(".bottomloginafer").hide().empty();
        }
    });

    function userloginout() {
        QC.Login.signOut();
        var url = "/DesktopModules/SEEKPET.Module/appservices/userloginout.ashx";
        //alert(openId+','+accessToken+','+s.data.nickname);
        jQuery.post(url, function (data) {
            if (data == "1") {
                location.href = location.href;
            }
        });
    }
</script>
<script src="http://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js"></script>
<script>
    var obj = new WxLogin({

        id: "vx_login_container",

        appid: "wx2760ab1db0635822",

        scope: "snsapi_login",

        redirect_uri: "http://www.seekpetm.xin/tabid/84/Default.aspx",

        state: "sdk_demo",

        style: "",

        href: ""

    });
</script>
<div class="mainpage">
    <div class='toplogo'>
        <img src="/Portals/0/images/logonew.jpg" style="width: 100px">
        <p>
            点击登录觅宠SEEKPET</p>
    </div>
    <div class='bottomlogin'>
        <a id="qqLoginBtn">
            <img class="qqlogin" src='/Portals/0/images/qqlogin.png' width="60px" height="75px" /></a><a
                id="vxLoginBtn"><asp:LinkButton runat="server" ID="linVx" 
            onclick="linVx_Click"><img class='vxlogin' src='/Portals/0/images/vxlogin.png' width="60px"
                    height="75px" /></asp:LinkButton>
            </a>
    </div>
    <div class='bottomloginafter'>
    </div>
    <div id="vx_login_container"></div>
</div>
