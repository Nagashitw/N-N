Imports System.Data
Imports System.Data.OracleClient
Partial Class loja_produtos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If System.Web.HttpContext.Current.Session("id_cliente") Is Nothing Then
            Response.Redirect("Login.aspx")
        End If

        If (Not IsPostBack) Then

            Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
                Dim cmd As New OracleCommand("select distinct nomevendedor from vendedor", con)
                cmd.CommandType = CommandType.Text
                Dim ds As New DataSet
                ds.Clear()
                con.Open()
                Try
                    Dim myDa As New OracleDataAdapter(cmd)
                    myDa.Fill(ds)
                    DropDownList1.DataSource = ds
                    DropDownList1.DataTextField = "nomevendedor"
                    DropDownList1.DataValueField = "nomevendedor"
                    DropDownList1.DataBind()
                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()

                Dim cmd2 As New OracleCommand("select distinct categoria from produto", con)
                cmd2.CommandType = CommandType.Text
                Dim ds2 As New DataSet
                ds2.Clear()
                con.Open()
                Try
                    Dim myDa As New OracleDataAdapter(cmd2)
                    myDa.Fill(ds2)
                    DropDownList2.DataSource = ds2
                    DropDownList2.DataTextField = "categoria"
                    DropDownList2.DataValueField = "categoria"
                    DropDownList2.DataBind()
                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()



                Dim cmd3 As New OracleCommand("pack_produto.mostrar_produto_loja", con)
                cmd3.CommandType = CommandType.StoredProcedure
                Dim ds3 As New DataSet
                ds3.Clear()
                cmd3.Parameters.Add(New OracleParameter("lista", OracleType.Cursor)).Direction = ParameterDirection.Output
                con.Open()
                Try
                    Dim myDa As New OracleDataAdapter(cmd3)
                    myDa.Fill(ds3)
                    grelha_produtos.DataSource = ds3
                    grelha_produtos.DataBind()
                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()


            End Using
        End If

    End Sub


    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
            Dim nomevendedor As String
            nomevendedor = DropDownList1.SelectedValue.ToString()
            Dim cmd2 As New OracleCommand("pack_produto.mostrar_produto_vendedor", con)
            cmd2.CommandType = CommandType.StoredProcedure
            Dim ds2 As New DataSet
            ds2.Clear()
            cmd2.Parameters.Add(New OracleParameter("lista", OracleType.Cursor)).Direction = ParameterDirection.Output
            cmd2.Parameters.Add(New OracleParameter("nome", OracleType.VarChar))
            cmd2.Parameters("nome").Value = nomevendedor
            con.Open()

            Try
                Dim myDa As New OracleDataAdapter(cmd2)
                myDa.Fill(ds2)
                grelha_produtos.DataSource = ds2
                grelha_produtos.DataBind()
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()
        End Using

    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList2.SelectedIndexChanged
        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
            Dim categoria As String
            categoria = DropDownList2.SelectedValue.ToString()
            Dim cmd2 As New OracleCommand("pack_produto.mostrar_produto_categoria", con)
            cmd2.CommandType = CommandType.StoredProcedure
            Dim ds2 As New DataSet
            ds2.Clear()
            cmd2.Parameters.Add(New OracleParameter("lista", OracleType.Cursor)).Direction = ParameterDirection.Output
            cmd2.Parameters.Add(New OracleParameter("cat", OracleType.VarChar))
            cmd2.Parameters("cat").Value = categoria
            con.Open()
            Try
                Dim myDa As New OracleDataAdapter(cmd2)
                myDa.Fill(ds2)
                grelha_produtos.DataSource = ds2
                grelha_produtos.DataBind()
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()
        End Using
    End Sub

    Protected Sub Button_remove_filtros_Click(sender As Object, e As EventArgs) Handles Button_remove_filtros.Click
        Response.Redirect("loja_produtos.aspx")
    End Sub
End Class
