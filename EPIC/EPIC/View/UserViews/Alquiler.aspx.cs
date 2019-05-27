using System;
using System.Web.UI;
using System.Threading;
using EPIC.Model;
using System.Collections.Generic;

namespace EPIC
{
    public partial class Alquiler : System.Web.UI.Page
    {
        private int montoTotal;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                RegularExpressionValidator9.Enabled = false;
                RegularExpressionValidator10.Enabled = false;
                RegularExpressionValidator11.Enabled = false;
                RegularExpressionValidator12.Enabled = false;
                RegularExpressionValidator13.Enabled = false;
                AulasEscogidas.Items.Insert(0, "Ninguna");
                LabsEscogidos.Items.Insert(0, "Ninguno");
                Total.Text = "0 colones";
            }
            else
            {
                if (ViewState["monto"] != null)
                {
                    montoTotal = Convert.ToInt32(ViewState["monto"]);
                    Total.Text = Convert.ToString(montoTotal) + " colones";
                }
                else
                {
                    montoTotal = 0;
                }
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
                RegularExpressionValidator9.Enabled = false;
                RegularExpressionValidator10.Enabled = false;
                RegularExpressionValidator11.Enabled = false;
                AulasEscogidas.Items.Clear();
                AulasEscogidas.Items.Insert(0, "Ninguna");

            } else if (listAulas.SelectedValue == "1")
            {
                Label10.Visible = true;
                Label12.Visible = false;
                Label14.Visible = false;
                aula1.Visible = true;
                aula2.Visible = false;
                aula3.Visible = false;
                RegularExpressionValidator9.Enabled = true;
                RegularExpressionValidator10.Enabled = false;
                RegularExpressionValidator11.Enabled = false;
                AulasEscogidas.Items.Clear();
                AulasEscogidas.Items.Insert(0, "Ninguna");
                AulasEscogidas.Items.Insert(1, "Aula 1");

            } else if (listAulas.SelectedValue == "2")
            {
                Label10.Visible = true;
                Label12.Visible = true;
                Label14.Visible = false;
                aula1.Visible = true;
                aula2.Visible = true;
                aula3.Visible = false;
                RegularExpressionValidator9.Enabled = true;
                RegularExpressionValidator10.Enabled = true;
                RegularExpressionValidator11.Enabled = false;
                AulasEscogidas.Items.Clear();
                AulasEscogidas.Items.Insert(0, "Ninguna");
                AulasEscogidas.Items.Insert(1, "Aula 1");
                AulasEscogidas.Items.Insert(2, "Aula 2");
            } else if (listAulas.SelectedValue == "3")
            {
                Label10.Visible = true;
                Label12.Visible = true;
                Label14.Visible = true;
                aula1.Visible = true;
                aula2.Visible = true;
                aula3.Visible = true;
                RegularExpressionValidator9.Enabled = true;
                RegularExpressionValidator10.Enabled = true;
                RegularExpressionValidator11.Enabled = true;
                AulasEscogidas.Items.Clear();
                AulasEscogidas.Items.Insert(0, "Ninguna");
                AulasEscogidas.Items.Insert(1, "Aula 1");
                AulasEscogidas.Items.Insert(2, "Aula 2");
                AulasEscogidas.Items.Insert(3, "Aula 3");
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
                RegularExpressionValidator12.Enabled = false;
                RegularExpressionValidator13.Enabled = false;
                LabsEscogidos.Items.Clear();
                LabsEscogidos.Items.Insert(0, "Ninguno");
            }
            if (listLabs.SelectedValue == "1")
            {
                Label11.Visible = true;
                Label13.Visible = false;
                lab1.Visible = true;
                lab2.Visible = false;
                RegularExpressionValidator12.Enabled = true;
                RegularExpressionValidator13.Enabled = false;
                LabsEscogidos.Items.Clear();
                LabsEscogidos.Items.Insert(0, "Ninguno");
                LabsEscogidos.Items.Insert(1, "Laboratorio B1");
            }
            if (listLabs.SelectedValue == "2")
            {
                Label11.Visible = false;
                Label13.Visible = true;
                lab1.Visible = false;
                lab2.Visible = true;
                RegularExpressionValidator12.Enabled = false;
                RegularExpressionValidator13.Enabled = true;
                LabsEscogidos.Items.Clear();
                LabsEscogidos.Items.Insert(0, "Ninguno");
                LabsEscogidos.Items.Insert(1, "Laboratorio B2");
            }
            if (listLabs.SelectedValue == "3")
            {
                Label11.Visible = true;
                Label13.Visible = true;
                lab1.Visible = true;
                lab2.Visible = true;
                RegularExpressionValidator12.Enabled = true;
                RegularExpressionValidator13.Enabled = true;
                LabsEscogidos.Items.Clear();
                LabsEscogidos.Items.Insert(0, "Ninguno");
                LabsEscogidos.Items.Insert(1, "Laboratorio B1");
                LabsEscogidos.Items.Insert(2, "Laboratorio B2");
            }
        }

        protected void agregarHorario_Click(object sender, EventArgs e)
        {
            if (diaReserva.Text.Length == 0 || horaInicio.Text.Length == 0 || horaFinal.Text.Length == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Ingrese una fecha y hora de reservación');", true);
            }
            else
            {
                string dia, mes, anno;
                dia = diaReserva.Text.Replace("'", "").Substring(8, 2);
                mes = diaReserva.Text.Replace("'", "").Substring(5, 2);
                anno = diaReserva.Text.Replace("'", "").Substring(0, 4);
                string fecha = (mes + "-" + dia + "-" + anno).Replace("'", "");
                
                string inicio = horaInicio.Text.Replace("'", "");
                int horaI = Int32.Parse(inicio.Substring(0, 2));
                string final = horaFinal.Text.Replace("'", "");
                int horaF = Int32.Parse(final.Substring(0, 2));               

                string cantAula = listAulas.SelectedValue;
                string cantLabs = listLabs.SelectedValue;
                
                if (horaI >= horaF)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('La hora de finalización no puede ser menor o igual a la de inicio');", true);
                }
                else
                {
                    dia = diaReserva.Text.Replace("'", "").Substring(8, 2);
                    mes = diaReserva.Text.Replace("'", "").Substring(5, 2);
                    anno = diaReserva.Text.Replace("'", "").Substring(0, 4);
                    string dayStart = (anno + "-" + mes + "-" + dia).Replace("'", "");
                    string start = (dayStart + " " + inicio).Replace("'", "");
                    string end = (dayStart + " " + final).Replace("'", "");
                    string aula = AulasEscogidas.SelectedValue.ToString();
                    string lab = LabsEscogidos.SelectedValue.ToString();

                    if (aula.Equals("Ninguna"))
                    {
                        aula = "null";
                    }
                    if (lab.Equals("Ninguno"))
                    {
                        lab = "null";
                    }

                    aula = aula.Replace("'", "");
                    lab = lab.Replace("'", "");
                    if (aula.Equals("null") && lab.Equals("null"))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Seleccione un aula o laboratorio');", true);
                    }
                    else if (!aula.Equals("null") && !lab.Equals("null"))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Seleccione solo aula o laboratorio');", true);
                    }
                    else
                    {
                        try
                        {
                            if (aula.Equals("null"))
                            {
                                montoTotal = montoTotal + (25000 * (horaF - horaI));
                                ViewState["monto"] = montoTotal;
                            }
                            else
                            {
                                montoTotal = montoTotal + (9850 * (horaF - horaI));
                                ViewState["monto"] = montoTotal;
                            }
                            if (aula.Equals("Aula 1")) aula = "1";
                            else if (aula.Equals("Aula 2")) aula = "2";
                            else if (aula.Equals("Aula 3")) aula = "3";
                            else if (lab.Equals("Laboratorio B1")) lab = "1";
                            else if (lab.Equals("Laboratorio B2")) lab = "2";

                            Model.ConsultasDB.AgregarHorario(dayStart, start, end, aula, lab);
                        }
                        catch (Exception ex)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('No se puede ingresar el horario seleccionado," +
                                " verifique que no se haya ingresado anteriormente y vuelva a intentarlo');", true);
                        }

                        diaReserva.Text = "";
                        horaInicio.Text = "";
                        horaFinal.Text = "";
                        this.GridView1.DataBind();
                    }
                }
            }
        }

        protected void enviar_Click(object sender, EventArgs e)
        {
            Boolean enviado = false; ;

            string fechaForm, nombreV, empresaV, cedulaV, correoV, telefonoV, nombreActividadV, fechaInicioV, fechaFinalV, observacionesV;
            string dia, mes, anno, hora, minuto;

            DateTime today = DateTime.Today;
            dia = today.Day.ToString();
            mes = today.Month.ToString();
            anno = today.Year.ToString();
            hora = today.Hour.ToString();
            minuto = today.Minute.ToString();
            fechaForm = anno + "-" + mes + "-" + dia + " " + hora + ":" + minuto;
            nombreV = nombre.Text.Replace("'", "");
            empresaV = empresa.Text.Replace("'", "");
            cedulaV = cedula.Text.Replace("'", "");
            correoV = correo.Text.Replace("'", "");
            telefonoV = telefono.Text.Replace("'", "");
            nombreActividadV = nombreActividad.Text.Replace("'", "");

            dia = fechaInicio.Text.Replace("'", "").Substring(8, 2);
            mes = fechaInicio.Text.Replace("'", "").Substring(5, 2);
            anno = fechaInicio.Text.Replace("'", "").Substring(0, 4);
            string fechaInicial = (mes + "-" + dia + "-" + anno).Replace("'", "");

            dia = fechaFinal.Text.Replace("'", "").Substring(8, 2);
            mes = fechaFinal.Text.Replace("'", "").Substring(5, 2);
            anno = fechaFinal.Text.Replace("'", "").Substring(0, 4);
            string fechaFinalizacion = (mes + "-" + dia + "-" + anno).Replace("'", "");

            fechaInicioV = fechaInicial.Replace("'", "");
            fechaFinalV = fechaFinalizacion.Replace("'", "");
            observacionesV = observaciones.Text.Replace("'", "");

            if (Page.IsValid)
            {
                int aula1P, aula2P, aula3P, lab1P, lab2P;

                if (aula1.Text.Length == 0) aula1P = 0;
                else aula1P = Int32.Parse(aula1.Text.Replace("'", ""));

                if (aula2.Text.Length == 0) aula2P = 0;
                else aula2P = Int32.Parse(aula2.Text.Replace("'", ""));

                if (aula3.Text.Length == 0) aula3P = 0;
                else aula3P = Int32.Parse(aula3.Text.Replace("'", ""));

                if (lab1.Text.Length == 0) lab1P = 0;
                else lab1P = Int32.Parse(lab1.Text.Replace("'", ""));

                if (lab2.Text.Length == 0) lab2P = 0;
                else lab2P = Int32.Parse(lab2.Text.Replace("'", ""));

                int participantes = aula1P + aula2P + aula3P + lab1P + lab2P;

                try
                {
                    Model.ConsultasDB.InsertarReservacion(fechaForm, nombreV, empresaV, cedulaV, correoV, telefonoV, nombreActividadV, fechaInicioV, fechaFinalV, observacionesV, participantes, montoTotal);

                    Model.ConsultasDB.BorrarHorasSolicitadas();

                    enviado = true;
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('No se puede crear la reservación');", true);

                    enviado = false;
                }
            }
            if (enviado)
            {
                Thread.Sleep(2000);
                
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Reservación creada');", true);
                
                Thread.Sleep(1000);
                Response.Redirect("Alquiler.aspx");
            }
        }
        
    }
}