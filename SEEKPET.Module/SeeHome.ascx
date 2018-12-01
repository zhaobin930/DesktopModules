<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SeeHome.ascx.cs" Inherits="SEEKPET.Module.SeeHome" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<script>
    jQuery(function () {
        jQuery(".homepetimg img").each(function () {
            console.log(jQuery(this).width());
            if (jQuery(this).width() > jQuery(this).height()) {
                jQuery(this).width("47px");
                jQuery(this).height("auto");
            }
            else {
                jQuery(this).height("47px");
                jQuery(this).width("auto");
            }
        });
    });

</script>
<div class="mainpage">
    <asp:Repeater runat="server" ID="reList">
        <HeaderTemplate>
            <div>
                <div style="text-align: center; color: #0a97a1"></div>
                <ul class='homeul'>
        </HeaderTemplate>
        <ItemTemplate>
            <li class='homeli'>
                <div class="homepetimg">
                    <img src='<%#"/Portals/SEEKPETInfo/"+Eval("Par1").ToString() %>' width="47px" />
                </div>
                <div class="homepetitem">
                    <p class='p1'>
                        <%#Eval("Kind") %>
                    </p>
                    <p class='p2'>
                        特征:<%#Eval("Feature") %><br>走失地点:<%#Eval("LossPlace") %><br>有偿
                    </p>
                </div>
                <div style='padding-top: 12px; float: left'>
                    <img src='/Portals/0/images/animaltip.png' />
                </div>
                <div style="clear: both">
                </div>
            </li>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <li class='homeli'>
                <div class="homepetimg">
                    <img src='<%#"/Portals/SEEKPETInfo/"+Eval("Par1").ToString() %>' width="47px" />
                </div>
                <div class="homepetitem">
                    <p class='p1'>
                        <%#Eval("Kind") %>
                    </p>
                    <p class='p2'>
                        特征:<%#Eval("Feature") %><br>走失地点:<%#Eval("LossPlace") %><br>有偿
                    </p>
                </div>
                <div style='padding-top: 12px; float: left'>
                    <img src='/Portals/0/images/animaltip.png' />
                </div>
                <div style="clear: both">
                </div>
            </li>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </ul></div>
        </FooterTemplate>
    </asp:Repeater>
    <div style="clear: both; padding-bottom: 15px; color: a1a1a1">
        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" Width="100%" NumericButtonCount="10"
            CustomInfoHTML="<font color='red'><b>%currentPageIndex%</b></font>/%PageCount%&nbsp;总: %RecordCount%"
            PageSize="15" UrlPaging="true" NumericButtonTextFormatString="[{0}]" ShowCustomInfoSection="left"
            FirstPageText="首页" LastPageText="末页" NextPageText="下页" PrevPageText="上页" Font-Names="Arial"
            AlwaysShow="true" ShowInputBox="Always" SubmitButtonText="跳转" SubmitButtonStyle="botton"
            OnPageChanged="AspNetPager1_PageChanged">
        </webdiyer:AspNetPager>
    </div>
</div>
