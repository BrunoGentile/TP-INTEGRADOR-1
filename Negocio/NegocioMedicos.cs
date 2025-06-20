using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;   
using System.Data;
using Datos;
using Entidades;

namespace Negocio
{
    public class NegocioMedicos
    {
        GestionMedicos GestionMedicos = new GestionMedicos();

        public DataTable ObtenerMedicos()
        {
            DataTable dataTable = new DataTable();
            GestionMedicos.ObtenerMedicos(dataTable);
            return dataTable;   
        }
    }
}
