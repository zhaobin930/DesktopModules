<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="WebUserPager.ascx.cs"
    Inherits="SEEKPET.Module.WebUserPager" %>
<!--******************************列表自定义分页代码********************************-->
<asp:LinkButton ID="lbtnFirstPage" runat="server" CssClass="CommandButton" OnCommand="PagerButton_Click"
    CommandName="FirstPage" resourcekey="FirstPage" CausesValidation="False">首页</asp:LinkButton>
<asp:LinkButton ID="lbtnPreviousPage" runat="server" CssClass="CommandButton" OnCommand="PagerButton_Click"
    CommandName="PreviousPage" resourcekey="PreviousPage" CausesValidation="False">上一页</asp:LinkButton>
<asp:LinkButton ID="lbtnNextPage" runat="server" CssClass="CommandButton" OnCommand="PagerButton_Click"
    CommandName="NextPage" resourcekey="NextPage" CausesValidation="False">下一页</asp:LinkButton>
<asp:LinkButton ID="lbtnLastPage" runat="server" CssClass="CommandButton" OnCommand="PagerButton_Click"
    CommandName="LastPage" resourcekey="LastPage" CausesValidation="False">尾页</asp:LinkButton>
<asp:TextBox ID="txtPageNum" runat="server" Width="41px"></asp:TextBox>
<asp:CompareValidator ID="cmpValPageNum" CssClass="NormalRed" runat="server" ControlToValidate="txtPageNum"
    Display="Dynamic" ErrorMessage=">0" Operator="GreaterThan" Type="Integer" ValidationGroup="WebUserPager"
    ValueToCompare="0"></asp:CompareValidator>
<asp:LinkButton ID="lbtnGoto" runat="server" CssClass="CommandButton" OnCommand="PagerButton_Click"
    CommandName="Go" resourcekey="Go" ValidationGroup="WebUserPager">转到</asp:LinkButton>
<asp:Label ID="lblPageInfo" CssClass="Normal" runat="server" Visible="True"></asp:Label>
