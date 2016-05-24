Imports System.Data
Imports System.Data.OracleClient
Partial Class vendedor_mostrar_dados_entrega
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("mostrar_vendas.aspx")

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If System.Web.HttpContext.Current.Session("id_vendedor") Is Nothing Then
            Response.Redirect("login_vendedor.aspx")
        End If


        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
            Dim id_cliente As String
            id_cliente = Request.QueryString("id")
            Dim cmd As New OracleCommand("pack_cliente.mostrar_cliente", con)
            cmd.CommandType = CommandType.StoredProcedure
            Dim ds As New DataSet
            ds.Clear()
            cmd.Parameters.Add(New OracleParameter("lista", OracleType.Cursor)).Direction = ParameterDirection.Output
            cmd.Parameters.Add(New OracleParameter("clienteid", OracleType.Number))
            cmd.Parameters("clienteid").Value = id_cliente
            con.Open()
            Try
                Dim myDa As New OracleDataAdapter(cmd)
                myDa.Fill(ds)
                GridView1.DataSource = ds
                GridView1.DataBind()
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()
        End Using
    End Sub
End Class
