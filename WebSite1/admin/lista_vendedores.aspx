<%@ Page Language="VB" AutoEventWireup="false" CodeFile="lista_vendedores.aspx.vb" Inherits="admin_lista_vendedores" %>

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
        <asp:GridView ID="lista_vendedores" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
            <Columns>
                <asp:BoundField DataField="id_vendedor" HeaderText="ID Vendedor" />
                <asp:BoundField DataField="nomevendedor" HeaderText="Nome" />
                <asp:BoundField DataField="nifvendedor" HeaderText="NIF" />
                <asp:BoundField DataField="moradavendedor" HeaderText="Morada" />
                <asp:BoundField DataField="telefonevendedor" HeaderText="Telefone" />
                <asp:BoundField DataField="emailvendedor" HeaderText="E-mail" />
                <asp:BoundField DataField="taxa" HeaderText="Taxa" />
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
        <asp:Label ID="Label_erro" runat="server"></asp:Label>
        <br />
    
    
    </form>
                </div>
</body>
</html>
