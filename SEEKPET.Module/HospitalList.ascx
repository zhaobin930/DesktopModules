<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HospitalList.ascx.cs"
    Inherits="SEEKPET.Module.HospitalList" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<script>
    jQuery(function () {
        //        jQuery("#btnVxPay").click(function () {
        //            location.href = "/DesktopModules/SEEKPET.Module/VxPay.aspx";
        //        });

        jQuery(".nowpay").click(function () {
            jQuery(".popwindow").show();
            jQuery(".payafter").show();

        });
        jQuery(".nofinishpay a").click(function () {
            jQuery(".popwindow").hide();
            jQuery(".payafter").hide();
        });
    });

    function getvalue() {
        var sel = jQuery("input[name='radhospital']").filter(':checked').attr("itemvalue");
        if (sel == null) {
            alert('请先选择医院');
            return false;
        }
        else {
            jQuery('#<%=hidhospital.ClientID %>').val(sel);
            return true;
        }
    }
</script>
<div class="mainpage">
    <asp:Panel runat="server" ID="pa1">
        <div style="padding-top: 40px;">
            <asp:Repeater runat="server" ID="reList">
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="hospitalitem">
                        <div class="itemleft">
                            <input type="radio" name="radhospital" itemvalue='<%#Eval("ID") %>' /><img src='<%#"/Portals/SEEKPETInfo/"+Eval("Picture") %>'
                                style="height: 40px" />
                        </div>
                        <div class="itemright">
                            <h2>
                                <%#Eval("HospitalName") %></h2>
                            <p>
                                <%#Eval("Address") %></p>
                        </div>
                        <div style="clear: both">
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                </FooterTemplate>
            </asp:Repeater>
            <div style="clear: both">
                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" Width="100%" NumericButtonCount="10"
                    CustomInfoHTML="<font color='red'><b>%currentPageIndex%</b></font>/%PageCount%&nbsp;总: %RecordCount%"
                    pagesize="15" UrlPaging="true" NumericButtonTextFormatString="[{0}]" ShowCustomInfoSection="left"
                    FirstPageText="首页" LastPageText="末页" NextPageText="下页" PrevPageText="上页" Font-Names="Arial"
                    AlwaysShow="true" ShowInputBox="Always" SubmitButtonText="跳转" SubmitButtonStyle="botton"
                    OnPageChanged="AspNetPager1_PageChanged">
                </webdiyer:AspNetPager></div>
            <div class="vxpay">
                <%--<input type="button" value="微信支付" class="normalbutton" id="btnVxPay" />--%>
                <asp:HiddenField runat="server" ID="hidhospital" />
                <asp:Button runat="server" ID="btnVxPay" Text="微信支付" CssClass="normalbutton" OnClientClick='return getvalue()'
                    OnClick="btnVxPay_Click" />
            </div>
            <div class="paytip">
                <img src="/Portals/0/images/paytip.png" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="pa2" Visible="false">
        <div style="padding-top:30px;">
            <%--<b>商品一：价格为<asp:Label runat="server" ID="lblPrice1" Style="color: #f00; font-size: 50px">1分</asp:Label>钱</b><br />
            <b>商品二：价格为<asp:Label runat="server" ID="lblPrice2" Style="color: #f00; font-size: 50px">1分</asp:Label>钱</b>--%>
            <asp:Repeater runat="server" ID="rePayList">
                <ItemTemplate>
                    <b>
                        <%#Eval("Text") %>：价格为<asp:Label runat="server" ID="lblPrice1" Style="color: #f00;
                            font-size: 30px" Text='<%#Eval("Value") %>'></asp:Label>元</b><br />
                </ItemTemplate>
            </asp:Repeater>
            <br />
            总计：<asp:Label runat="server" ID="lblSumPrice" Style="color: #f00; font-size: 50px"></asp:Label>元</b>
        </div>
        <div align="center" style="padding-top: 30px">
            <asp:HyperLink runat="server" ID="btnsubmit" CssClass="normallinkbutton nowpay">立即支付</asp:HyperLink>
            <asp:Label runat="server" ID="lblresult" Visible="false"></asp:Label>
        </div>
        <div class="popwindow">
        </div>
        <div class="payafter">
            <h2>
                请确认微信支付是否完成</h2>
            <p class="finishpay">
                <asp:HyperLink runat="server" ID="hyFinishPay">已完成支付</asp:HyperLink></p>
            <p class="nofinishpay">
                <a>支付遇到问题，重新支付</a></p>
        </div>
    </asp:Panel>
</div>
