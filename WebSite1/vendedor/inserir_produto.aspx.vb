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
                Dim cmd As New OracleCommand("select distinct nome_fornecedor, id_fornecedor from fornecedor", con)
                cmd.CommandType = CommandType.Text
                Dim ds As New DataSet
                ds.Clear()
                con.Open()
                Try
                    Dim myDa As New OracleDataAdapter(cmd)
                    myDa.Fill(ds)
                    DropDownList1.DataSource = ds
                    DropDownList1.DataTextField = "nome_fornecedor"
                    DropDownList1.DataValueField = "id_fornecedor"
                    DropDownList1.DataBind()
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
            Dim cmd As New OracleCommand("pack_produto.inserir_produto", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New OracleParameter("idvend", OracleType.Number))
            cmd.Parameters.Add(New OracleParameter("idforn", OracleType.Number))
            cmd.Parameters.Add(New OracleParameter("nome", OracleType.VarChar))
            cmd.Parameters.Add(New OracleParameter("prec", OracleType.Number))
            cmd.Parameters.Add(New OracleParameter("descr", OracleType.Clob))
            cmd.Parameters.Add(New OracleParameter("st", OracleType.Number))
            cmd.Parameters.Add(New OracleParameter("cat", OracleType.VarChar))

            cmd.Parameters("idvend").Value = Session("id_vendedor")
            cmd.Parameters("idforn").Value = DropDownList1.SelectedValue.ToString
            cmd.Parameters("nome").Value = TextBox_nome.Text
            cmd.Parameters("prec").Value = TextBox_preco.Text
            cmd.Parameters("descr").Value = TextBox_descricao.Text
            cmd.Parameters("st").Value = TextBox_stock.Text
            cmd.Parameters("cat").Value = TextBox_categoria.Text

            con.Open()
            Try
                    cmd.ExecuteReader()
                    Response.Write("<script> alert('Produto inserido com sucesso!');</script>")
                    Response.AddHeader("REFRESH", "0;URL=Default.aspx")
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()

            End Using
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("Default.aspx")
    End Sub
End Class
