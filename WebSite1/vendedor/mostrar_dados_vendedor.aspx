<%@ Page Language="VB" AutoEventWireup="false" CodeFile="mostrar_dados_vendedor.aspx.vb" Inherits="vendedor_mostrar_dados_vendedor" %>

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
                    Dados do Vendedor<br />
        <asp:GridView ID="dgprincipal" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" GridLines="None" CellSpacing="1" HorizontalAlign="Justify" style="margin-right: 1px" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="nomevendedor" HeaderText="Nome" />
                <asp:BoundField DataField="nifvendedor" HeaderText="NIF" />
                <asp:BoundField DataField="telefonevendedor" HeaderText="Telefone" />
                <asp:BoundField DataField="moradavendedor" HeaderText="Morada" />
                <asp:BoundField DataField="emailvendedor" HeaderText="E-mail" />
                <asp:BoundField DataField="taxa" HeaderText="Taxa" />
                <asp:HyperLinkField DataNavigateUrlFields="id_vendedor" DataNavigateUrlFormatString="editar_vendedor.aspx?id={0}" Text="Editar dados" />
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
    
    
    </form>
        </div>
</body>
</html>
