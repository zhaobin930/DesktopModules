function userlogin() {
    var url = "/DesktopModules/SEEKPET.Module/appservices/isuserlogin.ashx";
    jQuery.post(url, function (data) {
        //alert(data);
        if (data == "1") {
            location.href = '/tabid/69/Default.aspx?random=' + Math.random();
        }
        else {
            location.href = '/tabid/81/Default.aspx?random=' + Math.random();
        }
    });
}

function goback() {
    window.history.go(-1);
}


jQuery(function () {
    var width = jQuery(document).width();
    jQuery(".moduletitle").css("margin-right", width / 2 - 75);
    jQuery(".mainpage").css("width", width * 0.9);
    jQuery(".moduleback").click(function () {
        goback();
    });
});
