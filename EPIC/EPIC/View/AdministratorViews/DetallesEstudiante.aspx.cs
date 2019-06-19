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
    public partial class DetallesEstudiante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            llenarCampos(id);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("VerEstudiantes.aspx");
        }

        protected void llenarCampos(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("select nombre, apellido, email from Estudiante where id = '" + id + "'", sqlConnection);
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            while (sqlDataReader.Read())
            {
                nombre.Text = sqlDataReader["nombre"].ToString();
                apellido.Text = sqlDataReader["apellido"].ToString();
                correo.Text = sqlDataReader["email"].ToString();
            }
            sqlDataReader.Close();
        }
    }
}