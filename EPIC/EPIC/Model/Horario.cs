using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EPIC.Model
{
    public class Horario
    {
        private string fecha;
        private string horaInicio;
        private string horaFinal;

        public Horario(string date, string inicio, string final)
        {
            fecha = date;
            horaInicio = inicio;
            horaFinal = final;
        }

        public void setFecha(string date)
        {
            fecha = date;
        }

        public string getFecha()
        {
            return fecha;
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
