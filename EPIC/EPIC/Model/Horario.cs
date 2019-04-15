using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EPIC.Model
{
    public class Horario
    {
        private string dia;
        private string horaInicio;
        private string horaFinal;

        public Horario(string dia, string horaInicio, string horaFinal)
        {
            this.dia = dia;
            this.horaInicio = horaInicio;
            this.horaFinal = horaFinal;
        }

        public void setDia(string day)
        {
            dia = day;
        }

        public string getDia()
        {
            return dia;
        }

        public void setHoraInicio(string inicio)
        {
            horaInicio = inicio;
        }

        public string getHoraInicio()
        {
            return horaInicio;
        }

        public void setHoraFinal(string final)
        {
            horaFinal = final;
        }

        public string getHoraFinal()
        {
            return horaFinal;
        }
    }
}