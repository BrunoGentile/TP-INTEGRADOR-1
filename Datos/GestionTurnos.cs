using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.CompilerServices;
using System.Data;


namespace Datos
{
    public class GestionTurnos
    {
        //CONEXION A LA BASE DE DATOS
        private string Conexion = @"Data Source=localhost\SQLEXPRESS; Initial Catalog=ClinicaGrupo15;Integrated Security = True";

        //OBJETO DE LA CLASE TURNOS
        Turnos _Turno = new Turnos();

        //OBTENER CONEXION
        public SqlConnection ObtenerConexion()
        {
            try
            {
                SqlConnection conexion = new SqlConnection(Conexion);
                return conexion;
            }
            catch (Exception)
            {
                return null; // Retorna null si hay un error al crear la conexión
            }

        }

        //MÉTODO PARA OBTENER LOS TURNOS
        public void ObtenerTurnos(DataTable dataTable)
        {
            SqlConnection conexion = ObtenerConexion();
            string consultaSQL = "SELECT * FROM Turnos INNER JOIN Medicos ON LegajoMedico_Turnos = Legajo_Medico";
            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            SqlDataAdapter adaptador = new SqlDataAdapter(comando);
            adaptador.Fill(dataTable);

            conexion.Close();
        }

        //MÉTODO PARA FILTRAR TURNOS POR PACIENTE
        public DataTable FiltrarTurnosPorPaciente(string DNIPaciente)
        {
            DataTable dataTable = new DataTable();

            SqlConnection conexion = ObtenerConexion();
            conexion.Open();

            string consultaSQL = "SELECT * FROM Turnos INNER JOIN Medicos ON LegajoMedico_Turnos = Legajo_Medico WHERE DNIPaciente_Turnos = @DNIPaciente";
            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            comando.Parameters.AddWithValue("@DNIPaciente", DNIPaciente);
            SqlDataAdapter adaptador = new SqlDataAdapter(comando);
            adaptador.Fill(dataTable);

            conexion.Close();

            return dataTable;
        }

        public bool ExisteDNIPaciente(string DNIpaciente)
        {
            SqlConnection conexion = new SqlConnection(Conexion);
            conexion.Open();

            string consulta = "SELECT COUNT(*) FROM Turnos INNER JOIN Medicos ON LegajoMedico_Turnos = Legajo_Medico WHERE DNIPaciente_Turnos = @DNIPaciente";
            SqlCommand comando = new SqlCommand(consulta, conexion);
            comando.Parameters.AddWithValue("@DNIPaciente", DNIpaciente);

            int cantidad = (int)comando.ExecuteScalar();
            conexion.Close();
            return cantidad > 0;
        }
    }
}
