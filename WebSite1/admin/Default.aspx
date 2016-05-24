<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="admin_admin" %>

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
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="registar_vendedor.aspx">Inserir Vendedor</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="lista_vendedores.aspx">Listar Vendedores</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="editar_taxas.aspx">Editar taxas</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="listar_ganhos.aspx">Listar ganhos taxados</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="listar_vendas.aspx">Alterar estado venda</asp:HyperLink>
        <br />
        <br />
    
    
    </form>
   </div>
</body>
</html>
