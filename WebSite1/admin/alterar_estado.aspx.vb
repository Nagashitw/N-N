Imports System.Data
Imports System.Data.OracleClient
Partial Class admin_alterar_estado
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Label_venda.Text = Request.QueryString("id")

        If (Not IsPostBack) Then
            Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
                Dim cmd As New OracleCommand("select distinct NOME_TIPOESTADO, id_tipoestado from tipoestado order by id_tipoestado", con)
                cmd.CommandType = CommandType.Text
                Dim ds As New DataSet
                ds.Clear()
                con.Open()
                Try
                    Dim myDa As New OracleDataAdapter(cmd)
                    myDa.Fill(ds)
                    DropDownList1.DataSource = ds
                    DropDownList1.DataTextField = "NOME_TIPOESTADO"
                    DropDownList1.DataValueField = "id_tipoestado"
                    DropDownList1.DataBind()
                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()
            End Using
        End If
    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("listar_vendas.aspx")
    End Sub

   
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
            Dim cmd As New OracleCommand("pack_vendas.alterar_estado_venda", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New OracleParameter("venda", OracleType.Number))
            cmd.Parameters.Add(New OracleParameter("estado", OracleType.Number))
            cmd.Parameters("venda").Value = Request.QueryString("id")
            cmd.Parameters("estado").Value = DropDownList1.SelectedItem.Value.ToString
            con.Open()
            Try
                cmd.ExecuteReader()
                Label_erro.Text = "Alteração feita com sucesso!"
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()

        End Using
    End Sub
End Class
