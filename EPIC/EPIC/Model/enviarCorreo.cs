using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Web;

namespace EPIC.Model
{
    public class EnviarCorreo
    {
        public static void CorreoReservacion(string fechaForm, string nombreV, string empresaV, string cedulaV, string correoV, string telefonoV, string nombreActividadV, string fechaInicioV, string fechaFinalV, string observacionesV)
        {
            DateTime today = DateTime.Today;
            fechaForm = today.ToString("dd-MM-yyyy");

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
                "Fecha de creación: {10}{0}Nombre del reservante: {1}{0}Nombre de la empresa: {2}{0}Cédula jurídica: {3}{0}Correo electrónico: {4}{0}Teléfono: {5}{0}" +
                "Nombre de la actividad: {6}{0}Fecha de inicio: {7}{0}Fecha de finalización: {8}{0}Observaciones: {9}{0}Para mayor información comuniquese al 2250-9160", "<br/>", nombreV, empresaV,
                cedulaV, correoV, telefonoV, nombreActividadV, fechaInicioV, fechaFinalV, observacionesV, fechaForm);
            msg.Body = mensaje;
            smtp.Send(msg);
        }
    }
}