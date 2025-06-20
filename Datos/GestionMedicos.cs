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
            try
            {
                conexion.Open();
                return conexion;
            }
            catch (Exception)
            {
                return null;
            }
        }

        //MÉTODO PARA OBTENER TODOS LOS MÉDICOS
        public void ObtenerMedicos(DataTable dataTable)
        {
            SqlConnection conexion = ObtenerConexion();
            string consultaSQL = "SELECT * FROM Medicos";
            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            SqlDataAdapter adaptador = new SqlDataAdapter(comando);
            adaptador.Fill(dataTable);
            
            conexion.Close();
        }
    }
}
