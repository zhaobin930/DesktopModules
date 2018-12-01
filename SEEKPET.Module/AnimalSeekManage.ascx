<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AnimalSeekManage.ascx.cs" Inherits="SEEKPET.Module.AnimalSeekManage" %>


<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<!--******************************列表页面代码********************************-->
<%@ Register Src="WebUserPager.ascx" TagName="WebUserPager" TagPrefix="PeoNumControl" %>
<%@ Register Assembly="PeoControl.PeoNormalControl" Namespace="PeoNormalControl" TagPrefix="PeoControl" %>
<table class="datapsearch-Table" cellspacing="1" cellpadding="3" border="0">
    <tr>
        <td>宠物特征：<asp:TextBox ID="txtFeature" runat="server" Width="100" MaxLength="10"></asp:TextBox></td>
        <td>走失地点：<asp:TextBox ID="txtlossplace" runat="server" Width="100" MaxLength="10"></asp:TextBox></td>
        <td>城市：<asp:TextBox ID="txtcity" runat="server" Width="100" MaxLength="10"></asp:TextBox></td>
        <td>
            <asp:ImageButton ID="cmdSearch" runat="server" ImageUrl="~/images/search.gif" OnClick="cmdSearch_Click"></asp:ImageButton></td>
    </tr>
</table>
<PeoControl:CustomPagingDataGrid ID='grdList' runat='server' SqlTableName='See_Seek'
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
        <asp:BoundColumn DataField="Kind" SortExpression="Kind" HeaderText="种类"></asp:BoundColumn>
        <asp:BoundColumn DataField="Feature" SortExpression="Feature" HeaderText="宠物特征"></asp:BoundColumn>
        <asp:BoundColumn DataField="Pay" SortExpression="Feature" HeaderText="感谢金"></asp:BoundColumn>
        <asp:BoundColumn DataField="lossplace" SortExpression="lossplace" HeaderText="走失地点"></asp:BoundColumn>
        <asp:BoundColumn DataField="contract" SortExpression="contract" HeaderText="联系电话"></asp:BoundColumn>
        <asp:BoundColumn DataField="city" SortExpression="city" HeaderText="城市"></asp:BoundColumn>
        <asp:TemplateColumn HeaderStyle-Width="40" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Image runat="server" ID="imgPicture" height="50px" BorderStyle="None" ImageUrl='<%#"/Portals/SEEKPETInfo/"+Eval("Par1").ToString() %>' ImageAlign="AbsMiddle"></asp:Image>
            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:BoundColumn DataField="Createtime" SortExpression="Createtime" HeaderText="提交时间"></asp:BoundColumn>
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
        <td>&nbsp;</td>
        <td class="tdNormal" align="right">
            <PeoNumControl:WebUserPager ID="wuPager" runat="server" DataGridAttached="grdList"></PeoNumControl:WebUserPager>
        </td>
        <td width="5"></td>
    </tr>
</table>

