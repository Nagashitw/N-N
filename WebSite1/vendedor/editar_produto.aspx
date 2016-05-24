<%@ Page Language="VB" AutoEventWireup="false" CodeFile="editar_produto.aspx.vb" Inherits="registar_cliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div style="margin-left: 80px; margin-right: 80px; padding-top: 10px; background-color: #C0C0C0; padding-left: 50px;">
    <form id="form1" runat="server">
                   <asp:Image ID="Image1" runat="server" Height="160px" ImageUrl="../logo.png" Width="177px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="logout.aspx">Logout</asp:HyperLink>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Nome"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_nome" runat="server" AutoPostBack="True" MaxLength="100"></asp:TextBox>
        <br />
        <br />
                   Preço&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox_preco" runat="server" AutoPostBack="True" MaxLength="10"></asp:TextBox>
        <br />
        <br />
                   Descriçao&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_descricao" runat="server" AutoPostBack="True" MaxLength="400" TextMode="MultiLine" Height="120px" Width="287px"></asp:TextBox>
        <br />
        <br />
                   Stock&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_stock" runat="server" AutoPostBack="True" MaxLength="9" EnableTheming="True"></asp:TextBox>
                   <br />
                   <br />
                   Categoria&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:TextBox ID="TextBox_categoria" runat="server"></asp:TextBox>
        &nbsp;&nbsp;
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Alterar dados" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Voltar" />
        <br />
        <br />
        <asp:Label ID="Label_erro" runat="server"></asp:Label>

    </form>
        </div>
</body>
</html>
