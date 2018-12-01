<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.EditC_InfoExtendField"
    CodeBehind="EditC_InfoExtendField.ascx.vb" %>
<%@ Register TagPrefix="c_info" TagName="AdminNavigator" Src="~/desktopmodules/c_info/AdminC_InfoNavigator.ascx" %>
<c_info:AdminNavigator id="AdminNavigator" runat="server">
</c_info:AdminNavigator>
<asp:Label ID="lblmessage" runat="server" ForeColor="Red" EnableViewState="False"></asp:Label>
<asp:DataGrid ID="grdFields" runat="server" AutoGenerateColumns="False" CellSpacing="1"
    OnCancelCommand="grdFields_CancelEdit" OnUpdateCommand="grdFields_Update" OnEditCommand="grdFields_Edit"
    OnDeleteCommand="grdFields_Delete" Width="100%" CellPadding="4" Border="0" DataKeyField="ExtFieldID"
    CssClass="datagrid-main">
    <AlternatingItemStyle CssClass="datagrid-Alter"></AlternatingItemStyle>
    <ItemStyle CssClass="datagrid-Item"></ItemStyle>
    <HeaderStyle HorizontalAlign="Center" CssClass="datagrid-Header"></HeaderStyle>
    <FooterStyle ForeColor="#003399" BackColor="#99CCCC"></FooterStyle>
    <Columns>
        <asp:TemplateColumn>
            <ItemTemplate>
                <asp:ImageButton ID="cmdEditUserDefinedField" runat="server" CausesValidation="false"
                    CommandName="Edit" ImageUrl="~/images/edit.gif" AlternateText="Modify" Visible='<%# CType(Container.DataItem,DataRowView)("ModuleID")=ModuleID orelse PortalSecurity.IsInRole(PortalSettings.AdministratorRoleName) %>'>
                </asp:ImageButton>
                <asp:ImageButton ID="cmdDeleteUserDefinedField" runat="server" CausesValidation="false"
                    CommandName="Delete" ImageUrl="~/images/delete.gif" AlternateText="Delete" Visible='<%# CType(Container.DataItem,DataRowView)("ModuleID")=ModuleID orelse PortalSecurity.IsInRole(PortalSettings.AdministratorRoleName) %>'>
                </asp:ImageButton>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:ImageButton ID="cmdSaveUserDefinedField" runat="server" CausesValidation="false"
                    CommandName="Update" ImageUrl="~/images/save.gif" AlternateText="Save"></asp:ImageButton>
                <asp:ImageButton ID="cmdCancelUserDefinedField" runat="server" CausesValidation="false"
                    CommandName="Cancel" ImageUrl="~/images/cancel.gif" AlternateText="Cancel"></asp:ImageButton>
            </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Name" ItemStyle-CssClass="Normal" HeaderStyle-CssClass="NormalBold">
            <ItemTemplate>
                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>'
                    ID="Label1" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Label ID="lblFieldTitle" runat="server" />
                <asp:TextBox runat="server" ID="txtFieldTitle" Columns="20" Width="100" Text='<%# DataBinder.Eval(Container.DataItem, "Name") %>' />
            </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="EName" ItemStyle-CssClass="Normal" HeaderStyle-CssClass="NormalBold">
            <ItemTemplate>
                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EName") %>'
                    ID="lblFieldETitle" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Label ID="Label4" runat="server" />
                <asp:TextBox runat="server" ID="txtFieldETitle" Columns="20" Width="100" Text='<%# DataBinder.Eval(Container.DataItem, "EName") %>' />
            </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="DefaultValue" ItemStyle-CssClass="Normal" HeaderStyle-CssClass="NormalBold">
            <ItemTemplate>
                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "DefaultValue") %>'
                    ID="Label5" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Label runat="server" ID="Label6" NAME="Label6" ForeColor="red" resourcekey="DefaultValueDescription"></asp:Label><br>
                <asp:TextBox runat="server" ID="txtDefaultValue" Text='<%# DataBinder.Eval(Container.DataItem, "DefaultValue") %>'
                    Width="250" />
            </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="Type" ItemStyle-CssClass="Normal" HeaderStyle-CssClass="NormalBold">
            <ItemTemplate>
                <asp:Label runat="server" Text='<%# Localization.GetString(DataBinder.Eval(Container.DataItem, "Type"),LocalResourceFile) %>'
                    ID="Label2" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Label ID="lblFieldType" runat="server" />
                <asp:DropDownList ID="cboFieldType" runat="server" CssClass="NormalTextBox" SelectedValue='<%# DataBinder.Eval(Container.DataItem, "Type") %>'>
                    <asp:ListItem Value="SingleLineText" resourcekey="SingleLineText"></asp:ListItem>
                    <asp:ListItem Value="MulityLineText" resourcekey="MulityLineText"></asp:ListItem>
                    <asp:ListItem Value="Image" resourcekey="Image"></asp:ListItem>
                    <asp:ListItem Value="File" resourcekey="File"></asp:ListItem>
                    <asp:ListItem Value="DropDownList" resourcekey="DropDownList"></asp:ListItem>
                    <asp:ListItem Value="RichTextBox" resourcekey="RichTextBox"></asp:ListItem>
                    <asp:ListItem Value="Decimal" resourcekey="Decimal"></asp:ListItem>
                    <asp:ListItem Value="DateTime" resourcekey="DateTime"></asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="CanViewRoles" ItemStyle-CssClass="Normal" HeaderStyle-CssClass="NormalBold">
            <ItemTemplate>
                <asp:Label runat="server" Width="100" Text='<%# DataBinder.Eval(Container.DataItem, "CanViewRoles") %>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList runat="server" ID="drpPortalRoles" AppendDataBoundItems="True" DataTextField="RoleName" DataValueField="RoleName" onchange="javascript:addValueToViewRoleBox(this)">
                <asp:ListItem Value="" resourcekey="None_Specified"></asp:ListItem>
                </asp:DropDownList>
                <br>
                <asp:TextBox runat="server" ID="txtCanViewRoles" Width="100"  Text='<%# DataBinder.Eval(Container.DataItem, "CanViewRoles") %>' />
                <script type="text/javascript">
                    function addValueToViewRoleBox(oSource) {
                        var oTarget = oSource.parentNode.getElementsByTagName("input")[0];
                        if (oSource.value != '') {
                            if (oTarget.value != '') oTarget.value += ';';
                            oTarget.value += oSource.value;
                        }
                    }
                </script>
            </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="NoRightAlert" ItemStyle-CssClass="Normal" HeaderStyle-CssClass="NormalBold">
            <ItemTemplate>
                <asp:Label runat="server" Width="100"  Text='<%# DataBinder.Eval(Container.DataItem, "NoRightAlert") %>' />
            </ItemTemplate>
            <EditItemTemplate>               
                <asp:TextBox runat="server" ID="txtNoRightAlert" Width="80" Text='<%# DataBinder.Eval(Container.DataItem, "NoRightAlert") %>' />
            </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="IsPortalScope" HeaderStyle-CssClass="NormalBold"
            ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:CheckBox runat="server" ID="chkIsPortalScope" Checked='<%# CType(Container.DataItem,DataRowView)("ModuleID")=-1 %>'
                    Enabled="false" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:CheckBox runat="server" ID="chkIsPortalScope" Checked='<%# CType(Container.DataItem,DataRowView)("ModuleID")=-1 %>'
                    Enabled='<%# PortalSecurity.IsInRole(PortalSettings.AdministratorRoleName) %>' />
            </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="IsRequired" HeaderStyle-CssClass="NormalBold" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:CheckBox runat="server" ID="chkIsRequired" Checked='<%# CType(CType(Container.DataItem,DataRowView)("IsRequired"),Boolean) %>'
                    Enabled="false" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:CheckBox runat="server" ID="chkIsRequired" Checked='<%# CType(CType(Container.DataItem,DataRowView)("IsRequired"),Boolean) %>' />
            </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="GroupName" HeaderStyle-CssClass="NormalBold" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "GroupName") %>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox runat="server" ID="txtGroupName" Width="60" Text='<%# DataBinder.Eval(Container.DataItem, "GroupName") %>' />
            </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="OrderNum" HeaderStyle-CssClass="NormalBold" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "OrderNum") %>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox runat="server" ID="txtOrderNum" Width="20" Text='<%# DataBinder.Eval(Container.DataItem, "OrderNum") %>' />
            </EditItemTemplate>
        </asp:TemplateColumn>
        <asp:TemplateColumn HeaderText="SkinLabel" ItemStyle-CssClass="Normal" HeaderStyle-CssClass="NormalBold">
            <ItemTemplate>
                <asp:Label runat="server" Text='<%# ("[ExtField:" & DataBinder.Eval(Container.DataItem, "ExtFieldID") & "$" & DataBinder.Eval(Container.DataItem, "EName") & "]").ToUpper  %>'
                    ID="Label3" />
            </ItemTemplate>
        </asp:TemplateColumn>
    </Columns>
</asp:DataGrid><br>
&nbsp;&nbsp;
<asp:LinkButton class="CommandButton" ID="cmdAddField" runat="server" Text="Add New Column"
    CausesValidation="False" BorderStyle="none" resourcekey="AddExtField"></asp:LinkButton>&nbsp;&nbsp;
<asp:LinkButton class="CommandButton" Visible="False" ID="cmdCancel" runat="server"
    Text="Cancel" CausesValidation="False" BorderStyle="none" resourcekey="Cancel"></asp:LinkButton>
