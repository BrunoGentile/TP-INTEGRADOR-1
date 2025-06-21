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
    public class NegocioPacientes
    {
        GestionPacientes gestionPacientes = new GestionPacientes();
    
        //métodos
        public void RegistrarPaciente(string nombre, string apellido, string DNI, string Sexo, string Nacionalidad, string FechaNac, string Direc, string Prov, string Localidad, string Correo, string Telefono)
        {
            gestionPacientes.insertarPaciente(nombre, apellido, DNI, Sexo, Nacionalidad, FechaNac, Direc, Prov, Localidad, Correo, Telefono);
        }

        public DataTable listarProvincias()
        {
            return gestionPacientes.Provincias();
        }

        public DataTable listarLocalidades (string CodProvincia)
        {
            return gestionPacientes.Localidades(CodProvincia);
        }

        // [+] ---------- LISTAR PACIENTES ---------- [+]

        public DataTable ListarPacientes()
        {
            return gestionPacientes.ListarPacientes();
        }

    }
}
