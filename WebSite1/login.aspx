<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

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
 
        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_username" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox_password" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label_erro" runat="server"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Login" />
    </form>
       </div>
</body>
</html>
