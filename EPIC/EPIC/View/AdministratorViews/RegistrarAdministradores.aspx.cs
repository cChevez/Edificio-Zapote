using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPIC.View
{
    public partial class RegistrarAdministradores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblNombreUsuario.Text = "Bienvenido(a)" + Session["nombreUsuario"].ToString();

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            string nNombre, nApellido, nEmail, nPassword;
            nNombre = nombre.Text.Replace("'", "");
            nApellido = apellido.Text.Replace("'", "");
            nEmail = correo.Text.Replace("'", "");
            nPassword = contrasena.Text.Replace("'", "");

            Model.ConsultasDB.RegistrarAdministrador(nNombre, nApellido, nEmail, nPassword);
            Model.EnviarCorreo.RegistrarAdministrador(nEmail, nNombre + " " + nApellido, nPassword);

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Se ha registrado exitosamente');", true);

            nombre.Text = "";
            apellido.Text = "";
            correo.Text = "";
            contrasena.Text = "";
        }
    }
}