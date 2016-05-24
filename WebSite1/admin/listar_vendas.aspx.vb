Imports System.Data
Imports System.Data.OracleClient
Partial Class admin_listar_vendas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
            Dim cmd As New OracleCommand("pack_vendas.mostrar_vendas_por_pagar", con)
            cmd.CommandType = CommandType.StoredProcedure
            Dim ds As New DataSet
            ds.Clear()
            cmd.Parameters.Add(New OracleParameter("lista", OracleType.Cursor)).Direction = ParameterDirection.Output
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


            Dim cmd2 As New OracleCommand("pack_vendas.mostrar_vendas_pagas", con)
            cmd2.CommandType = CommandType.StoredProcedure
            Dim ds2 As New DataSet
            ds2.Clear()
            cmd2.Parameters.Add(New OracleParameter("lista", OracleType.Cursor)).Direction = ParameterDirection.Output
            con.Open()
            Try
                Dim myDa2 As New OracleDataAdapter(cmd2)
                myDa2.Fill(ds2)
                GridView2.DataSource = ds2
                GridView2.DataBind()
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()

            Dim cmd3 As New OracleCommand("pack_vendas.mostrar_vendas_canceladas", con)
            cmd3.CommandType = CommandType.StoredProcedure
            Dim ds3 As New DataSet
            ds3.Clear()
            cmd3.Parameters.Add(New OracleParameter("lista", OracleType.Cursor)).Direction = ParameterDirection.Output
            con.Open()
            Try
                Dim myDa3 As New OracleDataAdapter(cmd3)
                myDa3.Fill(ds3)
                GridView3.DataSource = ds3
                GridView3.DataBind()
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
