Imports System.Data
Imports System.Data.OracleClient
Partial Class registar_cliente
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If System.Web.HttpContext.Current.Session("id_encomenda") Is Nothing Then
            Response.Redirect("Login_vendedor.aspx")
        End If
        If (Not IsPostBack) Then
            Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
                Dim cmd As New OracleCommand("pack_encomenda.mostrar_encomenda", con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(New OracleParameter("encomendaid", OracleType.Number))
                cmd.Parameters.Add(New OracleParameter("data", OracleType.DateTime, 100)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("datare", OracleType.DateTime, 10)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("quantidades", OracleType.Number, 9)).Direction = ParameterDirection.Output
                cmd.Parameters("encomendaid").Value = Session("id_encomenda")
                con.Open()
                Try
                    cmd.ExecuteReader()
                    TextBox_data.Text = cmd.Parameters("data").Value
                    TextBox_data_re.Text = cmd.Parameters("datare").Value
                    TextBox_quantidades.Text = cmd.Parameters("quantidades").Value

                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()

            End Using
        End If

        If TextBox_data.Text = "" Or TextBox_data_re.Text = "" Or TextBox_quantidades.Text = "" Then
            Button1.Visible = False
        End If


    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
            Dim cmd As New OracleCommand("pack_encomendas.inserir_encomenda", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New OracleParameter("id_encomenda", OracleType.Number))
            cmd.Parameters.Add(New OracleParameter("data", OracleType.DateTime))
            cmd.Parameters.Add(New OracleParameter("datare", OracleType.DateTime))
            cmd.Parameters.Add(New OracleParameter("quantidades", OracleType.VarChar))


            cmd.Parameters("id_encomenda").Value = Session("id_encomenda")
            cmd.Parameters("data").Value = TextBox_data.Text
            cmd.Parameters("datare").Value = TextBox_data_re.Text
            cmd.Parameters("quantidades").Value = TextBox_quantidades.Text


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
        Response.Redirect("mostrar_dados_encomenda.aspx")
    End Sub
End Class
