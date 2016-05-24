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
                Dim id_produto As String
                id_produto = Request.QueryString("id")
                Dim cmd As New OracleCommand("pack_produto.mostrar_produto_editar", con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(New OracleParameter("idprod", OracleType.Number))
                cmd.Parameters.Add(New OracleParameter("fornecedor", OracleType.VarChar, 100)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("nome", OracleType.VarChar, 200)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("prec", OracleType.Number)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("descr", OracleType.VarChar, 400)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("st", OracleType.Number)).Direction = ParameterDirection.Output
                cmd.Parameters.Add(New OracleParameter("cat", OracleType.VarChar, 200)).Direction = ParameterDirection.Output
                cmd.Parameters("idprod").Value = id_produto
                con.Open()
                Try
                    cmd.ExecuteReader()
                    TextBox_nome.Text = cmd.Parameters("nome").Value
                    TextBox_preco.Text = cmd.Parameters("prec").Value
                    TextBox_descricao.Text = cmd.Parameters("descr").Value
                    TextBox_stock.Text = cmd.Parameters("st").Value
                    TextBox_categoria.Text = cmd.Parameters("cat").Value
                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()

            End Using
        End If


    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If TextBox_nome.Text = "" Or TextBox_preco.Text = "" Or TextBox_descricao.Text = "" Or TextBox_stock.Text = "" Or TextBox_categoria.Text = "" Then
            Label_erro.Text = "Preencha todos os campos"
        Else

            Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
                Dim cmd As New OracleCommand("pack_produto.editar_produto", con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(New OracleParameter("idprod", OracleType.Number))
                cmd.Parameters.Add(New OracleParameter("nome", OracleType.VarChar))
                cmd.Parameters.Add(New OracleParameter("prec", OracleType.Number))
                cmd.Parameters.Add(New OracleParameter("descr", OracleType.VarChar))
                cmd.Parameters.Add(New OracleParameter("st", OracleType.Number))
                cmd.Parameters.Add(New OracleParameter("cat", OracleType.VarChar))

                cmd.Parameters("idprod").Value = Request.QueryString("id")
                cmd.Parameters("nome").Value = TextBox_nome.Text
                cmd.Parameters("prec").Value = TextBox_preco.Text
                cmd.Parameters("descr").Value = TextBox_descricao.Text
                cmd.Parameters("st").Value = TextBox_stock.Text
                cmd.Parameters("cat").Value = TextBox_categoria.Text

                con.Open()
                Try
                    cmd.ExecuteReader()
                    Label_erro.Text = "Produto editado com sucesso!"
                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()

            End Using
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("gerir_produtos.aspx")
    End Sub
End Class
