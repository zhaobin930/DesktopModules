<%@ Page Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.ListC_InfoKeyWords" Codebehind="ListC_InfoKeyWords.aspx.vb" %>
<html>
<head>
<style type="text/css">TD { FONT-SIZE: 12px; COLOR: #666666 }
	P { FONT-SIZE: 12px; COLOR: #666666 }
	LI { FONT-SIZE: 12px; COLOR: #666666 }
	SELECT { FONT-SIZE: 12px; COLOR: #666666 }
	INPUT { FONT-SIZE: 12px; COLOR: #666666 }
	A:link { COLOR: #666666; TEXT-DECORATION: none }
	A:visited { COLOR: #666666; TEXT-DECORATION: none }
	A:active { COLOR: #666666; TEXT-DECORATION: underline }
	A:hover { COLOR: #666666; TEXT-DECORATION: underline }
	</style>
<script language="javascript">
//var dgId='<%= dg.ClientID%>';
	function getdgSelectItems()
	{
		 var strID='';
		 for(var i=0;i<document.forms[0].elements.length;i++)
		 {
			if(document.forms[0].elements[i].type=="checkbox")
			{
				if(document.forms[0].elements[i].name.indexOf("chids")!=-1);
				{
					if(document.forms[0].elements[i].checked)
					{
						strID +=document.forms[0].elements[i].value + ",";
					}
				}
			}
		 }
		 return strID;
	}
	function selected()
	{
		//var id=windown.opener.getKeyWordClientID();
		window.opener.document.getElementById(window.opener.getKeyWordClientID()).value+=getdgSelectItems();
		window.opener=null;
		window.close();
	}
</script>
</head>
<body>
<form id="form1" runat="server">
	<table cellSpacing="1" cellPadding="3" width="100%" border="0">
		<tr>
			<td>
				<table cellSpacing="1" cellPadding="3" width="100%" border="0">
					<tr>
						<td><%= GetString("KeyWords")%></td>
						<td>&nbsp;
							<asp:textbox id="txtName" runat="server"></asp:textbox><asp:linkbutton id="btnAddSpec" runat="server"></asp:linkbutton>&nbsp;
							<asp:linkbutton id="btnSearch" runat="server"></asp:linkbutton></td>
						<td></td>
						<td>&nbsp;</td>
					</tr>
				</table>
				<asp:datagrid id="dg" runat="server" DataKeyField="KeywordID" Width="100%" PageSize="100" CellPadding="4"
					BackColor="White" BorderWidth="1px" BorderStyle="None" BorderColor="#3366CC" AllowPaging="True"
					AllowSorting="True" AutoGenerateColumns="False">
					<SelectedItemStyle Font-Bold="True" ForeColor="#CCFF99" BackColor="#009999"></SelectedItemStyle>
					<ItemStyle ForeColor="#003399" BackColor="White"></ItemStyle>
					<HeaderStyle Font-Bold="True" ForeColor="#CCCCFF" BackColor="#003399"></HeaderStyle>
					<FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
					<Columns>
						<asp:TemplateColumn>
							<ItemTemplate>
								<input type="checkbox" id="chids" value='<%# DataBinder.Eval(Container.DataItem, "KeywordName")%>' runat="server" NAME="chids" />
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="KeyWords">
							<ItemTemplate>
								<%# DataBinder.Eval(Container.DataItem, "KeywordName")%>
							</ItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="name" Runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "KeywordName")%>'>
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
					</Columns>
					<PagerStyle HorizontalAlign="Left" ForeColor="#003399" BackColor="#99CCCC" Mode="NumericPages"></PagerStyle>
				</asp:datagrid><asp:label id="lblInfo" runat="server"></asp:label></td>
		</tr>
	</table>
	<P align="center">
		<INPUT type="button" value="<%= GetString("Select.Text")%>" onclick="selected()">&nbsp;<INPUT onclick="window.close()" type="button" value="<%= GetString("Cancel")%>"></P>
</form>
</body>
</html>