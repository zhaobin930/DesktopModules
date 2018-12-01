<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Main.ascx.cs" Inherits="EasySite.Modules.MobileAdmin.Main" %>
<table width="100%" cellpadding="3" cellspacing="1" id="tblMain">
    <tr valign="top">
        <td width="200" class="SubHead" style="border-right:dotted 1px black">
                        <asp:Label ID="plSelectTab" resourcekey="plSelectTab" runat="server" EnableViewState="false" /><br />
                        <asp:DropDownList runat="server" ID="drpTabs" DataTextField="TabName" 
                            DataValueField="TabID" AutoPostBack="True" 
                            onselectedindexchanged="drpTabs_SelectedIndexChanged"></asp:DropDownList><br />
                        <asp:Label ID="plSelectModule" resourcekey="plSelectModule" runat="server" EnableViewState="false" /><br />
                        <asp:DropDownList runat="server" ID="drpModules" EnableViewState="false" onchange="javascript:moduleSelect()" DataTextField="ModuleTitle" DataValueField="ModuleID" AppendDataBoundItems="true">
                        <asp:ListItem resourcekey="None_Specified" Value="-1"></asp:ListItem>
                        </asp:DropDownList>

        </td>
        <td width="*" height="350">
            <div id="cLoadingIndicator" style="z-index: 99999; left: auto; display: none; width: 100%;
                position: absolute; top: auto; height: 400; text-align: center; padding-top: 120">
                <div>
                    <img id="Img1" runat="server" alt="Loading......" src="~/images/spinner.gif" />
                    <span class="Normal">Loading......</span></div>
            </div>
            <div id="divIframe" style="width: 100%">
                <iframe id="iframeMain" marginwidth="4" marginheight="0" frameborder="0" scrolling="no" height="350px" width="100%">
                </iframe>
            </div>
        </td>
    </tr>
</table>

<script type="text/javascript">
    //<![CDATA[
    var rootPath = "<%=EasySite.Common.Globals.ApplicationPath %>/Default.aspx";
    function moduleSelect(){
        var nTabId = document.getElementById('<%=drpTabs.ClientID %>').value;
        var nModuleId = document.getElementById('<%=drpModules.ClientID %>').value;
        loadDiv();
        document.getElementById("iframeMain").src = (rootPath + "?tabid=" + nTabId + "&mid=" + nModuleId + "&ctl=mobile&ctlMode=Umanage&returnurl=.");
        window.setTimeout(closeDiv, 1000);
    }
    
    document.getElementById("iframeMain").onload = closeDiv;
    
    function loadDiv() {
        document.getElementById('cLoadingIndicator').style.display="";
        document.getElementById('divIframe').style.height = '1';
        document.getElementById('divIframe').style.overflow = 'hidden';  
    }
    function closeDiv()
    {
        document.getElementById('cLoadingIndicator').style.display="none";
        document.getElementById('divIframe').style.overflow = 'visible';    
    }
    //]]>
</script>
