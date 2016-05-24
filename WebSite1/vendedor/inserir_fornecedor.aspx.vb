Imports System.Data
Imports System.Data.OracleClient


Partial Class vendedor_inserir_fornecedor
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        If (TextBox_nome.Text = "" Or TextBox_nif.Text = "" Or TextBox_tlf.Text = "" Or TextBox_morada.Text = "" Or TextBox_email.Text = "") Then
            Label_erro.Text = "Todos os campos são de preenchimento obrigatório"
        Else
            Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
                Dim cmd As New OracleCommand("pack_fornecedor.inserir_fornecedor", con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(New OracleParameter("nome", OracleType.VarChar))
                cmd.Parameters.Add(New OracleParameter("nif", OracleType.VarChar))
                cmd.Parameters.Add(New OracleParameter("tlf", OracleType.VarChar))
                cmd.Parameters.Add(New OracleParameter("morada", OracleType.VarChar))
                cmd.Parameters.Add(New OracleParameter("email", OracleType.VarChar))


                cmd.Parameters("nome").Value = TextBox_nome.Text
                cmd.Parameters("nif").Value = TextBox_nif.Text
                cmd.Parameters("tlf").Value = TextBox_tlf.Text
                cmd.Parameters("morada").Value = TextBox_morada.Text
                cmd.Parameters("email").Value = TextBox_email.Text

                con.Open()
                Try
                    cmd.ExecuteNonQuery()
                    Response.Write("<script> alert('Registo criado com sucesso!');</script>")
                    Response.AddHeader("REFRESH", "0;URL=Default.aspx")
                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()
            End Using
        End If

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("Default.aspx")
    End Sub
End Class
