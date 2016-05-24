Imports System.Data
Imports System.Data.OracleClient
Partial Class vendedor_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If System.Web.HttpContext.Current.Session("id_vendedor") Is Nothing Then
            Response.Redirect("login_vendedor.aspx")
        End If
    End Sub
End Class
