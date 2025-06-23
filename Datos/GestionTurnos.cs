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

        // [+] ---------- CARGAR ESPECIALIDADES ---------- [+]
        public DataTable CargarEspecialidades()
        {
            DataTable dataTable = new DataTable();
            SqlConnection conexion = ObtenerConexion();

            conexion.Open();

            string consultaSQL = "SELECT * FROM Especialidades";
            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            SqlDataAdapter adaptador = new SqlDataAdapter(comando);
            adaptador.Fill(dataTable);

            conexion.Close();
            return dataTable;
        }

        // [+] ---------- CARGAR MÉDICOS POR ESPECIALIDAD ---------- [+]
        public DataTable CargarMedicosPorEspecialidad(string CodEspecialidad)
        {
            DataTable dataTable = new DataTable();
            SqlConnection conexion = ObtenerConexion();
            conexion.Open();
            string consultaSQL = "SELECT Legajo_Medico, (Nombre_Medico + ', ' + Apellido_Medico) AS NombreCompleto FROM Medicos WHERE CodEspecialidad_Medico = @CodEspecialidad";
            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            comando.Parameters.AddWithValue("@CodEspecialidad", CodEspecialidad);
            SqlDataAdapter adaptador = new SqlDataAdapter(comando);
            adaptador.Fill(dataTable);
            conexion.Close();
            return dataTable;

        }

        // [+] ---------- CARGAR DÍAS DISPONIBLES POR MÉDICO ---------- [+]

        public DataTable CargarDiasDisponibles(string LegajoMedico)
        {
            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("DIA", typeof(string));

            using (SqlConnection conexion = ObtenerConexion())
            {
                conexion.Open();

                string consultaSQL = "SELECT DiasAtencion_Medico FROM Medicos WHERE Legajo_Medico = @LegajoMedico";
                SqlCommand comando = new SqlCommand(consultaSQL, conexion);
                comando.Parameters.AddWithValue("@LegajoMedico", LegajoMedico);

                SqlDataReader reader = comando.ExecuteReader();

                HashSet<string> diasUnicos = new HashSet<string>();

                while (reader.Read())
                {
                    string dias = reader["DiasAtencion_Medico"].ToString(); // Ej: "Lunes, Martes"
                    string[] separados = dias.Split(',');

                    foreach (string dia in separados)
                    {
                        string diaLimpio = dia.Trim(); // Saca espacios
                        if (!diasUnicos.Contains(diaLimpio))
                        {
                            diasUnicos.Add(diaLimpio);
                            dataTable.Rows.Add(diaLimpio);
                        }
                    }

                }

                reader.Close();
            }

            return dataTable;
        }

    }
}
