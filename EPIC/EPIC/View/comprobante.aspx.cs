using System;
using System.IO;

namespace EPIC
{
    public partial class Comprobante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                nombre.Enabled = false;
                cedula.Enabled = false;
                correo.Enabled = false;
                telefono.Enabled = false;
                direccion.Enabled = false;
                RequiredFieldValidator2.Enabled = false;
                RequiredFieldValidator3.Enabled = false;
                RequiredFieldValidator4.Enabled = false;
                RequiredFieldValidator5.Enabled = false;
                RequiredFieldValidator6.Enabled = false;
                subirImagen.Enabled = false;
                enviar.Enabled = false;
                fuArchivo.Enabled = false;
            }
        }

        protected void verificarReservacion_Click(object sender, EventArgs e)
        {
            string numeroRes = numeroReservacion.Text.Replace("'", "");
            int isReserved = Model.ConsultasDB.VerificarReservacion(numeroRes);
            if (isReserved == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('El número ingresado no existe');", true);
                subirImagen.Enabled = false;
                enviar.Enabled = false;
                fuArchivo.Enabled = false;
            }
            else
            {
                fuArchivo.Enabled = true;
                subirImagen.Enabled = true;
            }
        }

        protected void factura_CheckedChanged(object sender, EventArgs e)
        {
            nombre.Enabled = factura.Checked;
            RequiredFieldValidator2.Enabled = factura.Checked;
            cedula.Enabled = factura.Checked;
            RequiredFieldValidator3.Enabled = factura.Checked;
            correo.Enabled = factura.Checked;
            RequiredFieldValidator4.Enabled = factura.Checked;
            telefono.Enabled = factura.Checked;
            RequiredFieldValidator5.Enabled = factura.Checked;
            direccion.Enabled = factura.Checked;
            RequiredFieldValidator6.Enabled = factura.Checked;
        }

        protected void enviar_Click(object sender, EventArgs e)
        {
            string emailRes, numeroRes, nombreRes, cedulaRes, correoRes, telefonoRes, direccionRes;
            numeroRes = numeroReservacion.Text.Replace("'", "");
            nombreRes = nombre.Text.Replace("'", "");
            cedulaRes = cedula.Text.Replace("'", "");
            correoRes = correo.Text.Replace("'", "");
            telefonoRes = telefono.Text.Replace("'", "");
            direccionRes = direccion.Text.Replace("'", "");

            int isReserved = Model.ConsultasDB.VerificarReservacion(numeroRes);

            if (isReserved == 1)
            {
                emailRes = Model.ConsultasDB.ObtenerCorreoReservacion(numeroRes);
                if (factura.Checked)
                {
                    Model.EnviarCorreo.CorreoFacturaElectronicaUsuario(emailRes, numeroRes, nombreRes, cedulaRes, correoRes, telefonoRes, direccionRes);
                }
                else
                {
                    Model.EnviarCorreo.CorreoComprobanteUsuario(emailRes, numeroRes);
                }
            }
        }

        protected void subirImagen_Click(object sender, EventArgs e)
        {
            Byte[] Archivo = null;
            string numeroRes = numeroReservacion.Text.Replace("'", "");
            string nombreArchivo = string.Empty;
            string extensionArchivo = string.Empty;
            if (fuArchivo.HasFile == true)
            {
                extensionArchivo = Path.GetExtension(fuArchivo.FileName);

                if (extensionArchivo.Equals(".png") || extensionArchivo.Equals(".jpg") || extensionArchivo.Equals(".pdf"))
                {
                    using (BinaryReader reader = new BinaryReader(fuArchivo.PostedFile.InputStream))
                    {
                        Archivo = reader.ReadBytes(fuArchivo.PostedFile.ContentLength);

                        Model.ConsultasDB.InsertarComprobante(fuArchivo.FileName, fuArchivo.PostedFile.ContentLength, Archivo, numeroRes);
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Se ha subido el comprobante correctamente');", true);

                    //nombreArchivo = Path.GetFileNameWithoutExtension(fuArchivo.FileName);

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Archivo no permitido, verifique que la extensión del archivo sea .png .jpg .pdf');", true);
                }
            }

            enviar.Enabled = true;
        }
    }
}