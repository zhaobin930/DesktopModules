<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HospitalManage.ascx.cs" Inherits="SEEKPET.Module.HospitalManage" %>


<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<!--******************************列表页面代码********************************-->
<%@ Register Src="WebUserPager.ascx" TagName="WebUserPager" TagPrefix="PeoNumControl" %>
<%@ Register Assembly="PeoControl.PeoNormalControl" Namespace="PeoNormalControl" TagPrefix="PeoControl" %>
<table class="datapsearch-Table" cellSpacing="1" cellPadding="3" border="0">
	<tr>
		<td>名字：<asp:textbox id="txtHospitalName" Runat="server" Width="100" MaxLength="10"></asp:textbox></td>
		<td><asp:imagebutton id="cmdSearch" Runat="server" ImageUrl="~/images/search.gif" onClick="cmdSearch_Click"></asp:imagebutton></td>
	</tr>
</table>
<PeoControl:CustomPagingDataGrid ID='grdList' runat='server' SqlTableName='See_Hospital'
    SqlPK='ID' AllowCustomPaging='True' AllowPaging='True' AutoGenerateColumns='False'
    AllowSorting='True' CssClass='datagrid-main' Width='100%' PagerStyle-Visible="false" OnItemCommand="grdList_ItemCommand" OnItemDataBound="grdList_ItemDataBound">
    <ItemStyle CssClass='datagrid-Item'></ItemStyle>
    <HeaderStyle CssClass="DataGrid-Header" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
    <AlternatingItemStyle CssClass='datagrid-Alter'></AlternatingItemStyle>
    <PagerStyle HorizontalAlign='Center' CssClass='datagrid-Pager' Mode='NumericPages'></PagerStyle>
    <FooterStyle CssClass='datagrid-Footer'></FooterStyle>
    <EditItemStyle CssClass='datagrid-Edit'></EditItemStyle>
    <SelectedItemStyle CssClass='datagrid-Selected'></SelectedItemStyle>
    <Columns>
		<asp:BoundColumn DataField="HospitalName" SortExpression="HospitalName" HeaderText="医院名称"  ></asp:BoundColumn>
		<asp:BoundColumn DataField="Address" SortExpression="Address" HeaderText="地址"  ></asp:BoundColumn>
		<asp:TemplateColumn HeaderStyle-Width="40" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Image runat="server" ID="imgPicture" height="50px" BorderStyle="None" ImageUrl='<%#"/Portals/SEEKPETInfo/"+Eval("Picture").ToString() %>' ImageAlign="AbsMiddle"></asp:Image>
            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderStyle-Width="40" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:HyperLink ID="hlkEditInfo" runat="server" ImageUrl="~/images/edit.gif" NavigateUrl='<%# EditUrl("ItemId",DataBinder.Eval(Container, "DataItem.ID").ToString(),"Edit") %>'></asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderStyle-Width="40" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lbnDelInfo" CommandName="CommandDelete" BorderStyle="None">
                    <asp:Image runat="server" ID="imgDelete" BorderStyle="None" ImageUrl="~\images\button_delete.gif" ImageAlign="AbsMiddle"></asp:Image>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateColumn>
    </Columns>
</PeoControl:CustomPagingDataGrid>
<table class="datapager-Table" cellspacing="3" cellpadding="1" border="0">
    <tr>
        <td width="5"></td>
        <td align="left">
            <asp:HyperLink ID="cmdAdd" CssClass="ButtonCss80" runat="server" EnableViewState="False">新增</asp:HyperLink>
        </td>
        <td>&nbsp;</td>
        <td class="tdNormal" align="right">
            <PeoNumControl:WebUserPager ID="wuPager" runat="server" DataGridAttached="grdList"></PeoNumControl:WebUserPager>
        </td>
        <td width="5"></td>
    </tr>
</table>

<script language="javascript">
    //全选
    function selectAll(SourceID, ControlID) {
        var sourceBox = document.getElementById(SourceID);
        var theBox = document.all(ControlID);

        elm = theBox.getElementsByTagName('Input');
        for (i = 0; i < elm.length; i++) {
            if (elm[i].type == "checkbox") {
                elm[i].checked = sourceBox.checked;
            }
        }
    }
    //选择删除检测
    function CheckNULL(ControlID) {
        var isNULL = false;
        var theBox = document.all(ControlID);
        elm = theBox.getElementsByTagName('Input');

        for (var i = 0; i < elm.length; i++) {
            var e = elm[i];
            if (e.type == "checkbox" && e.checked == true && e.id != "chkAllInBox") {
                isNULL = true;
            }
        }
        if (isNULL == false) {
            alert('请选择删除项！');
            return false;
        }
        else {
            return confirm('确定要删除信息？');
        }
    }
</script>
			