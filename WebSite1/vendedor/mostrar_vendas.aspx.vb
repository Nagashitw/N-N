Imports System.Data
Imports System.Data.OracleClient
Partial Class mostrar_vendas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If System.Web.HttpContext.Current.Session("id_vendedor") Is Nothing Then
            Response.Redirect("login_vendedor.aspx")
        End If


        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
            Dim cmd As New OracleCommand("pack_vendas.mostrar_items_pagos", con)
            cmd.CommandType = CommandType.StoredProcedure
            Dim ds As New DataSet
            ds.Clear()
            cmd.Parameters.Add(New OracleParameter("lista", OracleType.Cursor)).Direction = ParameterDirection.Output
            cmd.Parameters.Add(New OracleParameter("vendedor", OracleType.Number))
            cmd.Parameters("vendedor").Value = Session("id_vendedor").ToString
            con.Open()
            Try
                Dim myDa As New OracleDataAdapter(cmd)
                myDa.Fill(ds)
                grelha_pagos.DataSource = ds
                grelha_pagos.DataBind()
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()

            Dim cmd2 As New OracleCommand("pack_vendas.mostrar_items_por_pagar", con)
            cmd2.CommandType = CommandType.StoredProcedure
            Dim ds2 As New DataSet
            ds2.Clear()
            cmd2.Parameters.Add(New OracleParameter("lista", OracleType.Cursor)).Direction = ParameterDirection.Output
            cmd2.Parameters.Add(New OracleParameter("vendedor", OracleType.Number))
            cmd2.Parameters("vendedor").Value = Session("id_vendedor").ToString
            con.Open()
            Try
                Dim myDa2 As New OracleDataAdapter(cmd2)
                myDa2.Fill(ds2)
                grelha_por_pagar.DataSource = ds2
                grelha_por_pagar.DataBind()
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()

            Dim cmd3 As New OracleCommand("pack_vendas.mostrar_items_cancelados", con)
            cmd3.CommandType = CommandType.StoredProcedure
            Dim ds3 As New DataSet
            ds3.Clear()
            cmd3.Parameters.Add(New OracleParameter("lista", OracleType.Cursor)).Direction = ParameterDirection.Output
            cmd3.Parameters.Add(New OracleParameter("vendedor", OracleType.Number))
            cmd3.Parameters("vendedor").Value = Session("id_vendedor").ToString
            con.Open()
            Try
                Dim myDa3 As New OracleDataAdapter(cmd3)
                myDa3.Fill(ds3)
                grelha_cancelados.DataSource = ds3
                grelha_cancelados.DataBind()
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()

        End Using
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("Default.aspx")
    End Sub
End Class
