Imports System.Data
Imports System.Data.OracleClient
Partial Class registar_cliente
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If System.Web.HttpContext.Current.Session("id_vendedor") Is Nothing Then
            Response.Redirect("login_vendedor.aspx")
        End If
        If (Not IsPostBack) Then
            Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
                Dim cmd As New OracleCommand("pack_vendedor.mostrar_vendedor_editar", con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(New OracleParameter("vendedorid", OracleType.Number))
                cmd.Parameters.Add(New OracleParameter("nome", OracleType.VarChar, 100)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("nif", OracleType.VarChar, 10)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("tlf", OracleType.VarChar, 9)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("morada", OracleType.VarChar, 100)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("email", OracleType.VarChar, 100)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("password", OracleType.VarChar, 512)).Direction = ParameterDirection.Output
                cmd.Parameters("vendedorid").Value = Session("id_vendedor")
                con.Open()
                Try
                    cmd.ExecuteReader()
                    TextBox_nome.Text = cmd.Parameters("nome").Value
                    TextBox_nif.Text = cmd.Parameters("nif").Value
                    TextBox_tlf.Text = cmd.Parameters("tlf").Value
                    TextBox_morada.Text = cmd.Parameters("morada").Value
                    TextBox_email.Text = cmd.Parameters("email").Value
                    TextBox_password.Text = cmd.Parameters("password").Value

                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()

            End Using
        End If

        If TextBox_nome.Text = "" Or TextBox_nif.Text = "" Or TextBox_tlf.Text = "" Or TextBox_morada.Text = "" Or TextBox_email.Text = "" Or TextBox_password.Text = "" Then
            Button1.Visible = False
        End If


    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
            Dim cmd As New OracleCommand("pack_vendedor.editar_vendedor", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New OracleParameter("idvendedor", OracleType.Number))
            cmd.Parameters.Add(New OracleParameter("nome", OracleType.VarChar))
            cmd.Parameters.Add(New OracleParameter("nif", OracleType.VarChar))
            cmd.Parameters.Add(New OracleParameter("tlf", OracleType.VarChar))
            cmd.Parameters.Add(New OracleParameter("morada", OracleType.VarChar))
            cmd.Parameters.Add(New OracleParameter("email", OracleType.VarChar))
            cmd.Parameters.Add(New OracleParameter("password", OracleType.VarChar))
            cmd.Parameters("idvendedor").Value = Session("id_vendedor")
            cmd.Parameters("nome").Value = TextBox_nome.Text
            cmd.Parameters("nif").Value = TextBox_nif.Text
            cmd.Parameters("tlf").Value = TextBox_tlf.Text
            cmd.Parameters("morada").Value = TextBox_morada.Text
            cmd.Parameters("email").Value = TextBox_email.Text
            cmd.Parameters("password").Value = TextBox_password.Text
            con.Open()
            Try
                cmd.ExecuteReader()
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()

        End Using
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("mostrar_dados_vendedor.aspx")
    End Sub
End Class
