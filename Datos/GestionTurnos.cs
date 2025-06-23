using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
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
            string consultaSQL = "SELECT * FROM Turnos";
            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            SqlDataAdapter adaptador = new SqlDataAdapter(comando);
            adaptador.Fill(dataTable);

            conexion.Close();
        }

        public DataTable FiltrarTurnosPorPaciente(string DNIPaciente)
        {
            DataTable dataTable = new DataTable();

            SqlConnection conexion = ObtenerConexion();
            conexion.Open();

            string consultaSQL = "SELECT * FROM Turnos WHERE DNIPaciente_Turnos = @DNIPaciente";
            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            comando.Parameters.AddWithValue("@DNIPaciente", DNIPaciente);
            SqlDataAdapter adaptador = new SqlDataAdapter(comando);
            adaptador.Fill(dataTable);

            conexion.Close();

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





   


