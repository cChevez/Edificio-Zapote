using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPIC.View.AdministratorViews
{
    public partial class RegistrarCursos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregarCurso_Click(object sender, EventArgs e)
        {
            string name, description, path;
            if (!string.IsNullOrEmpty(FileUpload.FileName) && nombre.Text.Length > 0 && descripcion.Text.Length > 0)
            {
                path = System.IO.Path.GetFileName(FileUpload.PostedFile.FileName);
                if (FileUpload.PostedFile.ContentLength <= 4000000)
                {
                    if (System.IO.Path.GetExtension(path).ToLower().Equals(".png") || System.IO.Path.GetExtension(path).ToLower().Equals(".jpg"))
                    {
                        name = nombre.Text.Replace("'", "");
                        description = descripcion.Text.Replace("'", "");
                        Model.ConsultasDB.SubirCurso(name, FileUpload.FileBytes, description);

                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Se ha agregado correctamente');", true);
                        Response.Redirect("RegistrarCursos.aspx");
                    }
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Por favor ingrese una imagen y llene todos los campos');", true);
            }
        }
    }
}