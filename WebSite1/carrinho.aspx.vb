Imports System.Data
Imports System.Data.OracleClient

Partial Class carrinho
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If System.Web.HttpContext.Current.Session("id_cliente") Is Nothing Then
            Response.Redirect("Login.aspx")
        End If

        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
            Dim id_cliente As String = Session("id_cliente")

            If Request.QueryString("id") <> "" Then
                Dim cmd As New OracleCommand("pack_carrinho.verifica_existencia", con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(New OracleParameter("prod_id", OracleType.Number))
                cmd.Parameters.Add(New OracleParameter("cli_id", OracleType.Number))
                cmd.Parameters("prod_id").Value = Request.QueryString("id")
                cmd.Parameters("cli_id").Value = id_cliente
                con.Open()
                Try
                    cmd.ExecuteNonQuery()
                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()
                Response.Redirect("carrinho.aspx")
            End If

            Dim cmd2 As New OracleCommand("select * from vista_carrinho where id_cliente='" + id_cliente + "'", con)
            cmd2.CommandType = CommandType.Text
            Dim ds2 As New DataSet
            ds2.Clear()
            con.Open()
            Try
                Dim myDa2 As New OracleDataAdapter(cmd2)
                myDa2.Fill(ds2)
                grelha_carrinho.DataSource = ds2
                grelha_carrinho.DataBind()
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()

            If (Not IsPostBack) Then
                Dim cmd3 As New OracleCommand("select distinct NOME_TIPOPAGAMENTO, id_tipopagamento from TIPOPAGAMENTO", con)
                cmd3.CommandType = CommandType.Text
                Dim ds3 As New DataSet
                ds3.Clear()
                con.Open()
                Try
                    Dim myDa3 As New OracleDataAdapter(cmd3)
                    myDa3.Fill(ds3)
                    DropDownList_pagamento.DataSource = ds3
                    DropDownList_pagamento.DataTextField = "NOME_TIPOPAGAMENTO"
                    DropDownList_pagamento.DataValueField = "ID_TIPOPAGAMENTO"
                    DropDownList_pagamento.DataBind()
                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()
            End If


            Dim cmd4 As New OracleCommand("total_carrinho", con)
            cmd4.CommandType = CommandType.StoredProcedure
            cmd4.Parameters.Add(New OracleParameter("valor", OracleType.Number)).Direction = ParameterDirection.ReturnValue
            cmd4.Parameters.Add(New OracleParameter("user", OracleType.VarChar))
            cmd4.Parameters("user").Value = id_cliente

            con.Open()
            Try
                cmd4.ExecuteNonQuery()
                TextBox_total_carrinho.Text = cmd4.Parameters("valor").Value
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()

        End Using
        If TextBox_total_carrinho.Text = "0" Then
            Button_finalizar_compra.Visible = False
        End If

    End Sub


    Protected Sub grelha_carrinho_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grelha_carrinho.RowCommand
        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())

            If (e.CommandName = "decrease") Then
                Dim index As Integer = Convert.ToInt32(e.CommandArgument)
                Dim row As GridViewRow = grelha_carrinho.Rows(index)
                Dim idcarrinho As Integer = Convert.ToInt32(grelha_carrinho.DataKeys(row.RowIndex).Value)

                Dim cmd As New OracleCommand("pack_carrinho.decrementa_carrinho", con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(New OracleParameter("idcar", OracleType.Number))
                cmd.Parameters("idcar").Value = idcarrinho
                con.Open()
                Try
                    cmd.ExecuteNonQuery()
                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()
                Response.Redirect("carrinho.aspx")
            ElseIf (e.CommandName = "increase") Then
                Dim index As Integer = Convert.ToInt32(e.CommandArgument)
                Dim row As GridViewRow = grelha_carrinho.Rows(index)
                Dim idcarrinho As Integer = Convert.ToInt32(grelha_carrinho.DataKeys(row.RowIndex).Value)

                Dim cmd As New OracleCommand("pack_carrinho.incrementa_carrinho", con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(New OracleParameter("idcar", OracleType.Number))
                cmd.Parameters("idcar").Value = idcarrinho
                con.Open()
                Try
                    cmd.ExecuteNonQuery()
                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()
                Response.Redirect("carrinho.aspx")
            ElseIf (e.CommandName = "remove") Then
                Dim index As Integer = Convert.ToInt32(e.CommandArgument)
                Dim row As GridViewRow = grelha_carrinho.Rows(index)
                Dim idcarrinho As Integer = Convert.ToInt32(grelha_carrinho.DataKeys(row.RowIndex).Value)

                Dim cmd As New OracleCommand("pack_carrinho.remove_item_carrinho", con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.Add(New OracleParameter("idcar", OracleType.Number))
                cmd.Parameters("idcar").Value = idcarrinho
                con.Open()
                Try
                    cmd.ExecuteNonQuery()
                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()
                Response.Redirect("carrinho.aspx")
            End If
        End Using
    End Sub

    Protected Sub Button_finalizar_compra_Click(sender As Object, e As EventArgs) Handles Button_finalizar_compra.Click
        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
            Dim cmd As New OracleCommand("pack_finaliza_compra.criar_venda", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New OracleParameter("tpagamento", OracleType.Number))
            cmd.Parameters.Add(New OracleParameter("cli_id", OracleType.Number))
            cmd.Parameters.Add(New OracleParameter("total", OracleType.Number))

            cmd.Parameters("tpagamento").Value = DropDownList_pagamento.SelectedItem.Value
            cmd.Parameters("cli_id").Value = Session("id_cliente").ToString
            cmd.Parameters("total").Value = TextBox_total_carrinho.Text
            con.Open()
            Try
                cmd.ExecuteNonQuery()
                Response.Write("<script> alert('Compra efetuada com sucesso vai ser redirecionado para a página pessoal');</script>")
                Response.AddHeader("REFRESH", "0;URL=mostrar_dados_cliente.aspx")
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()
        End Using
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("loja_produtos.aspx")
    End Sub
End Class
