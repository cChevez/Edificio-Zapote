using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPIC.View
{
    public partial class RegistrarEstudiantes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblNombreUsuario.Text = "Bienvenido(a)" + Session["nombreUsuario"].ToString();

        }

        protected void btnAgregarHorario_Click(object sender, EventArgs e)
        {
            string dia, inicio, final;

            dia = diaSemana.SelectedValue;
            inicio = horaInicio.Text.Replace("'", "");
            final = horaFinal.Text.Replace("'", "");
            try
            {
                Model.ConsultasDB.AgregarHorarioEstudiante(dia, inicio, final);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('No se puede ingresar el horario seleccionado," +
                    " verifique que no se haya ingresado anteriormente y vuelva a intentarlo');", true);
            }
            diaSemana.Text = "";
            horaInicio.Text = "";
            horaFinal.Text = "";
            this.GridView1.DataBind();

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            string name, last_name, email;

            name = nombre.Text.Replace("'", "");
            last_name = apellido.Text.Replace("'", "");
            email = correo.Text.Replace("'", "");
            int hasHours = Model.ConsultasDB.VerificarHorasEstudiante();
            if (hasHours > 0)
            {
                try
                {
                    Model.ConsultasDB.AgregarEstudiante(name, last_name, email);
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Estudiante registrado exitosamente');", true);
                    Model.ConsultasDB.BorrarDatosTablaHorariosEstudiantes();

                    Response.Redirect("RegistrarEstudiantes.aspx");
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Ya existe un estudiante registrado con ese correo');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Agregue al menos una hora');", true);
            }
        }
    }
}