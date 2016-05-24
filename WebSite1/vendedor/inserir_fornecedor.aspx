<%@ Page Language="VB" AutoEventWireup="false" CodeFile="inserir_fornecedor.aspx.vb" Inherits="vendedor_inserir_fornecedor" %>

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
    &nbsp;<asp:Label ID="Label2" runat="server" Text="Nome"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_nome" runat="server" MaxLength="100"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="NIF"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="TextBox_nif" runat="server" MaxLength="10" TextMode="SingleLine"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Telefone"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:TextBox ID="TextBox_tlf" runat="server" MaxLength="9" TextMode="SingleLine"></asp:TextBox>
        <br />
        <br />
        Morada&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="TextBox_morada" runat="server" MaxLength="9" TextMode="MultiLine" Height="88px" Width="430px"></asp:TextBox>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Label ID="Label5" runat="server" Text="E-mail"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_email" runat="server" MaxLength="100" TextMode="SingleLine"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label_erro" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Inserir  dados" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Voltar" />
        <br />
        <br />
    

    </form>
    </div>
</body>
</html>
