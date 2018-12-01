<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HelpManage.ascx.cs"
    Inherits="SEEKPET.Module.HelpManage" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<script type="text/javascript" src='<%=ModulePath%>js/calendar2.js'></script>
<!--******************************列表页面代码********************************-->
<%@ Register Src="WebUserPager.ascx" TagName="WebUserPager" TagPrefix="PeoNumControl" %>
<%@ Register Assembly="PeoControl.PeoNormalControl" Namespace="PeoNormalControl"
    TagPrefix="PeoControl" %>
<table class="datapsearch-Table" cellspacing="1" cellpadding="3" border="0">
    <tr>
        <td>
            日期：<asp:TextBox ID="txtStartDate" runat="server" Width="90" MaxLength="10" CssClass="normaltext2" onclick='calendar.show(this)'
                onfocus="this.blur()"></asp:TextBox>至<asp:TextBox ID="txtEndDate" runat="server"
                    Width="90" MaxLength="10" onclick='calendar.show(this)' onfocus="this.blur()"  CssClass="normaltext2" ></asp:TextBox>
        </td>
        <td>
            <asp:ImageButton ID="cmdSearch" runat="server" ImageUrl="~/images/search.gif" OnClick="cmdSearch_Click">
            </asp:ImageButton>
        </td>
    </tr>
</table>
<PeoControl:CustomPagingDataGrid ID='grdList' runat='server' SqlTableName='See_Help'
    SqlPK='ID' AllowCustomPaging='True' AllowPaging='True' AutoGenerateColumns='False'
    AllowSorting='True' CssClass='datagrid-main' Width='100%' PagerStyle-Visible="false"
    OnItemCommand="grdList_ItemCommand" OnItemDataBound="grdList_ItemDataBound" SqlSortField='CreateTime'
    SqlIsAsc="false">
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
        <asp:BoundColumn DataField="Feature" SortExpression="Feature" HeaderText="特征"></asp:BoundColumn>
        <asp:BoundColumn DataField="Address" SortExpression="Address" HeaderText="地点"></asp:BoundColumn>
        <asp:BoundColumn DataField="Pay" SortExpression="Pay" HeaderText="报酬"></asp:BoundColumn>
        <%--<asp:BoundColumn DataField="Description" SortExpression="Description" HeaderText="说明">
        </asp:BoundColumn>
        <asp:BoundColumn DataField="Picture" SortExpression="Picture" HeaderText="Picture">
        </asp:BoundColumn>--%>
        <asp:BoundColumn DataField="CreateTime" SortExpression="CreateTime" HeaderText="时间"
            DataFormatString='{0:d}'></asp:BoundColumn>
        <asp:TemplateColumn HeaderStyle-Width="40" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:HyperLink ID="Hyperlink1" runat="server" ImageUrl="~/images/view.gif" NavigateUrl='<%# EditUrl("ItemId",DataBinder.Eval(Container, "DataItem.ID").ToString(),"Info") %>'></asp:HyperLink>
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
