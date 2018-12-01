<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MobileDefault.ascx.vb"
    Inherits="EasySite.Modules.C_Info.MobileDefault" %>
<%@ Register TagPrefix="webdiyer" Namespace="EasySite.Modules.C_Info.CMSAspNetPager"
    Assembly="CMSAspNetPager" %>
<div style="text-align: left;margin-left:10px;">
    <asp:Label runat="server" ID="lblMessage"></asp:Label>
    <asp:Repeater runat="server" ID="grdList">
        <HeaderTemplate>
            <ul style="margin-left:15px">
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <asp:HyperLink runat="server" Target="_blank" NavigateUrl='<%# EditUrl("InfoID",Container.DataItem("InfoID").ToString(),"InfoDetail") %>'
                    Text='<%#Eval("Title") %>'></asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl='<%# EditUrl("InfoID",Container.DataItem("InfoID").ToString(),"MobileEdit") %>'
                    Text='<%# "[" + Localization.GetString("Edit") + "]" %>' Visible='<%# IsEditable %>'></asp:HyperLink>
                <asp:LinkButton runat="server" ID="cmdDelete" CommandArgument='<%#Eval("InfoID") %>'
                    Text='<%#"[" + Localization.GetString("cmdDelete")+ "]"%>' OnClientClick='<%# "return confirm("""+ Localization.GetString("DeleteItem")+""")" %>'
                    Visible='<%# IsEditable %>' OnCommand="cmdDelete_Click"></asp:LinkButton>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul></FooterTemplate>
    </asp:Repeater>
        <webdiyer:AspNetPager id="AspNetPager" runat="server" CssClass="Normal" CustomInfoClass="Normal"
            InputBoxClass="NormalTextBox" CurrentPageClass="NormalRed" FirstPageText='<%# Localization.GetString("First") %>'
            LastPageText='<%# Localization.GetString("Last") %>' NextPageText='<%# Localization.GetString("Next") %>'
            NumericButtonCount="5" ShowNavigationToolTip="false" PageSize="5" PrevPageText='<%# Localization.GetString("Previous") %>'
            ShowCustomInfoSection="Right" ShowInputBox="Never" SubmitButtonClass="CommandButton"
            SubmitButtonText='<%# Localization.GetString("cmdGo")%>' UrlPaging="true" Visible="true"
            UrlPageIndexName="pidx" width="350">
        </webdiyer:AspNetPager>
    <p style="margin-left: 20px">
        <asp:HyperLink runat="server" NavigateUrl='<%# EditUrl("MobileEdit") %>' Text='<%#"["+Localization.GetString("Add")+"]"%>'
            Visible='<%# IsEditable andalso CanManage %>'></asp:HyperLink>
        <asp:LinkButton runat="server" ID="cmdDeploy" Text='<%#"["+Localization.GetString("cmdDeploy",me.LocalResourceFile)+"]"%>'
            Visible='<%# IsEditable andalso CanManage AndAlso EasySite.Modules.C_Info.StaticDeployController.AllowStaticDeploy() %>'></asp:LinkButton>
        <asp:LinkButton runat="server" ID="cmdClearCache" Text='<%#"["+Localization.GetString("cmdClearCache",me.LocalResourceFile)+"]"%>'
            Visible='<%# IsEditable andalso CanManage AndAlso EasySite.Modules.C_Info.StaticDeployController.AllowCacheOutput() %>'></asp:LinkButton>
    </p>
</div>
