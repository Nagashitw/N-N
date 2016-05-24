Imports System.Data
Imports System.Data.OracleClient
Partial Class admin_listar_ganhos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If (Not IsPostBack) Then

            Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
                Dim cmd As New OracleCommand("select distinct nomevendedor, id_vendedor from vendedor", con)
                cmd.CommandType = CommandType.Text
                Dim ds As New DataSet
                ds.Clear()
                con.Open()
                Try
                    Dim myDa As New OracleDataAdapter(cmd)
                    myDa.Fill(ds)
                    DropDownList1.DataSource = ds
                    DropDownList1.DataTextField = "nomevendedor"
                    DropDownList1.DataValueField = "id_vendedor"
                    DropDownList1.DataBind()
                Catch ex As OracleException
                    Label_erro.Text = ex.Message
                End Try
                con.Close()
            End Using
            TextBox_ganhos.Text = ""
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
            Dim cmd4 As New OracleCommand("ganhos_taxados", con)
            cmd4.CommandType = CommandType.StoredProcedure
            cmd4.Parameters.Add(New OracleParameter("ganho_taxado", OracleType.Number)).Direction = ParameterDirection.ReturnValue
            cmd4.Parameters.Add(New OracleParameter("idvend", OracleType.Number))
            cmd4.Parameters("idvend").Value = DropDownList1.SelectedValue.ToString

            con.Open()
            Try
                cmd4.ExecuteNonQuery()
                TextBox_ganhos.Text = cmd4.Parameters("ganho_taxado").Value
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()

        End Using
    End Sub


End Class
