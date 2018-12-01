<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.ListC_Info" Codebehind="ListC_Info.ascx.vb" %>
<%@ Register TagPrefix="webdiyer" Namespace="EasySite.Modules.C_Info.CMSAspNetPager" Assembly="CMSAspNetPager" %>
<asp:Literal ID="litFlowContent" runat="server" Visible="false"></asp:Literal><asp:DataList id="LstC_Info" runat="server" ItemStyle-VerticalAlign="Top" CellPadding="0" CellSpacing="0"
	Width="100%" RepeatDirection="Horizontal">
	<ItemStyle VerticalAlign="Top"></ItemStyle>
	<ItemTemplate>
		<%# GetItem(Container.DataItem)%>
	</ItemTemplate>
</asp:DataList><webdiyer:AspNetPager id="AspNetPager" runat="server" CssClass="Normal" CustomInfoClass="Normal" InputBoxClass="NormalTextBox" CurrentPageClass="NormalRed"
    FirstPageText='<%# Localization.GetString("First") %>' LastPageText='<%# Localization.GetString("Last") %>'
    NextPageText='<%# Localization.GetString("Next") %>' NumericButtonCount="10" ShowNavigationToolTip="false"
    PageSize="20" PrevPageText='<%# Localization.GetString("Previous") %>' ShowCustomInfoSection="Right" 
    ShowInputBox="Never" SubmitButtonClass="CommandButton" SubmitButtonText='<%# Localization.GetString("Go",Me.LocalResourceFile)%>'
    UrlPaging="true" Visible="false" Width="100%"></webdiyer:AspNetPager>