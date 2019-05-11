using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPIC.View
{
    public partial class Reservaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCambiarEstado_Click(object sender, EventArgs e)
        {
            string codigoAntiguo = codigoReservacion.SelectedValue.Replace("'", "");
            string codigoNuevo = codigoEstado.SelectedValue.Replace("'", "");

            Model.ConsultasDB.ActualizarEstado(codigoAntiguo, codigoNuevo);

            Response.Redirect("Reservaciones.aspx");
        }
    }
}