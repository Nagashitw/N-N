<%@ Page Language="VB" AutoEventWireup="false" CodeFile="alterar_estado.aspx.vb" Inherits="admin_alterar_estado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div style="margin-left: 80px; margin-right: 80px; padding-top: 10px; background-color: #C0C0C0; padding-left: 50px;">
    <form id="form1" runat="server">
        <asp:Image ID="Image1" runat="server" Height="160px" ImageUrl="../logo.png" Width="177px" />
        <br />
        <br />
        <br />
        Está a alterar a Venda Número
        <asp:Label ID="Label_venda" runat="server"></asp:Label>
        <br />
        Escolha o novo estado da venda:
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Alterar" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Voltar" />
        <br />
        <br />
        <asp:Label ID="Label_erro" runat="server"></asp:Label>
        <br />
    </form>
    </div>
    
</body>
</html>
