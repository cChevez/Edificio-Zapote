using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading;

namespace EPIC
{
    public partial class Alquiler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
        }

        protected void listAulas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listAulas.SelectedValue == "0")
            {
                Label10.Visible = false;
                Label12.Visible = false;
                Label14.Visible = false;
                aula1.Visible = false;
                aula2.Visible = false;
                aula3.Visible = false;

            } else if (listAulas.SelectedValue == "1")
            {
                Label10.Visible = true;
                Label12.Visible = false;
                Label14.Visible = false;
                aula1.Visible = true;
                aula2.Visible = false;
                aula3.Visible = false;
            } else if (listAulas.SelectedValue == "2")
            {
                Label10.Visible = true;
                Label12.Visible = true;
                Label14.Visible = false;
                aula1.Visible = true;
                aula2.Visible = true;
                aula3.Visible = false;
            } else if (listAulas.SelectedValue == "3")
            {
                Label10.Visible = true;
                Label12.Visible = true;
                Label14.Visible = true;
                aula1.Visible = true;
                aula2.Visible = true;
                aula3.Visible = true;
            }

        }

        protected void listLabs_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listLabs.SelectedValue == "0")
            {
                Label11.Visible = false;
                Label13.Visible = false;
                lab1.Visible = false;
                lab2.Visible = false;
            }
            if (listLabs.SelectedValue == "B1")
            {
                Label11.Visible = true;
                Label13.Visible = false;
                lab1.Visible = true;
                lab2.Visible = false;
            }
            if (listLabs.SelectedValue == "B2")
            {
                Label11.Visible = false;
                Label13.Visible = true;
                lab1.Visible = false;
                lab2.Visible = true;
            }
            if (listLabs.SelectedValue == "2")
            {
                Label11.Visible = true;
                Label13.Visible = true;
                lab1.Visible = true;
                lab2.Visible = true;
            }
        }

        protected void agregarHorario_Click(object sender, EventArgs e)
        {
            string dia = diaReserva.Text;
            string inicio = horaInicio.Text;
            string final = horaFinal.Text;
            
        }

        protected void enviar_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            Boolean enviado = false; ;
            
            string fechaForm, nombreV, empresaV, cedulaV, correoV, telefonoV, nombreActividadV, fechaInicioV, fechaFinalV, observacionesV;
            string dia, mes, anno;

            if (Page.IsValid)
            {
                DateTime today = DateTime.Today;
                fechaForm = today.ToString("MM-dd-yyyy");
                nombreV = nombre.Text.Replace("'", "");
                empresaV = empresa.Text.Replace("'", "");
                cedulaV = cedula.Text.Replace("'", "");
                correoV = correo.Text.Replace("'", "");
                telefonoV = telefono.Text.Replace("'", "");
                nombreActividadV = nombreActividad.Text.Replace("'", "");
                dia = fechaInicio.Text.Replace("'", "").Substring(0, 2);
                mes = fechaInicio.Text.Replace("'", "").Substring(3, 2);
                anno = fechaInicio.Text.Replace("'", "").Substring(6, 4);
                fechaInicioV = (mes+"-"+dia+"-"+anno).Replace("'", "");
                dia = fechaFinal.Text.Replace("'", "").Substring(0, 2);
                mes = fechaFinal.Text.Replace("'", "").Substring(3, 2);
                anno = fechaFinal.Text.Replace("'", "").Substring(6, 4);
                fechaFinalV = (mes + "-" + dia + "-" + anno).Replace("'", "");
                observacionesV = observaciones.Text.Replace("'", "");
                
                int participantes = 10;

                try
                {
                    sqlConnection.Open();
                    SqlCommand sqlCommand = new SqlCommand("Execute insertarTotal '" + fechaForm.Replace("'", "") + "','" + nombreV + "','" + empresaV + "','" + cedulaV + "','" + correoV + "','" + telefonoV + "','" + nombreActividadV + "','" + fechaInicioV + "','" + fechaFinalV + "','" + observacionesV + "','" + participantes + "'", sqlConnection);

                    sqlCommand.ExecuteNonQuery();

                    sqlConnection.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Reservación creada');", true);

                    enviado = true;
                }
                catch(Exception ex)
                {
                    SqlCommand sqlCommand = new SqlCommand("Delete from HorasSolicitudTable", sqlConnection);

                    sqlCommand.ExecuteNonQuery();

                    sqlConnection.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);

                    enviado = false;
                }
            }
            if (enviado)
            {
                Thread.Sleep(2000);
                Response.Redirect("~/Index.aspx");
            }
        }
    }
}