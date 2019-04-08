using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EPIC
{
    public partial class Alquiler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
            String dia = diaReserva.Text;
            String inicio = horaInicio.Text;
            String final = horaFinal.Text;

            TableRow newRow = new TableRow();
            TableCell newCell = new TableCell();
            TableCell newCell2 = new TableCell();
            TableCell newCell3 = new TableCell();

            newCell.Text = dia;
            newRow.Cells.Add(newCell);
            newCell2.Text = inicio;
            newRow.Cells.Add(newCell2);
            newCell3.Text = final;
            newRow.Cells.Add(newCell3);
            tablaHorario.Rows.Add(newRow);
        }
    }
}