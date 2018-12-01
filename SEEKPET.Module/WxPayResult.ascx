<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WxPayResult.ascx.cs"
    Inherits="SEEKPET.Module.WxPayResult" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<div class="mainpage">
    <div class="codecontent">
        <p class="success">
            <asp:Label runat="server" ID="lblmessage"></asp:Label></p>
        <asp:Panel runat="server" ID="pa1">
            <p>
                <asp:Image runat="server" ID="imgCode" Width="300px" /></p>
            <p>
                长按保存二维码或者屏幕截图</p>
        </asp:Panel>
    </div>
</div>
