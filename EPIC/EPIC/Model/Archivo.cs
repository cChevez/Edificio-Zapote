using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EPIC.Model
{
    public class Archivo
    {
        public Archivo(int id, string nombre, int length)
        {
            this.Id = id;
            this.Nombre = nombre;
            this.Length = length;
        }
        public Archivo(int id)
        {
            this.Id = id;
        }
        public int Id { get; set; }
        public int Length { get; set; }
        public string Nombre { get; set; }

        public byte[] ContenidoArchivo { get; set; }
    }
}