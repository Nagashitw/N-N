Imports System.Data
Imports System.Data.OracleClient
Partial Class vendedor_listar_encomendas
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If System.Web.HttpContext.Current.Session("id_vendedor") Is Nothing Then
            Response.Redirect("login_vendedor.aspx")
        End If

        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
            Dim id_produto As String
            Dim cmd As New OracleCommand("pack_encomendas.mostrar_encomenda_vendedor", con)
            cmd.CommandType = CommandType.StoredProcedure
            Dim ds As New DataSet
            ds.Clear()
            cmd.Parameters.Add(New OracleParameter("lista", OracleType.Cursor)).Direction = ParameterDirection.Output
            cmd.Parameters.Add(New OracleParameter("idvendedor", OracleType.VarChar))
            cmd.Parameters("idvendedor").Value = Session("id_vendedor")
            con.Open()
            Try
                Dim myDa As New OracleDataAdapter(cmd)
                myDa.Fill(ds)
                lista_encomenda.DataSource = ds
                lista_encomenda.DataBind()
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()
        End Using
    End Sub
End Class
