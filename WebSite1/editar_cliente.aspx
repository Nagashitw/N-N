<%@ Page Language="VB" AutoEventWireup="false" CodeFile="editar_cliente.aspx.vb" Inherits="registar_cliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div style="margin-left: 80px; margin-right: 80px; padding-top: 10px; background-color: #C0C0C0; padding-left: 50px;">
    <form id="form1" runat="server">
                   <asp:Image ID="Image1" runat="server" Height="160px" ImageUrl="logo.png" Width="177px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="mostrar_dados_cliente.aspx">Área Cliente</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="loja_produtos.aspx">Loja</asp:HyperLink>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="carrinho.aspx">Carrinho</asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="logout.aspx">Logout</asp:HyperLink>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Nome"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_nome" runat="server" AutoPostBack="True" MaxLength="100"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="NIF"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_nif" runat="server" AutoPostBack="True" MaxLength="10" TextMode="Number"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Telefone"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_tlf" runat="server" AutoPostBack="True" MaxLength="9" TextMode="Number"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Telemóvel"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_tlm" runat="server" AutoPostBack="True" MaxLength="9" TextMode="Number"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="E-mail"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_email" runat="server" AutoPostBack="True" MaxLength="100"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_password" runat="server" AutoPostBack="True" MaxLength="512"></asp:TextBox>
                   <br />
                   <br />
                   <asp:Label ID="Label7" runat="server" Text="Morada"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:TextBox ID="TextBox_morada" runat="server" AutoPostBack="True" Height="96px" TextMode="MultiLine" Width="351px"></asp:TextBox>
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
