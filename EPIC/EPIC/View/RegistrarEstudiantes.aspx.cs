using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPIC.View
{
    public partial class RegistrarEstudiantes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregarHorario_Click(object sender, EventArgs e)
        {
            string dia, inicio, final;

            dia = diaSemana.SelectedValue;
            inicio = horaInicio.Text.Replace("'", "");
            final = horaFinal.Text.Replace("'", "");
            
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {

        }
    }
}