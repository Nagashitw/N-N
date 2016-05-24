Imports System.Data
Imports System.Data.OracleClient
Partial Class mostrar_dados_cliente
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If System.Web.HttpContext.Current.Session("id_cliente") Is Nothing Then
            Response.Redirect("Login.aspx")
        End If

        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
            Dim cmd As New OracleCommand("pack_cliente.mostrar_cliente", con)
            cmd.CommandType = CommandType.StoredProcedure
            Dim ds As New DataSet
            ds.Clear()
            cmd.Parameters.Add(New OracleParameter("lista", OracleType.Cursor)).Direction = ParameterDirection.Output
            cmd.Parameters.Add(New OracleParameter("clienteid", OracleType.Number))
            cmd.Parameters("clienteid").Value = Session("id_cliente")
            con.Open()
            Try
                Dim myDa As New OracleDataAdapter(cmd)
                myDa.Fill(ds)
                dgprincipal.DataSource = ds
                dgprincipal.DataBind()
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()

            Dim cmd2 As New OracleCommand("pack_vendas.mostrar_vendas", con)
            cmd2.CommandType = CommandType.StoredProcedure
            Dim ds2 As New DataSet
            ds2.Clear()
            cmd2.Parameters.Add(New OracleParameter("lista", OracleType.Cursor)).Direction = ParameterDirection.Output
            cmd2.Parameters.Add(New OracleParameter("clienteid", OracleType.Number))
            cmd2.Parameters("clienteid").Value = Session("id_cliente")
            con.Open()
            Try
                Dim myDa2 As New OracleDataAdapter(cmd2)
                myDa2.Fill(ds2)
                grelha_compras.DataSource = ds2
                grelha_compras.DataBind()
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()



        End Using
    End Sub
End Class
