using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPIC.View
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            string email = correo.Text.Replace("'", "");
            string password = contrasena.Text.Replace("'", "");
            string usuario = "";

            int resultado = Model.ConsultasDB.VerificarCredenciales(email, password);
            if (resultado == 1)
            {
                usuario = Model.ConsultasDB.ObtenerUsuario(email, password);
                Session["nombreUsuario"] = usuario;
                
                Response.Redirect("../AdministratorViews/IndexAdministrativo.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Correo o contraseña invalida');", true);
            }
        }
    }
}