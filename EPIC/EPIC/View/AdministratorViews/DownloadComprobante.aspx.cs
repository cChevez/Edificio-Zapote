using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPIC.View.AdministratorViews
{
    public partial class DownloadComprobante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);

            Model.Archivo archivo = Model.ConsultasDB.ObtenerComprobante(id);

            Response.Clear();

            Response.AddHeader("content-disposition", string.Format("attachment;filename={0}", "Reservación número " + archivo.Id + ".jpg"));
            Response.ContentType = "application/octet-stream";

            Response.BinaryWrite(archivo.ContenidoArchivo);
            Response.End();

        }
    }
}