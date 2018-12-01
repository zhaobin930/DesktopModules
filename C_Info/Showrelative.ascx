<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.Showrelative" Codebehind="Showrelative.ascx.vb" %>
<asp:DataList id="LstC_InfoRelative" runat="server" ItemStyle-VerticalAlign="Top" CellPadding="0"
	CellSpacing="0" Width="100%" CssClass="tblRelative">
	<ItemTemplate>
		<%# GetItem(Container.DataItem)%>
	</ItemTemplate>
</asp:DataList>
