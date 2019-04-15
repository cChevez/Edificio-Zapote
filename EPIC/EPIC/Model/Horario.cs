using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EPIC.Model
{
    public class Horario
    {
        public Horario(string dia, string horaInicio, string horaFinal)
        {
            this.dia = dia;
            this.horaInicio = horaInicio;
            this.horaFinal = horaFinal;
        }

        public string dia { get; set; }
        public string horaInicio { get; set; }
        public string horaFinal { get; set; }
    }
}