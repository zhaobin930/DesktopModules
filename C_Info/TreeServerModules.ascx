<%@ Control Language="vb" AutoEventWireup="false" Inherits="EasySite.Modules.C_Info.TreeServerModules"
    CodeBehind="TreeServerModules.ascx.vb" %>
<%@ Register TagPrefix="ComponentWeb" Namespace="EasyComponent.Web.UI.WebControls"
    Assembly="EasyComponent.Web.UI.WebControls" %>
<link href="<%= ModulePath %>images/treeStyle.css" type="text/css" rel="stylesheet">
<table cellpadding="0" cellspacing="0" id="tblContainer">
    <tr>
        <td>
            <asp:CheckBox ID="chkShowTree" runat="server" AutoPostBack="True" Text="Show Tree List"
                CssClass="SubHead" resourcekey="ShowTree"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <ComponentWeb:TreeView id="TreeViewModules" Height="400" Width="300" DragAndDropEnabled="false"
                NodeEditingEnabled="false" KeyboardEnabled="false" CssClass="TreeView" NodeCssClass="TreeNode"
                SelectedNodeCssClass="SelectedTreeNode" HoverNodeCssClass="HoverTreeNode" NodeEditCssClass="NodeEdit"
                LineImageWidth="19" LineImageHeight="20" DefaultImageWidth="16" DefaultImageHeight="16"
                NodeLabelPadding="3" ParentNodeImageUrl="~/desktopmodules/C_Info/images/folders.gif"
                LeafNodeImageUrl="~/desktopmodules/C_Info/images/folder.gif" ShowLines="true"
                LineImagesFolderUrl="~/desktopmodules/C_Info/images/lines/" runat="server" Visible="false">
            </ComponentWeb:TreeView>
        </td>
    </tr>
</table>
