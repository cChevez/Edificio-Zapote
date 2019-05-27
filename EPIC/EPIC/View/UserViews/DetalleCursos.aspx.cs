using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPIC.View.UserViews
{
    public partial class DetalleCursos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            llenarCampos(id);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("VerCursosCliente.aspx");
        }
        protected void llenarCampos(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("select nombre, descripcion from Cursos where id = '" + id + "'", sqlConnection);
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            while (sqlDataReader.Read())
            {
                nombre.Text = sqlDataReader["nombre"].ToString();
                descripcion.Text = sqlDataReader["descripcion"].ToString();
            }

            sqlDataReader.Close();

            sqlCommand = new SqlCommand("getImageById", sqlConnection);
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
        }
    }
}