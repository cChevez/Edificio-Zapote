using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EPIC.Model
{
    public class ConsultasDB
    {
        public static void InsertarReservacion(string fechaForm, string nombreV, string empresaV, string cedulaV, string correoV,
            string telefonoV, string nombreActividadV, string fechaInicioV, string fechaFinalV, string observacionesV, int participantes)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("Execute insertarTotal '" + fechaForm.Replace("'", "") + "','" + nombreV + "','" + empresaV + "','" + cedulaV + "','" + correoV + "','"
                + telefonoV + "','" + nombreActividadV + "','" + fechaInicioV + "','" + fechaFinalV + "','" + observacionesV + "','" + participantes + "'", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
        } 

        public static void BorrarHorasSolicitadas()
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("Delete from HorasSolicitudTable", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static void InsertarHoras(string fecha, string inicio, string final)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("insert into HorasSolicitudTable(dia, horaInicio, horaFinal) values ('" + fecha + "','" + fecha + " " + inicio + "','" + fecha + " " + final + "')", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
        }
    }
}