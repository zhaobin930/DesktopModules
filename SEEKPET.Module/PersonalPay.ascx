<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonalPay.ascx.cs"
    Inherits="SEEKPET.Module.PersonalPay" %>
<link rel="stylesheet" type="text/css" href='<%=ModulePath %>css/module.css' />
<!--******************************列表页面代码********************************-->
<%@ Register Src="WebUserPager.ascx" TagName="WebUserPager" TagPrefix="PeoNumControl" %>
<%@ Register Assembly="PeoControl.PeoNormalControl" Namespace="PeoNormalControl"
    TagPrefix="PeoControl" %>
<div class="mainpage">
    <PeoControl:CustomPagingDataGrid ID='grdList' runat='server' SqlTableName='vw_See_Pay'
        SqlPK='ID' AllowCustomPaging='True' AllowPaging='True' AutoGenerateColumns='False'
        AllowSorting='True' CssClass='datagrid-main' Width='100%' PagerStyle-Visible="false"
        BorderStyle="None" OnItemCommand="grdList_ItemCommand" OnItemDataBound="grdList_ItemDataBound"
        SqlIsAsc="false" SqlSortField="CreateTime">
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
            <asp:BoundColumn DataField="TradeNo" SortExpression="TradeNo" HeaderText="流水号"></asp:BoundColumn>
            <asp:BoundColumn DataField="HospitalName" SortExpression="HospitalName" HeaderText="医院">
            </asp:BoundColumn>
            <asp:BoundColumn DataField="IsPayText" SortExpression="IsPayText" HeaderText="是否支付">
            </asp:BoundColumn>
            <asp:BoundColumn DataField="CostMoneyText" SortExpression="CostMoneyText" HeaderText="金额（元）">
            </asp:BoundColumn>
            <asp:BoundColumn DataField="CreateTime" SortExpression="CreateTime" HeaderText="时间"
                DataFormatString='{0:yyyy-MM-dd HH:mm:ss}'></asp:BoundColumn>
            <asp:BoundColumn DataField="IsVerifyText" SortExpression="IsVerifyText" HeaderText="是否核销">
            </asp:BoundColumn>
            <asp:TemplateColumn HeaderStyle-Width="50" ItemStyle-HorizontalAlign="Center" HeaderText="二维码">
                <ItemTemplate>
                    <asp:HyperLink ID="Hyperlink1" runat="server" ImageUrl="~/images/view.gif" NavigateUrl='<%#GetQrCodeURL(Eval("ticket").ToString()) %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateColumn>
        </Columns>
    </PeoControl:CustomPagingDataGrid>
    <table class="datapager-Table" cellspacing="3" cellpadding="1" border="0">
        <tr>
            <td class="tdNormal" align="right">
                <PeoNumControl:WebUserPager ID="wuPager" runat="server" DataGridAttached="grdList">
                </PeoNumControl:WebUserPager>
            </td>
            <td width="5">
            </td>
        </tr>
    </table>
</div>
