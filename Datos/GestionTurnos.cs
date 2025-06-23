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

        // [+] ---------- CARGAR HORARIOS DISPONIBLES DEL MÉDICO ---------- [+]

        public string CargarHorariosDisponibles(string LegajoMedico)
        {
            SqlConnection conexion = ObtenerConexion();
            conexion.Open();

            string consultaSQL = "SELECT * FROM Medicos WHERE Legajo_Medico = @LegajoMedico";

            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            comando.Parameters.AddWithValue("@LegajoMedico", LegajoMedico);

            string strInicio = string.Empty;
            string strFin = string.Empty;

            using (SqlDataReader reader = comando.ExecuteReader())
            {
                if (reader.Read())
                {
                    // Asumo que tus columnas son tipo DATE o DATETIME
                    TimeSpan horaInicio = (TimeSpan)(reader["HorarioInicio_Medico"]);
                    TimeSpan horaFin = (TimeSpan)(reader["HorarioFin_Medico"]);

                    // Convertir a string con formato hh:mm
                    strInicio = horaInicio.ToString();
                    strFin = horaFin.ToString();


                }
            }

            return $"Horario Inicio: {strInicio} - Horario Fin: {strFin}";

        }

        // ---------------------------------------------------------------------------------------------------------------
        // ----------------------------------------------- VERIFICAR DATOS -----------------------------------------------
        // ---------------------------------------------------------------------------------------------------------------

        // [+] ---------- VERIFICAR EXISTENCIA DEL PACIENTE ---------- [+]

        public bool VerificarExistenciaPaciente(string dniPaciente)
        {

            SqlConnection conexion = ObtenerConexion();
            conexion.Open();

            string consultaSQL = "SELECT COUNT(*) FROM Pacientes WHERE DNI_Paciente = @DNIPaciente";

            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            comando.Parameters.AddWithValue("@DNIPaciente", dniPaciente);

            int cantidad = (int)comando.ExecuteScalar();
            conexion.Close();
            return cantidad > 0;
        }

        // [+] ---------- VERIFICAR DÍA DEL TURNO ---------- [+]

        public bool VerificarDiaTurno(string legajoMedico, string diaTurno)
        {

            SqlConnection conexion = ObtenerConexion();
            conexion.Open();

            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Medicos WHERE Legajo_Medico = @Legajo AND DiasAtencion_Medico LIKE @Dia", conexion);
            cmd.Parameters.AddWithValue("@Legajo", legajoMedico);
            cmd.Parameters.AddWithValue("@Dia", "%" + diaTurno + "%");

            int cantidad = (int)cmd.ExecuteScalar(); // devuelve el número de coincidencias

            conexion.Close();
            return cantidad > 0; // si hay al menos una, devuelve true

        }

        // [+] ---------- VERIFICAR HORARIO DEL TURNO ---------- [+]

        public bool VerificarHorarioTurno(string legajoMedico, string horarioTurno)
        {
            SqlConnection conexion = ObtenerConexion();
            conexion.Open();
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Medicos WHERE Legajo_Medico = @Legajo AND HorarioInicio_Medico <= @Horario AND HorarioFin_Medico >= @Horario", conexion);

            cmd.Parameters.AddWithValue("@Legajo", legajoMedico);
            cmd.Parameters.AddWithValue("@Horario", horarioTurno);

            int cantidad = (int)cmd.ExecuteScalar(); // devuelve el número de coincidencias

            conexion.Close();
            return cantidad > 0; // si hay al menos una, devuelve true

        }

        // [+] ---------- VERIFICAR REPETICIÓN DE TURNOS ---------- [+]

        public bool VerificarRepeticionTurnos(string legajoMedico, string HorarioTurno, string Fecha)
        {
            using (SqlConnection conexion = ObtenerConexion())
            {
                conexion.Open();

                string consultaSQL = @"SELECT Horarios_Turnos 
                               FROM Turnos 
                               WHERE LegajoMedico_Turnos = @Legajo AND Dia_Turnos = @Dia";

                SqlCommand cmd = new SqlCommand(consultaSQL, conexion);
                cmd.Parameters.AddWithValue("@Legajo", legajoMedico);

                // Convertir string de fecha a DateTime seguro
                if (!DateTime.TryParseExact(Fecha, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime fechaValida))
                    return false; // fecha no válida

                cmd.Parameters.AddWithValue("@Dia", fechaValida);

                SqlDataReader reader = cmd.ExecuteReader();

                if (!TimeSpan.TryParse(HorarioTurno, out TimeSpan horarioNuevo))
                    return false;

                while (reader.Read())
                {
                    TimeSpan horarioExistente = (TimeSpan)reader["Horarios_Turnos"];
                    TimeSpan diferencia = (horarioExistente - horarioNuevo).Duration();

                    if (diferencia < TimeSpan.FromMinutes(30))
                    {
                        return true; // Turno conflictivo
                    }
                }

                return false; // Todo ok
            }
        }


        // [+] ---------- ASIGNAR LEGAJO --------- [+]

        public string ObtenerSiguienteCodigoTurno()
        {

            using (SqlConnection conexion = ObtenerConexion())
            {
                conexion.Open();

                // Traer el último código insertado (mayor valor numérico)
                string consultaSQL = "SELECT MAX(Cod_Turno) FROM Turnos";
                SqlCommand comando = new SqlCommand(consultaSQL, conexion);

                object resultado = comando.ExecuteScalar();

                if (resultado != null && resultado != DBNull.Value)
                {
                    string ultimoCodigo = resultado.ToString(); // ej: "TUR00014"

                    // Extraer parte numérica → "00014"
                    string parteNumerica = ultimoCodigo.Substring(3);

                    // Convertir a int, sumar 1
                    int numero = int.Parse(parteNumerica) + 1;

                    // Reconstruir nuevo código con ceros adelante
                    return "TUR" + numero.ToString("D5"); // D5 → 5 dígitos con ceros
                }
                else
                {
                    // Si no hay ningún registro, comenzar en TUR00001
                    return "TUR00001";
                }
            }
        }

        // [+] ---------- ASIGNAR TURNO ---------- [+]

        public void InsertarTurno(Turnos turno)
        {

            turno._Cod_Turno = ObtenerSiguienteCodigoTurno();

            using (SqlConnection conexion = ObtenerConexion())
            {
                conexion.Open();

                string consultaSQL = @"INSERT INTO Turnos 
                (Cod_Turno, LegajoMedico_Turnos, DNIPaciente_Turnos, LegajoAdmin_Turnos, Dia_Turnos, Horarios_Turnos)
                 VALUES (@Cod_Turno, @LegajoMedico, @DNI, @CodAdmin, @Dia, @Horario)";

                using (SqlCommand comando = new SqlCommand(consultaSQL, conexion))
                {
                    comando.Parameters.AddWithValue("@Cod_Turno", turno._Cod_Turno);
                    comando.Parameters.AddWithValue("@LegajoMedico", turno._LegajoMedico_Turno);
                    comando.Parameters.AddWithValue("@DNI", turno._DNIPaciente_Turno);
                    comando.Parameters.AddWithValue("@CodAdmin", turno._LegajoAdmin_Turno);

                    DateTime.TryParseExact(turno._Dia_Turno, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime fechaTurno);
                    comando.Parameters.AddWithValue("@Dia", fechaTurno); // tipo DATE

                    TimeSpan.TryParse(turno._Horarios_Turno, out TimeSpan horarioTurno);
                    comando.Parameters.AddWithValue("@Horario", horarioTurno); // tipo TIME

                    comando.ExecuteNonQuery(); // Ejecuta el insert
                }
            }
        }

        // ------------------------

        public DataTable ObtenerMeses()
        {
            using (SqlConnection conexion = ObtenerConexion())
            {
                conexion.Open();
                string query = "SELECT DISTINCT MONTH(Dia_Turnos) AS Mes FROM Turnos ORDER BY Mes";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conexion);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return dt;
            }
        }
        public DataTable ObtenerAnios()
        {
            using (SqlConnection conexion = ObtenerConexion())
            {
                conexion.Open();
                string query = "SELECT DISTINCT YEAR(Dia_Turnos) AS Anio FROM Turnos ORDER BY Anio";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conexion);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return dt;
            }
        }

        public string ObtenerMedicosConMasTurnos(int mes, int anio)
        {
            SqlConnection conexion = ObtenerConexion();
            conexion.Open();

            string consulta = @"
        SELECT LegajoMedico_Turnos, COUNT(DISTINCT DNIPaciente_Turnos) AS CantidadPacientes
        FROM Turnos
        WHERE MONTH(Dia_Turnos) = @Mes AND YEAR(Dia_Turnos) = @Anio
        GROUP BY LegajoMedico_Turnos
        HAVING COUNT(DISTINCT DNIPaciente_Turnos) = (
            SELECT MAX(CantidadPacientes)
            FROM (
                SELECT COUNT(DISTINCT DNIPaciente_Turnos) AS CantidadPacientes
                FROM Turnos
                WHERE MONTH(Dia_Turnos) = @Mes AND YEAR(Dia_Turnos) = @Anio
                GROUP BY LegajoMedico_Turnos
            ) AS Subconsulta
        )";

            SqlCommand comando = new SqlCommand(consulta, conexion);
            comando.Parameters.AddWithValue("@Mes", mes);
            comando.Parameters.AddWithValue("@Anio", anio);

            SqlDataReader lector = comando.ExecuteReader();
            List<string> resultados = new List<string>();

            while (lector.Read())
            {
                string legajo = lector["LegajoMedico_Turnos"].ToString();
                int cantidad = Convert.ToInt32(lector["CantidadPacientes"]);
                resultados.Add($"{legajo} ({cantidad})");
            }

            conexion.Close();

            return string.Join(" - ", resultados);
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





   


