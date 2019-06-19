using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPIC.View.AdministratorViews
{
    public partial class VerComprobante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            llenarCampos(id);
            reservacion.Text = "Reservación número " + id.ToString();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reservaciones.aspx");
        }

        protected void llenarCampos(int id)
        {
            try
            {
                SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
                sqlConnection.Open();

                SqlCommand sqlCommand = new SqlCommand("getComprobanteById", sqlConnection);
                sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;

                SqlParameter parameter = new SqlParameter()
                {
                    ParameterName = "@id",
                    Value = id
                };

                sqlCommand.Parameters.Add(parameter);

                byte[] bytes = (byte[])sqlCommand.ExecuteScalar();

                string strBase64 = Convert.ToBase64String(bytes);

                Image.ImageUrl = "data:Image/png;base64," + strBase64;
            }catch(Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('La reservación no posee comprobante');", true);
            }
            
        }
    }
}