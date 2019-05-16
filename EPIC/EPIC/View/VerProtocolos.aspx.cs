using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPIC.View
{
    public partial class VerProtocolos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string archivo = idArchivo.SelectedValue;
            Model.ConsultasDB.BorrarArchivo(archivo);
            Response.Redirect("VerProtocolos.aspx");
        }
    }
}