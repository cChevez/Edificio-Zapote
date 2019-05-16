using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPIC.View
{
    public partial class Download : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);

            Model.Archivo archivo = Model.ConsultasDB.ObtenerArchivo(id);

            Response.Clear();

            Response.AddHeader("content-disposition", string.Format("attachment;filename={0}", archivo.Nombre + ".pdf"));
            Response.ContentType = "application/octet-stream";

            Response.BinaryWrite(archivo.ContenidoArchivo);
            Response.End();
        }
    }
}