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
    public partial class DetalleReservacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            llenarCampos(id);
        }

        protected void llenarCampos(int id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("select nombreSolicitante, nombreEmpresa, nombreActividad, cedulaJuridica, email, numeroTelefono, " +
                "descripcion, fechaInicioActividad, fechaFinalActividad, monto from Reservacion where id = '" + id + "'", sqlConnection);
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            while (sqlDataReader.Read())
            {
                nombre.Text = sqlDataReader["nombreSolicitante"].ToString();
                empresa.Text = sqlDataReader["nombreEmpresa"].ToString();
                nombreActividad.Text = sqlDataReader["nombreActividad"].ToString();
                cedula.Text = sqlDataReader["cedulaJuridica"].ToString();
                correo.Text = sqlDataReader["email"].ToString();
                telefono.Text = sqlDataReader["numeroTelefono"].ToString();
                observaciones.Text = sqlDataReader["descripcion"].ToString();
                fechaInicio.Text = sqlDataReader["fechaInicioActividad"].ToString();
                fechaFinal.Text = sqlDataReader["fechaFinalActividad"].ToString();
                Total.Text = sqlDataReader["monto"].ToString() + " colones";

            }
            sqlDataReader.Close();
        }
    }
}