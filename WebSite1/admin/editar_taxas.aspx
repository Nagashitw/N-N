<%@ Page Language="VB" AutoEventWireup="false" CodeFile="editar_taxas.aspx.vb" Inherits="admin_editar_taxas" %>

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
        <asp:Label ID="Label1" runat="server" Text="Selecione o Vendedor"></asp:Label>
&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <br />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Intoduza a nova taxa"></asp:Label>
        :
        <asp:TextBox ID="TextBox_taxa" runat="server" AutoPostBack="True"></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Button ID="Button_atualizartaxa" runat="server" Text="Atualizar taxa" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Voltar" />
        <br />
        <br />
        <asp:Label ID="Label_erro" runat="server"></asp:Label>
        <br />
    
         </form>
    </div>
   
</body>
</html>
