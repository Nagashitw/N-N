<%@ Page Language="VB" AutoEventWireup="false" CodeFile="registar_cliente.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
        <div style="margin-left: 80px; margin-right: 80px; padding-top: 10px; background-color: #C0C0C0; padding-left: 50px;">
    <form id="form1" runat="server">
    <asp:Image ID="Image1" runat="server" Height="160px" ImageUrl="logo.png" Width="177px" />
        <br />
        <br />
    &nbsp;<asp:Label ID="Label2" runat="server" Text="Nome"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_nome" runat="server" MaxLength="100" TextMode="SingleLine"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="NIF"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_nif" runat="server" MaxLength="10" TextMode="SingleLine"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Telefone"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_tlf" runat="server" MaxLength="9" TextMode="SingleLine"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Telemóvel"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox_tlm" runat="server" MaxLength="9" TextMode="SingleLine"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="E-mail"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_email" runat="server" MaxLength="100" TextMode="SingleLine"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="Username"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_username" runat="server" MaxLength="50"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label7" runat="server" Text="Password"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_password" runat="server" MaxLength="100" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label8" runat="server" Text="Morada"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_morada" runat="server" Height="88px" TextMode="MultiLine" Width="360px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label_erro" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Registar" />
        <br />
        <br />
    

    </form>
    </div>
</body>
</html>
