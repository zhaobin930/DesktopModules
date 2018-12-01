<%@ Page Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.SelUser" Codebehind="SelUser.aspx.vb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script language="javascript">
var txtID='<asp:Literal id=txtID runat=server></asp:Literal>'
var SUser='<asp:Literal id=SUser runat=server></asp:Literal>'
var hidID='<asp:Literal id=hidID runat=server></asp:Literal>'
var lstUsersID='<%= lstUsers.ClientID%>'
var lstRolesID='<%= lstRoles.ClientID%>'
//window.move(100,100);
function SelUser()
{
	var lstUser=document.getElementById(lstUsersID)
	var strUser='';
	for(i=0;i<lstUser.length;i++)
	{
		if(lstUser.options[i].selected==true)
			 strUser=lstUser.options[i].value;
	}
	//alert(strUser);
	if(strUser=='')
	{
		if(window.confirm('<%= GetString("CloseForUser")%>'))
			window.close()
	}
	else
	{
		window.opener.document.getElementById(txtID).value=strUser;
		window.opener.document.getElementById(hidID).value=0;
		window.close();
	}
}
function SelRole()
{
	var lstRole=document.getElementById(lstRolesID)
	
	var strRole='';
	for(i=0;i<lstRole.length;i++)
	{
		if(lstRole.options[i].selected==true)
			 strRole=lstRole.options[i].value;
	}
	//alert(strUser);
	if(strRole=='')
	{
		if(window.confirm('<%= GetString("CloseForRole")%>'))
			window.close()
	}
	else
	{
		window.opener.document.getElementById(txtID).value=strRole;
		window.opener.document.getElementById(hidID).value=1;
		window.close();
	}
}
</script>
<LINK id="luna-tab-style-sheet" href="images/tabpane.css" type="text/css" rel="stylesheet">
	<SCRIPT src="images/tabpane.js" type="text/javascript"></SCRIPT>
	<body MS_POSITIONING="GridLayout">
		<TABLE height="958" cellSpacing="0" cellPadding="0" border="0" ms_2d_layout="TRUE">
			<TR vAlign="top">
				<TD  height="958">
					<form id="SelectUser" method="post" runat="server">
						<TABLE height="919" cellSpacing="0" cellPadding="0"  border="0" ms_2d_layout="TRUE">
							<TR vAlign="top">
								<TD width="10" height="15"></TD>
								<TD width="936"></TD>
							</TR>
							<TR vAlign="top">
								<TD height="904"></TD>
								<TD>
									<DIV class="tab-page" id="modules-cpanel" width="100%">
										<SCRIPT type="text/javascript">
   var tabPane1 = new WebFXTabPane( document.getElementById( "modules-cpanel" ), 0 )
										</SCRIPT>
										<DIV class="tab-page" id="module1">
											<H2 class="tab"><A href="#"><%= GetString("SelectUser")%></A></H2>
											<SCRIPT type="text/javascript">
  tabPane1.addTabPage( document.getElementById( "module1" ) );</SCRIPT>
											<table width="100%" cellpadding="3" cellspacing="1" class="Normal">
												<tr>
													<td height="10">&nbsp;<font size="2"><%= GetString("Search")%></font>
														<asp:DropDownList id="cboSearchUser" runat="server" AutoPostBack="True"></asp:DropDownList></td>
												</tr>
												<tr>
													<td>
														<asp:ListBox id="lstUsers" runat="server" Width="208px" Height="328px"></asp:ListBox></td>
												</tr>
												<tr>
													<td align="center"><INPUT type="button" value="<%= GetString("Select")%>" onclick="SelUser()"></td>
												</tr>
											</table>
										</DIV>
										<DIV class="tab-page" id="module2">
											<H2 class="tab"><A href="#"> <%= GetString("SelectRole")%></A></H2>
											<p>
												<SCRIPT type="text/javascript">
  tabPane1.addTabPage( document.getElementById( "module2" ) );</SCRIPT>
											</p>
											<table width="100%" cellpadding="3" cellspacing="1" height="396">
												<tr>
													<td>
														<asp:ListBox id="lstRoles" runat="server" Width="208px" Height="328px"></asp:ListBox></td>
												</tr>
												<tr>
													<td align="center"><INPUT type="button" value="<%= GetString("Select")%>" onclick="SelRole()"></td>
												</tr>
											</table>
										</DIV>
									</DIV>
								</TD>
							</TR>
						</TABLE>
					</form>
				</TD>
			</TR>
		</TABLE>
	</body>
