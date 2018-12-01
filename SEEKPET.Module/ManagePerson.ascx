<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManagePerson.ascx.cs"
    Inherits="SEEKPET.Module.ManagePerson" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<script type="text/javascript" src='<%=ModulePath%>js/calendar2.js'></script>
<!--******************************列表页面代码********************************-->
<%@ Register Src="WebUserPager.ascx" TagName="WebUserPager" TagPrefix="PeoNumControl" %>
<%@ Register Assembly="PeoControl.PeoNormalControl" Namespace="PeoNormalControl"
    TagPrefix="PeoControl" %>
<table class="datapsearch-Table" cellspacing="1" cellpadding="3" border="0">
    <tr>
        <td>
            日期：<asp:TextBox ID="txtStartDate" runat="server" Width="90" MaxLength="10" CssClass="normaltext2"
                onclick='calendar.show(this)' onfocus="this.blur()"></asp:TextBox>至<asp:TextBox ID="txtEndDate"
                    runat="server" Width="90" MaxLength="10" onclick='calendar.show(this)' onfocus="this.blur()"
                    CssClass="normaltext2"></asp:TextBox>
        </td>
        <td>
            <asp:ImageButton ID="cmdSearch" runat="server" ImageUrl="~/images/search.gif" OnClick="cmdSearch_Click">
            </asp:ImageButton>
        </td>
    </tr>
</table>
<PeoControl:CustomPagingDataGrid ID='grdList' runat='server' SqlTableName='See_PersonInfo'
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
        <asp:BoundColumn DataField="Age" SortExpression="Age" HeaderText="年龄"></asp:BoundColumn>
        <asp:BoundColumn DataField="Sex" SortExpression="Sex" HeaderText="性别"></asp:BoundColumn>
        <asp:BoundColumn DataField="Profession" SortExpression="Profession" HeaderText="职业">
        </asp:BoundColumn>
        <asp:BoundColumn DataField="Address" SortExpression="Address" HeaderText="地区"></asp:BoundColumn>
        <asp:BoundColumn DataField="Code" SortExpression="Code" HeaderText="Code"></asp:BoundColumn>
        <asp:BoundColumn DataField="CreateTime" SortExpression="CreateTime" HeaderText="时间"
            DataFormatString='{0:d}'></asp:BoundColumn>
    </Columns>
</PeoControl:CustomPagingDataGrid>
<table class="datapager-Table" cellspacing="3" cellpadding="1" border="0">
    <tr>
        <td width="5">
        </td>
        <td align="left">
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
