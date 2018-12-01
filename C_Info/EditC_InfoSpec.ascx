<%@ Register TagPrefix="c_info" TagName="AdminNavigator" Src="~/desktopmodules/c_info/AdminC_InfoNavigator.ascx"%>
<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.EditC_InfoSpec" Codebehind="EditC_InfoSpec.ascx.vb" %>
<c_info:adminnavigator id="AdminNavigator" runat="server"></c_info:adminnavigator><asp:panel id="pnlSpecList" Runat="server">
	<TABLE style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px solid"
		cellSpacing="0" cellPadding="3" width="100%" bgColor="#f1f1e3" border="0">
		<TR>
			<TD class="SubHead">
				<asp:Label id="lblTitle" Runat="server" resourcekey="SpecTitle"></asp:Label>:
				<asp:textbox id="txtName" runat="server" Width="272px"></asp:textbox>
				<asp:RequiredFieldValidator ID="reqVal" runat="server" ControlToValidate="txtName" CssClass="NormalRed" ErrorMessage="*" resourcekey="Required.ErrorMessage" Display="Dynamic" ValidationGroup="Add"></asp:RequiredFieldValidator>
			</TD>
			<TD>
				<asp:button id="btnAddSpec" runat="server" resourcekey="Add" ValidationGroup="Add"></asp:button></TD>
		</TR>
	</TABLE>
	<TABLE class="SubHead" cellSpacing="1" cellPadding="3" width="100%">
		<TR>
			<TD>
				<asp:datagrid id="dg" runat="server" Width="100%" PageSize="20" CellPadding="4" BorderStyle="None"
					AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyField="SpecID" CssClass="datagrid-main">
					<AlternatingItemStyle CssClass="datagrid-Alter"></AlternatingItemStyle>
					<ItemStyle CssClass="datagrid-Item"></ItemStyle>
					<HeaderStyle HorizontalAlign="Center" CssClass="datagrid-Header"></HeaderStyle>
					<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
					<Columns>
						<asp:TemplateColumn HeaderText="Name">
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "name")%>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "name")%>'>
								</asp:TextBox>
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Edit">
							<ItemTemplate>
								<asp:LinkButton ID="btnEdit" CommandName="edit" Runat="server">
									<asp:Image Runat="server" ID="imgEdit" ImageUrl="~/images/edit.gif"></asp:Image>
								</asp:LinkButton>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:LinkButton ID="btnUpdate" CommandName="update" Runat="server">
									<asp:Image Runat="server" ID="Image2" ImageUrl="~/images/save.gif"></asp:Image>
								</asp:LinkButton>
								<asp:LinkButton ID="btnCancel" CommandName="cancel" Runat="server">
									<asp:Image Runat="server" ID="Image3" ImageUrl="~/images/cancel.gif"></asp:Image>
								</asp:LinkButton>
							</EditItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="Delete">
							<ItemTemplate>
								<asp:LinkButton ID="Delete" CommandName="delete" Runat="server">
									<asp:Image Runat="server" ID="Image1" ImageUrl="~/images/delete.gif"></asp:Image>
								</asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="ViewSpecInfo">
							<ItemTemplate>
								<asp:LinkButton ID="Linkbutton1" CommandName="ViewInfo" Runat="server" resourcekey="ViewSpecInfo"></asp:LinkButton>
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
					<PagerStyle HorizontalAlign="Left" ForeColor="#003399" BackColor="#99CCCC" Mode="NumericPages"></PagerStyle>
				</asp:datagrid></TD>
		</TR>
		<TR>
			<TD>
				<P align="right">
					<asp:Label id="lblInfo" runat="server"></asp:Label></P>
			</TD>
		</TR>
	</TABLE>
</asp:panel>
<asp:panel id="pnlSpecInfoList" Runat="server" Visible="False" class="SubHead">
	<asp:datagrid id="dgInfo" Runat="server" Width="100%" PageSize="20" CellPadding="4" BorderStyle="None"
		AllowPaging="True" AllowCustomPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyField="InfoID" CssClass="datagrid-main">
		<ALTERNATINGITEMSTYLE CssClass="datagrid-Alter"></ALTERNATINGITEMSTYLE>
		<ITEMSTYLE CssClass="datagrid-Item"></ITEMSTYLE>
		<HEADERSTYLE CssClass="datagrid-Header" HorizontalAlign="Center"></HEADERSTYLE>
		<FOOTERSTYLE BackColor="#99CCCC" ForeColor="#003399"></FOOTERSTYLE>
		<COLUMNS>
			<ASP:TEMPLATECOLUMN HeaderText="Title">
				<ITEMTEMPLATE>
					<%# GetInfoURL(Container.DataItem)%>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
			<ASP:TEMPLATECOLUMN HeaderText="Delete">
				<ITEMTEMPLATE>
					<asp:LinkButton id="infodelete" Runat="server" CommandName="delete">
						<asp:Image Runat="server" ID="Image4" ImageUrl="~/images/delete.gif"></asp:Image>
					</asp:LinkButton>
				</ITEMTEMPLATE>
			</ASP:TEMPLATECOLUMN>
		</COLUMNS>
		<PAGERSTYLE HorizontalAlign="Left" BackColor="#99CCCC" ForeColor="#003399" Mode="NumericPages"></PAGERSTYLE>
	</asp:datagrid>
	<DIV align="right">
		<asp:Label id="lblPager" runat="server" CssClass="SubHead"></asp:Label></DIV>
	<DIV align="center">
		<asp:HyperLink id="lnkBack" Runat="server" resourcekey="Cancel"></asp:HyperLink></DIV>
</asp:panel>
