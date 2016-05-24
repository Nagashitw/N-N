Imports System.Data
Imports System.Data.OracleClient
Partial Class detalhes_produto
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If System.Web.HttpContext.Current.Session("id_cliente") Is Nothing Then
            HyperLink_areacliente.Visible = False
            HyperLink_carrinho.Visible = False
            HyperLink_loja.Visible = False
            HyperLink_logout.Visible = False
        Else
            HyperLink_logincliente.Visible = False
            HyperLink_loginvendedor.Visible = False
            HyperLink_registarcliente.Visible = False
        End If

        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
            Dim id_produto As String
            id_produto = Request.QueryString("id")
            Dim cmd As New OracleCommand("pack_produto.mostrar_produto_detalhe", con)
            cmd.CommandType = CommandType.StoredProcedure
            Dim ds As New DataSet
            ds.Clear()
            cmd.Parameters.Add(New OracleParameter("lista", OracleType.Cursor)).Direction = ParameterDirection.Output
            cmd.Parameters.Add(New OracleParameter("prod_id", OracleType.Number))
            cmd.Parameters("prod_id").Value = id_produto
            con.Open()
            Try
                Dim myDa As New OracleDataAdapter(cmd)
                myDa.Fill(ds)
                grelha_produto.DataSource = ds
                grelha_produto.DataBind()
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()
        End Using
    End Sub
End Class
