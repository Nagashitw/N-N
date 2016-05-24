<%@ Page Language="VB" AutoEventWireup="false" CodeFile="carrinho.aspx.vb" Inherits="carrinho" %>

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
    
<asp:GridView ID="grelha_carrinho" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" DataKeyNames="idcarrinho">
    <Columns>
        <asp:BoundField DataField="nome_produto" HeaderText="Nome Produto" />
        <asp:BoundField DataField="nomevendedor" HeaderText="Vendedor" />
        <asp:BoundField DataField="preco" HeaderText="Preço" />
        <asp:ButtonField ButtonType="Button" CommandName="decrease" Text="-" />
        <asp:BoundField DataField="quantidade_produto" HeaderText="Quantidade" />
        <asp:ButtonField ButtonType="Button" CommandName="increase" Text="+" />
        <asp:ButtonField ButtonType="Button" CommandName="remove" Text="Remover" />
    </Columns>
    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#594B9C" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
            <br />
<asp:Label ID="Label_total" runat="server" Text="Total Carrinho"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox_total_carrinho" runat="server"></asp:TextBox>
            <br />
            <br />
<asp:Label ID="Label1" runat="server" Text="Escolha o modo de pagamento"></asp:Label>
&nbsp;
            <asp:DropDownList ID="DropDownList_pagamento" runat="server" AutoPostBack="True">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button_finalizar_compra" runat="server" Text="Finalizar compra" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Continuar a comprar" />
            <br />
            <asp:Label ID="Label_erro" runat="server"></asp:Label>
            <br />
        </form>
        
    </div>
</body>
</html>
