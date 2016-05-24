<%@ Page Language="VB" AutoEventWireup="false" CodeFile="mostrar_vendas.aspx.vb" Inherits="mostrar_vendas" %>

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
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="logout.aspx">Logout</asp:HyperLink>
                    <br />
        <br />
                    Items vendidos à espera de pagamento<br />
        <asp:GridView ID="grelha_por_pagar" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" HorizontalAlign="Justify">
            <Columns>
                <asp:BoundField DataField="id_produto" HeaderText="Código Produto" />
                <asp:BoundField DataField="nome_produto" HeaderText="Nome" />
                <asp:BoundField DataField="quantidade_item" HeaderText="Quantidade" />
                <asp:BoundField DataField="preco_item" HeaderText="Preço" />
                <asp:BoundField DataField="data_venda" HeaderText="Data Venda" />
                <asp:HyperLinkField DataNavigateUrlFields="id_cliente" DataNavigateUrlFormatString="mostrar_dados_entrega.aspx?id={0}" Text="Dados entrega" />
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
                    <br />
                    Items vendidos pagos<asp:GridView ID="grelha_pagos" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" HorizontalAlign="Justify">
            <Columns>
                <asp:BoundField DataField="id_produto" HeaderText="Código Produto" />
                <asp:BoundField DataField="nome_produto" HeaderText="Nome" />
                <asp:BoundField DataField="quantidade_item" HeaderText="Quantidade" />
                <asp:BoundField DataField="preco_item" HeaderText="Preço" />
                <asp:BoundField DataField="data_venda" HeaderText="Data Venda" />
                <asp:HyperLinkField DataNavigateUrlFields="id_cliente" DataNavigateUrlFormatString="mostrar_dados_entrega.aspx?id={0}" Text="Dados entrega" />
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
                    <br />
                    Items vendidos cancelados<asp:GridView ID="grelha_cancelados" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" HorizontalAlign="Justify">
            <Columns>
                <asp:BoundField DataField="id_produto" HeaderText="Código Produto" />
                <asp:BoundField DataField="nome_produto" HeaderText="Nome" />
                <asp:BoundField DataField="quantidade_item" HeaderText="Quantidade" />
                <asp:BoundField DataField="preco_item" HeaderText="Preço" />
                <asp:BoundField DataField="data_venda" HeaderText="Data Venda" />
                <asp:HyperLinkField DataNavigateUrlFields="id_cliente" DataNavigateUrlFormatString="mostrar_dados_entrega.aspx?id={0}" Text="Dados entrega" />
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
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Voltar" />
                    <br />
                    <br />
        <asp:Label ID="Label_erro" runat="server"></asp:Label>
        <br />
    </form>
        </div>
</body>
</html>
