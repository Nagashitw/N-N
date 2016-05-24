Imports System.Data
Imports System.Data.OracleClient
Partial Class admin_editar_taxas
    Inherits System.Web.UI.Page

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("Default.aspx")
    End Sub

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
            TextBox_taxa.Text = ""
        End If




    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())

            Dim idvend As String
            idvend = DropDownList1.SelectedItem.Value.ToString
            Dim cmd2 As New OracleCommand("devolve_taxa", con)
            cmd2.CommandType = CommandType.StoredProcedure
            cmd2.Parameters.Add(New OracleParameter("valor_taxa", OracleType.Number)).Direction = ParameterDirection.ReturnValue
            cmd2.Parameters.Add(New OracleParameter("vend", OracleType.VarChar))
            cmd2.Parameters("vend").Value = idvend
            con.Open()
            Try
                cmd2.ExecuteReader()
                TextBox_taxa.Text = cmd2.Parameters("valor_taxa").Value


            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()

        End Using
    End Sub

    Protected Sub Button_atualizartaxa_Click(sender As Object, e As EventArgs) Handles Button_atualizartaxa.Click
        Using con As New OracleConnection(ConfigurationManager.ConnectionStrings("conexao").ConnectionString.ToString())
            Dim cmd As New OracleCommand("pack_vendedor.atualiza_taxa", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add(New OracleParameter("idvendedor", OracleType.Number))
            cmd.Parameters.Add(New OracleParameter("novataxa", OracleType.Float))
            cmd.Parameters("idvendedor").Value = DropDownList1.SelectedItem.Value.ToString
            cmd.Parameters("novataxa").Value = TextBox_taxa.Text
            con.Open()
            Try
                cmd.ExecuteReader()
            Catch ex As OracleException
                Label_erro.Text = ex.Message
            End Try
            con.Close()

        End Using
    End Sub
End Class
