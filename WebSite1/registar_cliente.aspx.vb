Imports System.Data
Imports System.Data.OracleClient


Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        If (TextBox_nome.Text = "" Or TextBox_nif.Text = "" Or TextBox_tlf.Text = "" Or TextBox_tlm.Text = "" Or TextBox_email.Text = "" Or TextBox_username.Text = "" Or TextBox_password.Text = "") Then
            Label_erro.Text = "Todos os campos são de preenchimento obrigatório"
        Else
            Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
                Dim cmd As New OracleCommand("pack_cliente.inserir_cliente", con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(New OracleParameter("nome", OracleType.VarChar))
                cmd.Parameters.Add(New OracleParameter("nif", OracleType.Number))
                cmd.Parameters.Add(New OracleParameter("tlf", OracleType.Number))
                cmd.Parameters.Add(New OracleParameter("tlm", OracleType.Number))
                cmd.Parameters.Add(New OracleParameter("email", OracleType.VarChar))
                cmd.Parameters.Add(New OracleParameter("username", OracleType.VarChar))
                cmd.Parameters.Add(New OracleParameter("password", OracleType.VarChar))
                cmd.Parameters.Add(New OracleParameter("morada", OracleType.VarChar))

                cmd.Parameters("nome").Value = TextBox_nome.Text
                cmd.Parameters("nif").Value = TextBox_nif.Text
                cmd.Parameters("tlf").Value = TextBox_tlf.Text
                cmd.Parameters("tlm").Value = TextBox_tlm.Text
                cmd.Parameters("email").Value = TextBox_email.Text
                cmd.Parameters("username").Value = TextBox_username.Text
                cmd.Parameters("password").Value = TextBox_password.Text
                cmd.Parameters("morada").Value = TextBox_morada.Text
                con.Open()
                Try
                    cmd.ExecuteNonQuery()
                    Response.Write("<script> alert('Registo criado com sucesso vai ser redirecionado para a página de login');</script>")
                    Response.AddHeader("REFRESH", "0;URL=login.aspx")
                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()
            End Using
        End If

    End Sub
End Class
