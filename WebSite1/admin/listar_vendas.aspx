<%@ Page Language="VB" AutoEventWireup="false" CodeFile="listar_vendas.aspx.vb" Inherits="admin_listar_vendas" %>

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
        Vendas por pagar<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
            <Columns>
                <asp:BoundField DataField="id_venda" HeaderText="Número da venda" />
                <asp:BoundField DataField="nome_tipoestado" HeaderText="Estado" />
                <asp:BoundField DataField="nome_tipopagamento" HeaderText="Tipo pagamento" />
                <asp:BoundField DataField="data_venda" HeaderText="Data" />
                <asp:BoundField DataField="total_venda" HeaderText="Total" />
                <asp:HyperLinkField DataNavigateUrlFields="id_venda" DataNavigateUrlFormatString="alterar_estado.aspx?id={0}" Text="Alterar estado" />
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
        Vendas pagas<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
            <Columns>
                <asp:BoundField DataField="id_venda" HeaderText="Número da venda" />
                <asp:BoundField DataField="nome_tipoestado" HeaderText="Estado" />
                <asp:BoundField DataField="nome_tipopagamento" HeaderText="Tipo pagamento" />
                <asp:BoundField DataField="data_venda" HeaderText="Data" />
                <asp:BoundField DataField="total_venda" HeaderText="Total" />
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
        Vendas canceladas<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
            <Columns>
                <asp:BoundField DataField="id_venda" HeaderText="Número da venda" />
                <asp:BoundField DataField="nome_tipoestado" HeaderText="Estado" />
                <asp:BoundField DataField="nome_tipopagamento" HeaderText="Tipo pagamento" />
                <asp:BoundField DataField="data_venda" HeaderText="Data" />
                <asp:BoundField DataField="total_venda" HeaderText="Total" />
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
        <asp:Button ID="Button1" runat="server" Text="Voltar" />
        <br />
        <br />
        <asp:Label ID="Label_erro" runat="server"></asp:Label>
        <br />
    
        </form>
    </div>
    
</body>
</html>
