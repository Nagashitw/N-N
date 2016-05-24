Imports System.Data
Imports System.Data.OracleClient
Partial Class registar_cliente
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If System.Web.HttpContext.Current.Session("id_cliente") Is Nothing Then
            Response.Redirect("Login.aspx")
        End If
        If (Not IsPostBack) Then
            Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
                Dim cmd As New OracleCommand("pack_cliente.mostrar_cliente_editar", con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(New OracleParameter("clienteid", OracleType.Number))
                cmd.Parameters.Add(New OracleParameter("nome", OracleType.VarChar, 100)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("nif", OracleType.Number)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("tlf", OracleType.Number)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("tlm", OracleType.Number)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("email", OracleType.VarChar, 100)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("password", OracleType.VarChar, 512)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("morada", OracleType.VarChar, 100)).Direction = ParameterDirection.Output
                cmd.Parameters("clienteid").Value = Session("id_cliente")
                con.Open()
                Try
                    cmd.ExecuteReader()
                    TextBox_nome.Text = cmd.Parameters("nome").Value
                    TextBox_nif.Text = cmd.Parameters("nif").Value
                    TextBox_tlf.Text = cmd.Parameters("tlf").Value
                    TextBox_tlm.Text = cmd.Parameters("tlm").Value
                    TextBox_email.Text = cmd.Parameters("email").Value
                    TextBox_password.Text = cmd.Parameters("password").Value
                    TextBox_morada.Text = cmd.Parameters("morada").Value

                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()

            End Using
        End If

        If TextBox_nome.Text = "" Or TextBox_nif.Text = "" Or TextBox_tlf.Text = "" Or TextBox_tlm.Text = "" Or TextBox_email.Text = "" Or TextBox_password.Text = "" Or TextBox_morada.Text = "" Then
            Button1.Visible = False
        End If


    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
            Dim cmd As New OracleCommand("pack_cliente.editar_cliente", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New OracleParameter("id_cli", OracleType.Number))
            cmd.Parameters.Add(New OracleParameter("nome", OracleType.VarChar))
            cmd.Parameters.Add(New OracleParameter("nif", OracleType.Number))
            cmd.Parameters.Add(New OracleParameter("tlf", OracleType.Number))
            cmd.Parameters.Add(New OracleParameter("tlm", OracleType.Number))
            cmd.Parameters.Add(New OracleParameter("email", OracleType.VarChar))
            cmd.Parameters.Add(New OracleParameter("password", OracleType.VarChar))
            cmd.Parameters.Add(New OracleParameter("morada", OracleType.VarChar))
            cmd.Parameters("id_cli").Value = Session("id_cliente")
            cmd.Parameters("nome").Value = TextBox_nome.Text
            cmd.Parameters("nif").Value = TextBox_nif.Text
            cmd.Parameters("tlf").Value = TextBox_tlf.Text
            cmd.Parameters("tlm").Value = TextBox_tlm.Text
            cmd.Parameters("email").Value = TextBox_email.Text
            cmd.Parameters("password").Value = TextBox_password.Text
            cmd.Parameters("morada").Value = TextBox_morada.Text
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
        Response.Redirect("mostrar_dados_cliente.aspx")
    End Sub
End Class
