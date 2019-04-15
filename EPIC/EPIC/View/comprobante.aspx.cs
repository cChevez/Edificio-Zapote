using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            }
        }

        protected void verificarReservacion_Click(object sender, EventArgs e)
        {
            string numeroRes = numeroReservacion.Text.Replace("'", "");
            int isReserved = Model.ConsultasDB.verificarReservacion(numeroRes);
            if (isReserved == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('El número ingresado no existe');", true);
                subirImagen.Enabled = false;
                enviar.Enabled = false;
            }
            else
            {
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

            int isReserved = Model.ConsultasDB.verificarReservacion(numeroRes);

            if (isReserved == 1)
            {
                emailRes = Model.ConsultasDB.obtenerCorreoReservacion(numeroRes);
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

        }
    }
}