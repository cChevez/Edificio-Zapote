using System;
using System.Web.UI;
using System.Threading;
using EPIC.Model;
using System.Collections.Generic;

namespace EPIC
{
    public partial class Alquiler : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
            }
        }

        protected void listAulas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listAulas.SelectedValue == "0")
            {
                Label10.Visible = false;
                Label12.Visible = false;
                Label14.Visible = false;
                aula1.Visible = false;
                aula2.Visible = false;
                aula3.Visible = false;

            } else if (listAulas.SelectedValue == "1")
            {
                Label10.Visible = true;
                Label12.Visible = false;
                Label14.Visible = false;
                aula1.Visible = true;
                aula2.Visible = false;
                aula3.Visible = false;
            } else if (listAulas.SelectedValue == "2")
            {
                Label10.Visible = true;
                Label12.Visible = true;
                Label14.Visible = false;
                aula1.Visible = true;
                aula2.Visible = true;
                aula3.Visible = false;
            } else if (listAulas.SelectedValue == "3")
            {
                Label10.Visible = true;
                Label12.Visible = true;
                Label14.Visible = true;
                aula1.Visible = true;
                aula2.Visible = true;
                aula3.Visible = true;
            }

        }

        protected void listLabs_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listLabs.SelectedValue == "0")
            {
                Label11.Visible = false;
                Label13.Visible = false;
                lab1.Visible = false;
                lab2.Visible = false;
            }
            if (listLabs.SelectedValue == "B1")
            {
                Label11.Visible = true;
                Label13.Visible = false;
                lab1.Visible = true;
                lab2.Visible = false;
            }
            if (listLabs.SelectedValue == "B2")
            {
                Label11.Visible = false;
                Label13.Visible = true;
                lab1.Visible = false;
                lab2.Visible = true;
            }
            if (listLabs.SelectedValue == "2")
            {
                Label11.Visible = true;
                Label13.Visible = true;
                lab1.Visible = true;
                lab2.Visible = true;
            }
        }

        protected void agregarHorario_Click(object sender, EventArgs e)
        {
            string dia, mes, anno;
            dia = diaReserva.Text.Replace("'", "").Substring(0, 2);
            mes = diaReserva.Text.Replace("'", "").Substring(3, 2);
            anno = diaReserva.Text.Replace("'", "").Substring(6, 4);
            string fecha = (mes + "-" + dia + "-" + anno).Replace("'", "");
            string inicio = horaInicio.Text.Replace("'", "");
            int horaI = Int32.Parse(inicio.Substring(0, 2));
            string final = horaFinal.Text.Replace("'", "");
            int horaF = Int32.Parse(final.Substring(0, 2));

            if (horaI >= horaF)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('La hora de finalización no puede ser menor o igual a la de inicio');", true);
            }
            else
            {
                List<Horario> listaHorarios = new List<Horario>();
                Horario nuevoHorario = new Horario(fecha,inicio,final);
                listaHorarios.Add(nuevoHorario);
                if (listaHorarios.Count > 1)
                {
                    for (int i = 0; i < listaHorarios.Count; i++)
                    {
                        Horario horario = listaHorarios[i];
                        int horaIR = Int32.Parse(horario.horaInicio.Substring(0, 2));
                        int horaFR = Int32.Parse(horario.horaFinal.Substring(0, 2));
                        if (horario.dia.Equals(nuevoHorario.dia) && (horaI==horaIR || (horaI>horaIR && horaI<horaFR)))
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Ese horario no está disponible');", true);
                        }
                        else
                        {
                            Model.ConsultasDB.InsertarHoras(fecha, inicio, final);
                        }

                    }
                }
                else
                {
                    Model.ConsultasDB.InsertarHoras(fecha, inicio, final);
                }

                diaReserva.Text = "";
                horaInicio.Text = "";
                horaFinal.Text = "";
            }
        }

        protected void enviar_Click(object sender, EventArgs e)
        {
            Boolean enviado = false; ;
            
            string fechaForm, nombreV, empresaV, cedulaV, correoV, telefonoV, nombreActividadV, fechaInicioV, fechaFinalV, observacionesV;
            string dia, mes, anno;

            DateTime today = DateTime.Today;
            fechaForm = today.ToString("dd-MM-yyyy");
            nombreV = nombre.Text.Replace("'", "");
            empresaV = empresa.Text.Replace("'", "");
            cedulaV = cedula.Text.Replace("'", "");
            correoV = correo.Text.Replace("'", "");
            telefonoV = telefono.Text.Replace("'", "");
            nombreActividadV = nombreActividad.Text.Replace("'", "");
            dia = fechaInicio.Text.Replace("'", "").Substring(0, 2);
            mes = fechaInicio.Text.Replace("'", "").Substring(3, 2);
            anno = fechaInicio.Text.Replace("'", "").Substring(6, 4);
            fechaInicioV = (mes + "-" + dia + "-" + anno).Replace("'", "");
            dia = fechaFinal.Text.Replace("'", "").Substring(0, 2);
            mes = fechaFinal.Text.Replace("'", "").Substring(3, 2);
            anno = fechaFinal.Text.Replace("'", "").Substring(6, 4);
            fechaFinalV = (mes + "-" + dia + "-" + anno).Replace("'", "");
            observacionesV = observaciones.Text.Replace("'", "");

            if (Page.IsValid)
            {
                int participantes = 10;

                try
                {
                    Model.ConsultasDB.InsertarReservacion(fechaForm, nombreV, empresaV, cedulaV, correoV, telefonoV, nombreActividadV, fechaInicioV, fechaFinalV, observacionesV, participantes);

                    enviado = true;
                }
                catch(Exception ex)
                {
                    Model.ConsultasDB.BorrarHorasSolicitadas();
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);

                    enviado = false;
                }
            }
            if (enviado)
            {
                Thread.Sleep(2000);
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Reservación creada');", true);

                nombre.Text = "";
                empresa.Text = "";
                cedula.Text = "";
                correo.Text = "";
                telefono.Text = "";
                nombre.Text = "";
                fechaInicio.Text = "";
                fechaFinal.Text = "";
                observaciones.Text = "";
                listAulas.SelectedIndex = 0;
                listLabs.SelectedIndex = 0;
                diaReserva.Text = "";
                horaInicio.Text = "";
                horaFinal.Text = "";

                int numeroReservacion = Model.ConsultasDB.ObtenerNumeroReservacion(cedulaV);

                Model.EnviarCorreo.CorreoReservacion(fechaForm,nombreV, empresaV,
                    cedulaV, correoV, telefonoV, nombreActividadV, fechaInicioV, fechaFinalV, observacionesV, numeroReservacion);
            }
        }
    }
}