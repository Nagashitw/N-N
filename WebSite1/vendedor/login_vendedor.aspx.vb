Imports System.Data
Imports System.Data.OracleClient
Partial Class login
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If (TextBox_username.Text = "" Or TextBox_password.Text = "") Then
            Label_erro.Text = "Todos os campos são de preenchimento obrigatório"
        Else
            Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
                Dim cmd As New OracleCommand("login_vendedor", con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(New OracleParameter("vendedorid", OracleType.Number)).Direction = ParameterDirection.ReturnValue
                cmd.Parameters.Add(New OracleParameter("user", OracleType.VarChar))
                cmd.Parameters.Add(New OracleParameter("pass", OracleType.VarChar))
                cmd.Parameters("user").Value = TextBox_username.Text
                cmd.Parameters("pass").Value = TextBox_password.Text

                con.Open()
                Try
                    cmd.ExecuteNonQuery()
                    Session("id_vendedor") = cmd.Parameters("vendedorid").Value
                    Response.Redirect("Default.aspx")
                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()
            End Using
        End If
    End Sub
End Class
