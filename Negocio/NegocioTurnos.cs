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

        public bool existeDNIPaciente(string DNIPaciente)
        {
            bool existe = gestionTurnos.ExisteDNIPaciente(DNIPaciente);
            return existe;
        }

        // [+] ---------- CARGAR ESPECIALIDADES ---------- [+]
        public DataTable CargarEspecialidades()
        {
            return gestionTurnos.CargarEspecialidades();
        }

        // [+] ---------- CARGAR MÉDICOS POR ESPECIALIDAD ---------- [+]

        public DataTable CargarMedicosPorEspecialidad(string CodEspecialidad)
        {
            return gestionTurnos.CargarMedicosPorEspecialidad(CodEspecialidad);
        }

        // [+] ---------- CARGAR DÍAS DISPONIBLES POR MÉDICO ---------- [+]
        public DataTable CargarDiasDisponibles(string LegajoMedico)
        {
            return gestionTurnos.CargarDiasDisponibles(LegajoMedico);
        }

        // [+] ---------- CARGAR HORARIOS DISPONIBLES DEL MÉDICO ---------- [+]

        public string CargarHorariosDisponibles(string LegajoMedico)
        {
            return gestionTurnos.CargarHorariosDisponibles(LegajoMedico);
        }

    }
}
