using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPIC.View
{
    public partial class RegistrarProtocolos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblNombreUsuario.Text = "Bienvenido(a)" + Session["nombreUsuario"].ToString();

        }

        protected void btnSubirArchivo_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(FileUpload.FileName) && nombre.Text.Length>0)
            {
                string path = System.IO.Path.GetFileName(FileUpload.PostedFile.FileName);
                if(FileUpload.PostedFile.ContentLength <= 4000000)
                {
                    if (System.IO.Path.GetExtension(path).ToLower().Equals(".pdf"))
                    {
                        string nombreArchivo = nombre.Text.Replace("'", "");
                        int size = FileUpload.PostedFile.ContentLength;
                        Model.ConsultasDB.SubirArchivo(nombreArchivo, FileUpload.FileBytes, size);

                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Se ha subido el archivo');", true);
                        nombre.Text = "";
                    }
                }
            }
        }
    }
}