using System;
using System.Configuration;
using System.Data.SqlClient;

namespace EPIC.Model
{
    public class ConsultasDB
    {
        public static void InsertarReservacion(string fechaForm, string nombreV, string empresaV, string cedulaV, string correoV,
            string telefonoV, string nombreActividadV, string fechaInicioV, string fechaFinalV, string observacionesV, int participantes, int total)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("Execute insertarTotal '" + fechaForm.Replace("'", "") + "','" + nombreV + "','" + empresaV + "','" + cedulaV + "','" + correoV + "','"
                + telefonoV + "','" + nombreActividadV + "','" + fechaInicioV + "','" + fechaFinalV + "','" + observacionesV + "','" + participantes + "','" + total + "'", sqlConnection);

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

        internal static void SubirCurso(string name, byte[] foto, string description)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();

            string query = @"Insert into Cursos (nombre, foto, descripcion) values (@nombre, @foto, @descripcion)";

            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);

            sqlCommand.Parameters.AddWithValue("@nombre", name);

            SqlParameter archivoParam = sqlCommand.Parameters.Add("@foto", System.Data.SqlDbType.Image);
            archivoParam.Value = foto;

            sqlCommand.Parameters.AddWithValue("@descripcion", description);

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

        public static int ObtenerNumeroReservacion(string cedula)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("select id from Reservacion where cedulaJuridica= '" + cedula + "'", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            return Convert.ToInt32(sqlCommand.ExecuteScalar());
        }

        public static void InsertarComprobante(string nombre, int length, byte[] imagen, string reservacion)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            
            string query = @"Insert into comprobante (imgComprobante, FKReservacion) values (@imgComprobante, @FKReservacion)";

            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            
            sqlCommand.Parameters.AddWithValue("@FKReservacion", reservacion);

            SqlParameter imageParam = sqlCommand.Parameters.Add("@imgComprobante", System.Data.SqlDbType.Image);
            imageParam.Value = imagen;

            sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static int VerificarCredenciales(string email, string password)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            
            SqlCommand sqlCommand = new SqlCommand("SELECT COUNT(*) FROM Administrador WHERE email = '" + email + "' AND contra = '" + password + "'", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            return Convert.ToInt32(sqlCommand.ExecuteScalar());
        }

        public static void ActualizarEstado(string numeroReservacion, string codigoEstado)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("UPDATE Reservacion SET FKEstadoReservacion = '" + codigoEstado + "'  WHERE id = '" + numeroReservacion + "'", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static void ActualizarEstadoComprobante(string numeroReservacion)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("UPDATE Reservacion SET FKEstadoReservacion = '2'  WHERE id = '" + numeroReservacion + "'", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static void AgregarHorario(string dia, string horaInicio, string horaFinal, string aula, string lab)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();

            SqlCommand sqlCommand = new SqlCommand("Execute SaveHoraSolicitudTable '" + dia + "','" + horaInicio + "','" + horaFinal + "'," + aula + "," + lab, sqlConnection);
            
            sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static string ObtenerNombreSolicitanteReservacion(string id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("select nombreSolicitante from Reservacion where id= '" + id + "'", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            return Convert.ToString(sqlCommand.ExecuteScalar());
        }
        public static string ObtenerNombreActividadReservacion(string id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("select nombreActividad from Reservacion where id= '" + id + "'", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            return Convert.ToString(sqlCommand.ExecuteScalar());
        }

        public static void RegistrarAdministrador(string nombre, string apellido, string email, string password)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("insert into Administrador(nombre, apellido, email, contra) values ('" + nombre + "','" + apellido + "','" +
                email + "','" + password + "')", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static void EliminarAdministrador(string id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("Delete from Administrador where id = '" + id + "'", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static void AgregarHorarioEstudiante(string dia, string horaInicio, string horaFinal)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("Insert into HorasHorariosTable(dia, horaInicio, horaFinal) " +
                "values ('" + dia + "','" + horaInicio +  "','" + horaFinal + "')", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static void SubirArchivo(string nombre, byte[] archivo, int size)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();

            string query = @"Insert into Archivos (nombre, archivo, size) values (@nombre, @archivo, @size)";

            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);

            sqlCommand.Parameters.AddWithValue("@nombre", nombre);

            SqlParameter archivoParam = sqlCommand.Parameters.Add("@archivo", System.Data.SqlDbType.Image);
            archivoParam.Value = archivo;

            sqlCommand.Parameters.AddWithValue("@size", size);

            sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static void BorrarArchivo(string id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();

            SqlCommand sqlCommand = new SqlCommand("Delete from Archivos where id = '" + id + "'", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static Archivo ObtenerComprobante(int id)
        {
            Archivo arch = null;

            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();

            string query = @"SELECT imgComprobante, FKReservacion FROM Comprobante WHERE FKReservacion = @id";

            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@id", id);

            SqlDataReader reader = sqlCommand.ExecuteReader();

            if (reader.Read())
            {
                arch = new Archivo(Convert.ToInt32(reader["FKReservacion"]));

                arch.ContenidoArchivo = (byte[])reader["imgComprobante"];

            }

            return arch;
        }

        public static Archivo ObtenerArchivo(int id)
        {
            Archivo arch = null;

            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();

            string query = @"SELECT id, nombre, archivo, size FROM Archivos WHERE Id = @id";

            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@id", id);
            
            SqlDataReader reader = sqlCommand.ExecuteReader();

            if (reader.Read())
            {
                arch = new Archivo(
                                Convert.ToInt32(reader["id"]),
                                Convert.ToString(reader["nombre"]),
                                Convert.ToInt32(reader["size"]));

                arch.ContenidoArchivo = (byte[])reader["archivo"];

            }

            return arch;
        }

        public static String ObtenerUsuario(string email, string pass)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("select nombre + ' ' + apellido from Administrador where email= '" + email + "' and contra = '" + pass + "'", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            return Convert.ToString(sqlCommand.ExecuteScalar());
        }

        public static void AgregarEstudiante(string nombre, string apellido, string correo)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();

            SqlCommand sqlCommand = new SqlCommand("Execute insertarOperador '" + nombre + "','" + apellido + "','" + correo + "'", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
        }

        public static void BorrarDatosTablaHorariosEstudiantes()
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();

            SqlCommand sqlCommand = new SqlCommand("Delete from HorasHorariosTable", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
        }
        
        public static void BorrarCurso(string id)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ePICsqlConnection"].ToString());
            sqlConnection.Open();

            SqlCommand sqlCommand = new SqlCommand("Delete from Cursos where id = '" + id + "'", sqlConnection);

            sqlCommand.ExecuteNonQuery();

            sqlConnection.Close();
        }
    }
}