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
    public class NegocioTurnos
    {
        GestionTurnos gestionTurnos = new GestionTurnos();

        public DataTable ObtenerTurnos()
        {
            DataTable dataTable = new DataTable();
            gestionTurnos.ObtenerTurnos(dataTable);
            return dataTable;
        }

        public DataTable filtrarTurnosPorPaciente(string filtro)
        {
            DataTable dataTable = new DataTable();
            dataTable = gestionTurnos.FiltrarTurnosPorPaciente(filtro);
            return dataTable;
        }
    }
}
