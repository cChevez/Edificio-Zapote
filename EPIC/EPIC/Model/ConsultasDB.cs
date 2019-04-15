﻿using System;
using System.Configuration;
using System.Data.SqlClient;

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

        public static int VerificarReservacion(string id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("select count(*) from Reservacion where id= '" + id + "'", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            return Convert.ToInt32(sqlCommand.ExecuteScalar());
        }

        public static string ObtenerCorreoReservacion(string id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("select email from Reservacion where id= '" + id + "'", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            return Convert.ToString(sqlCommand.ExecuteScalar());
        }

        public static void InsertarComprobante(string nombre, int length, byte[] imagen, string reservacion)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();

            string query = @"Insert into comprobante (nombreArchivo, sizeArchivo, imgComprobante, FKReservacion) values (@nombreArchivo, @sizeArchivo, @imgComprobante, @FKReservacion)";

            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);

            sqlCommand.Parameters.AddWithValue("@nombreArchivo", nombre);
            sqlCommand.Parameters.AddWithValue("@sizeArchivo", length);
            sqlCommand.Parameters.AddWithValue("@FKReservacion", reservacion);

            SqlParameter imageParam = sqlCommand.Parameters.Add("@imgComprobante", System.Data.SqlDbType.Image);
            imageParam.Value = imagen;

            sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
        }
    }
}