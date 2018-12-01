<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CodeManage.ascx.cs"
    Inherits="SEEKPET.Module.CodeManage" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<!--******************************列表页面代码********************************-->
<%@ Register Src="WebUserPager.ascx" TagName="WebUserPager" TagPrefix="PeoNumControl" %>
<%@ Register Assembly="PeoControl.PeoNormalControl" Namespace="PeoNormalControl"
    TagPrefix="PeoControl" %>
<table class="datapsearch-Table" cellspacing="1" cellpadding="3" border="0">
    <tr>
        <td>
            项目：<asp:TextBox ID="txtCode" runat="server" Width="80" MaxLength="10"></asp:TextBox>
        </td>
        <td>
            <asp:ImageButton ID="cmdSearch" runat="server" ImageUrl="~/images/search.gif" OnClick="cmdSearch_Click">
            </asp:ImageButton>
        </td>
    </tr>
</table>
<PeoControl:CustomPagingDataGrid ID='grdList' runat='server' SqlTableName='vw_See_Code'
    SqlPK='ID' AllowCustomPaging='True' AllowPaging='True' AutoGenerateColumns='False'
    AllowSorting='True' CssClass='datagrid-main' Width='100%' PagerStyle-Visible="false"
    OnItemCommand="grdList_ItemCommand" OnItemDataBound="grdList_ItemDataBound">
    <ItemStyle CssClass='datagrid-Item'></ItemStyle>
    <HeaderStyle CssClass="DataGrid-Header" Font-Bold="False" Font-Italic="False" Font-Overline="False"
        Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
    <AlternatingItemStyle CssClass='datagrid-Alter'></AlternatingItemStyle>
    <PagerStyle HorizontalAlign='Center' CssClass='datagrid-Pager' Mode='NumericPages'>
    </PagerStyle>
    <FooterStyle CssClass='datagrid-Footer'></FooterStyle>
    <EditItemStyle CssClass='datagrid-Edit'></EditItemStyle>
    <SelectedItemStyle CssClass='datagrid-Selected'></SelectedItemStyle>
    <Columns>
        <asp:BoundColumn DataField="Code" SortExpression="Code" HeaderText="芯片编码"></asp:BoundColumn>
        <asp:BoundColumn DataField="DisplayName" SortExpression="UserID" HeaderText="用户">
        </asp:BoundColumn>
        <asp:BoundColumn DataField="HospitalName" SortExpression="HospitalID" HeaderText="医院">
        </asp:BoundColumn>
        <%--<asp:BoundColumn DataField="IsUse" SortExpression="IsUse" HeaderText="IsUse"></asp:BoundColumn>--%>
        <asp:TemplateColumn HeaderStyle-Width="40" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:HyperLink ID="hlkEditInfo" runat="server" ImageUrl="~/images/edit.gif" NavigateUrl='<%# EditUrl("ItemId",DataBinder.Eval(Container, "DataItem.ID").ToString(),"Edit") %>'></asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderStyle-Width="40" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lbnDelInfo" CommandName="CommandDelete" BorderStyle="None">
                    <asp:Image runat="server" ID="imgDelete" BorderStyle="None" ImageUrl="~\images\button_delete.gif"
                        ImageAlign="AbsMiddle"></asp:Image>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateColumn>
    </Columns>
</PeoControl:CustomPagingDataGrid>
<table class="datapager-Table" cellspacing="3" cellpadding="1" border="0">
    <tr>
        <td width="5">
        </td>
        <td align="left">
            <asp:HyperLink ID="cmdAdd" CssClass="normallinkbutton" runat="server" EnableViewState="False">新增</asp:HyperLink>
        </td>
        <td>
            &nbsp;
        </td>
        <td class="tdNormal" align="right">
            <PeoNumControl:WebUserPager ID="wuPager" runat="server" DataGridAttached="grdList">
            </PeoNumControl:WebUserPager>
        </td>
        <td width="5">
        </td>
    </tr>
</table>
