using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;
using System.Data;
using Entidades;

namespace Datos
{
    public class GestionMedicos
    {
        //CONEXION A LA BASE DE DATOS
        private string Conexion = @"Data Source=localhost\SQLEXPRESS; Initial Catalog=ClinicaGrupo15;Integrated Security = True";
        //OBJETO DE LA CLASE MEDICOS
        Medicos _Medico = new Medicos();

        //OBTENER CONEXION
        private SqlConnection ObtenerConexion()
        {
            SqlConnection conexion = new SqlConnection(Conexion);
            return conexion;
        }
    }
}
