using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPIC.View
{
    public partial class VerAdministradores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblNombreUsuario.Text = "Bienvenido(a)" + Session["nombreUsuario"].ToString();

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string id = idAdministrador.SelectedValue;

            Model.ConsultasDB.EliminarAdministrador(id);
            
            Response.Redirect("VerAdministradores.aspx");
        }
    }
}