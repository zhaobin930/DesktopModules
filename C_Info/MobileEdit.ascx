<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MobileEdit.ascx.vb"
    Inherits="EasySite.Modules.C_Info.MobileEdit" %>
<table>
    <tr>
        <td>
            <asp:Label ID="lblTitle" runat="server" Text='<%#Localization.GetString("Title",me.LocalResourceFile) %>'>Title:</asp:Label>
            <asp:TextBox ID="txtTitle" runat="server" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtTitle" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblAuthor" runat="server" Text='<%#Localization.GetString("Author",me.LocalResourceFile) %>'>Author:</asp:Label>
            <asp:TextBox ID="txtAuthor" runat="server" Width="73px"></asp:TextBox>
            <asp:Label ID="lblCreateDate" runat="server" Text='<%#Localization.GetString("CreateDate",me.LocalResourceFile) %>'>CreateDate:</asp:Label>
            <asp:TextBox ID="txtCreateDate" runat="server" Width="120px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtCreateDate" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblDescription" runat="server" Text='<%#Localization.GetString("Description",me.LocalResourceFile) %>'>Description:</asp:Label>
            <asp:TextBox ID="txtDescription" runat="server" Width="250px" TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblExtUrl" runat="server" Text='<%#Localization.GetString("ExtUrl",me.LocalResourceFile) %>'>ExtUrl:</asp:Label>
            <asp:TextBox ID="txtExtUrl" runat="server" Width="250px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td valign="top">
            <asp:Label ID="lblContent" runat="server" Text='<%#Localization.GetString("Content",me.LocalResourceFile) %>'>Content:</asp:Label>
            <asp:TextBox ID="txtContent" runat="server" Width="350px" TextMode="MultiLine" 
                Height="168px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:LinkButton ID="cmdUpdate" runat="server" Text='<%#"["+Localization.GetString("cmdUpdate",me.LocalResourceFile)+"]" %>'></asp:LinkButton>
            <asp:LinkButton ID="cmdUpdateAndContinue" runat="server" Text='<%#"["+Localization.GetString("cmdUpdateAndContinue",me.LocalResourceFile)+"]" %>'></asp:LinkButton>
            <asp:HyperLink ID="cmdReturn" runat="server" Text='<%#"["+Localization.GetString("cmdReturn")+"]" %>'
                NavigateUrl='<%#UrlRefer %>'></asp:HyperLink>
        </td>
    </tr>
</table>
