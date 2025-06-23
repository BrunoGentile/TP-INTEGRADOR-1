using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.CompilerServices;
using System.Data;
using System.Reflection;


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

        /*public void GuardarConsulta(string codConsulta, string legajoMedico, string dniPaciente, int presencia, string observacion)
        {
            using (SqlConnection conexion = ObtenerConexion())
            {
                string consultaSQL = @"INSERT INTO Consultas 
                               (CodConsultas, LegajoMedico_Cons, DNIPaciente_Cons, PresenciaPaciente, Observacion_Cons)
                               VALUES (@Cod, @Medico, @DNI, @Presente, @Observacion)";

                using (SqlCommand comando = new SqlCommand(consultaSQL, conexion))
                {
                    comando.Parameters.AddWithValue("@Cod", codConsulta);
                    comando.Parameters.AddWithValue("@Medico", legajoMedico);
                    comando.Parameters.AddWithValue("@DNI", dniPaciente);
                    comando.Parameters.AddWithValue("@Presente", presencia);
                    comando.Parameters.AddWithValue("@Observacion", observacion);

                    conexion.Open();
                    comando.ExecuteNonQuery();
                }

            }*/
            public DataTable ObtenerTurnosCompletos()
        {
            DataTable dt = new DataTable();
            using (SqlConnection conexion = ObtenerConexion())
            {
                string consulta = @"
            SELECT 
                p.Nombre_Paciente, 
                p.Apellido_Paciente, 
                p.DNI_Paciente AS DNIPaciente_Cons,
                t.Cod_Turno,
                t.LegajoMedico_Turnos,
                CONVERT(date, t.Dia_Turnos) AS Dia_Turnos,
                CONVERT(varchar(5), t.Horarios_Turnos, 108) AS Horarios_Turnos,
                '' AS Observacion
            FROM Turnos t
            INNER JOIN Pacientes p ON p.DNI_Paciente = t.DNIPaciente_Turnos
            WHERE NOT EXISTS (
                SELECT 1 FROM Consultas c 
                WHERE c.DNIPaciente_Cons = t.DNIPaciente_Turnos 
                AND c.LegajoMedico_Cons = t.LegajoMedico_Turnos
            )";

                SqlDataAdapter da = new SqlDataAdapter(consulta, conexion);
                da.Fill(dt);
            }
            return dt;
        }


        public DataTable CargarPresente()
        {
            DataTable dt = new DataTable();

            using (SqlConnection conexion = ObtenerConexion())
            {
                string consulta = @"SELECT * FROM Turnos INNER JOIN Pacientes ON DNIPaciente_Turnos = DNI_Paciente";

                using (SqlCommand cmd = new SqlCommand(consulta, conexion))
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    conexion.Open();
                    adapter.Fill(dt);
                }
            }

            return dt;
        }

    }



}





   


