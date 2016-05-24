Imports System.Data
Imports System.Data.OracleClient
Partial Class registar_cliente
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If System.Web.HttpContext.Current.Session("id_vendedor") Is Nothing Then
            Response.Redirect("login_vendedor.aspx")
        End If
            Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
            Dim cmd As New OracleCommand("pack_produto.remover_produto", con)
                cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New OracleParameter("idprod", OracleType.Number))
            cmd.Parameters("idprod").Value = Request.QueryString("id")
                con.Open()
                Try
                cmd.ExecuteReader()
                Label_erro.Text = "Produto removido com Sucesso!"
                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()

            End Using
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("gerir_produtos.aspx")
    End Sub
End Class
