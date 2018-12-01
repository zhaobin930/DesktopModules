<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.ShowPager" Codebehind="ShowPager.ascx.vb" %>
<asp:DataList id="lstPager" runat="server" RepeatColumns="0" RepeatDirection="Horizontal" CssClass="CArticlePager" EnableViewState="false">
	<ItemTemplate>
		<%# GetPagerUrl(DataBinder.Eval(Container.DataItem, "Title"),DataBinder.Eval(Container.DataItem, "InfoID"),DataBinder.Eval(Container.DataItem, "SetOrder"))%>
	</ItemTemplate>
</asp:DataList>
