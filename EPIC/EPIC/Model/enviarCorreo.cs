using System.Configuration;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;

namespace EPIC.Model
{
    public class EnviarCorreo
    {
        public static void CorreoReservacion(string fechaForm, string nombreV, string empresaV, string cedulaV, string correoV, string telefonoV, 
            string nombreActividadV, string fechaInicioV, string fechaFinalV, string observacionesV, int numeroReservacion)
        {
            var smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
            string strHost = smtpSection.Network.Host;
            int port = smtpSection.Network.Port;
            string strUserName = smtpSection.Network.UserName;
            string strFromPass = smtpSection.Network.Password;
            SmtpClient smtp = new SmtpClient(strHost, port);
            NetworkCredential cert = new NetworkCredential(strUserName, strFromPass);
            smtp.Credentials = cert;
            smtp.EnableSsl = true;

            MailMessage msg = new MailMessage(smtpSection.From, correoV);
            msg.Subject = "Reservacion creada";
            msg.IsBodyHtml = true;
            string mensaje = string.Format("Se ha creado su reservación exitosamente.{0}{0}" +
                "Datos de la reservación:{0}" +
                "Número de reservación: {11}{0}Fecha de creación: {10}{0}Nombre del reservante: {1}{0}Nombre de la empresa: {2}{0}Cédula jurídica: {3}{0}Correo electrónico: {4}{0}Teléfono: {5}{0}" +
                "Nombre de la actividad: {6}{0}Fecha de inicio: {7}{0}Fecha de finalización: {8}{0}Observaciones: {9}{0}Para mayor información comuníquese al 2250-9160{0}{0}" +
                "{0}Formas de pago:{0}-> Depósito bancario o transferencia electrónica{0}Cuentas bancarias:{0}>>> Banco Nacional # 75-003959-4{0}" +
                ">>> Banco de Costa Rica # 275-004039-8{0}{0}Correo generado de manera automática," +
                " por favor no responda a este correo, ya que no recibirá ninguna respuesta.", "<br/>", nombreV, empresaV,
                cedulaV, correoV, telefonoV, nombreActividadV, fechaInicioV, fechaFinalV, observacionesV, fechaForm, numeroReservacion);
            msg.Body = mensaje;
            smtp.Send(msg);
        }

        public static void CorreoComprobanteUsuario(string email, string numeroReservacion)
        {
            var smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
            string strHost = smtpSection.Network.Host;
            int port = smtpSection.Network.Port;
            string strUserName = smtpSection.Network.UserName;
            string strFromPass = smtpSection.Network.Password;
            SmtpClient smtp = new SmtpClient(strHost, port);
            NetworkCredential cert = new NetworkCredential(strUserName, strFromPass);
            smtp.Credentials = cert;
            smtp.EnableSsl = true;

            MailMessage msg = new MailMessage(smtpSection.From, email);
            msg.Subject = "Comprobante de pago recibido";
            msg.IsBodyHtml = true;
            string mensaje = string.Format("Se ha recibido el comprobante de pago exitosamente para la reservación número: {1}.{0}{0}A continuación se procederá a la revisión de la " +
                "misma y será notificado por este medio una vez se haya aprobado su reservación.{0}" +
                "Para más información comuníquese al 2250-9160{0}Correo generado de manera automática, por favor no responda a este correo, ya que no " +
                "recibirá ninguna respuesta.{0}", "<br/>",numeroReservacion);
            msg.Body = mensaje;
            smtp.Send(msg);
        }

        public static void CorreoFacturaElectronicaUsuario(string email, string numeroReservacion, string nombre, string cedula, string correo, string telefono, string direccion)
        {
            var smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
            string strHost = smtpSection.Network.Host;
            int port = smtpSection.Network.Port;
            string strUserName = smtpSection.Network.UserName;
            string strFromPass = smtpSection.Network.Password;
            SmtpClient smtp = new SmtpClient(strHost, port);
            NetworkCredential cert = new NetworkCredential(strUserName, strFromPass);
            smtp.Credentials = cert;
            smtp.EnableSsl = true;

            MailMessage msg = new MailMessage(smtpSection.From, email);
            msg.Subject = "Comprobante de pago recibido";
            msg.IsBodyHtml = true;
            string mensaje = string.Format("Se ha recibido el comprobante de pago exitosamente para la reservación número:" +
                " {1}.{0}{0}A continuación se procederá a la revisión de la misma y luego será notificado por este medio una vez se haya aprobado su reservación.{0}" +
                "En caso de no existir ningún problema adicional, se procederá a realizar la confección de la factura electrónica, la cual le llegará una vez esté lista.{0}" +
                "La factura electrónica se realizará con los siguientes datos:{0}Nombre completo: {2}{0}Cédula: {3}{0}Correo electrónico: {4}{0}Teléfono: {5}{0}Dirección: {6}{0}" +
                "Para más información comuníquese al 2250-9160{0}Correo generado de manera automática, por favor no responda este correo, ya que no recibirá" +
                " ninguna respuesta.{0}", "<br/>",numeroReservacion,nombre,cedula,correo,telefono,direccion);
            msg.Body = mensaje;
            smtp.Send(msg);
        }

        public static void CorreoCancelacionReservacion(string email, string numeroReservacion, string nombre, string nombreActividad)
        {
            var smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
            string strHost = smtpSection.Network.Host;
            int port = smtpSection.Network.Port;
            string strUserName = smtpSection.Network.UserName;
            string strFromPass = smtpSection.Network.Password;
            SmtpClient smtp = new SmtpClient(strHost, port);
            NetworkCredential cert = new NetworkCredential(strUserName, strFromPass);
            smtp.Credentials = cert;
            smtp.EnableSsl = true;

            MailMessage msg = new MailMessage(smtpSection.From, email);
            msg.Subject = "Comprobante de pago recibido";
            msg.IsBodyHtml = true;
            string mensaje = string.Format("Señor(a) {2}{0}{0}Se le comunica que la reservación número {1} para la actividad {3} ha sido cancelada por un administrador.{0}" +
                "Si tiene alguna pregunta o consulta, puede comunicarse al número 2250-9160 o al correo sagomez@itcr.ac.cr{0}{0}Correo generado de manera automática," +
                " por favor no responda este correo ya que no recibirá ninguna respueta.", "<br/>", numeroReservacion, nombre, nombreActividad);
            msg.Body = mensaje;
            smtp.Send(msg);
        }

        public static void RegistrarAdministrador(string email, string nombreCompleto, string password)
        {
            var smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
            string strHost = smtpSection.Network.Host;
            int port = smtpSection.Network.Port;
            string strUserName = smtpSection.Network.UserName;
            string strFromPass = smtpSection.Network.Password;
            SmtpClient smtp = new SmtpClient(strHost, port);
            NetworkCredential cert = new NetworkCredential(strUserName, strFromPass);
            smtp.Credentials = cert;
            smtp.EnableSsl = true;

            MailMessage msg = new MailMessage(smtpSection.From, email);
            msg.Subject = "Registro de administrador";
            msg.IsBodyHtml = true;
            string mensaje = string.Format("Señor(a) {2}{0}{0}Se le informa que ha sido agregado como administrador para la aplicación Reservaciones ePIC.{0}" +
                "Sus datos de inicio de sesión son:{0}Correo electrónico: {1}{0}Contraseña: {3}{0}{0}Correo generado de manera automática," +
                " por favor no responda este correo ya que no recibirá ninguna respueta.", "<br/>", email, nombreCompleto, password);
            msg.Body = mensaje;
            smtp.Send(msg);
        }
    }
}