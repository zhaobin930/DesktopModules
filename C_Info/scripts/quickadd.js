function quickAdd(vQuickAddUrl) {
    $ess.Include($ess.baseEssScriptUrl + "jquery/jquery.min.js");
    $ess.Include($ess.baseEssScriptUrl + "jquery/ui/ui.core.js");
    $ess.Include($ess.baseEssScriptUrl + "jquery/ui/ui.draggable.js");
    $ess.Include($ess.baseEssScriptUrl + "jquery/ui/ui.resizable.js");
    $ess.Include($ess.baseEssScriptUrl + "jquery/ui/ui.dialog.js");
    $ess.Include($ess.baseEssScriptUrl + "jquery/external/bgiframe/jquery.bgiframe.js");
    jQuery.noConflict();
    if (document.getElementById("ifrQuickAdd") == null) {
        var oDialogHolder = document.createElement("span");
        oDialogHolder.innerHTML = '<div id=dialog title=文章管理><iframe id=ifrQuickAdd frameborder="0" scrolling="no" height="100%" width="100%"></iframe>' +
        '<link rel=stylesheet type=text/css href="' + $ess.hostUrl + 'Resources/Shared/scripts/jquery/themes/ui-lightness/ui.core.css">' +
        '<link rel=stylesheet type=text/css href="' + $ess.hostUrl + 'Resources/Shared/scripts/jquery/themes/ui-lightness/ui.dialog.css">' +
        '<link rel=stylesheet type=text/css href="' + $ess.hostUrl + 'Resources/Shared/scripts/jquery/themes/ui-lightness/ui.resizable.css">' +
        '<link rel=stylesheet type=text/css href="' + $ess.hostUrl + 'Resources/Shared/scripts/jquery/themes/ui-lightness/ui.theme.css">' +
        '</div>';
        document.forms[0].appendChild(oDialogHolder);        
        jQuery("#dialog").dialog({
            bgiframe: true,
            height: 440,
            width: 420,
            modal: true,
            resizable: true,
            autoOpen: false
        });
        //jQuery("div[role=dialog]").appendTo("form#Form");       
    }
    document.getElementById("ifrQuickAdd").src = vQuickAddUrl + "?ctlmode=umanage&returnurl=.";
    jQuery("#dialog").dialog('open'); 
    return false;
}
