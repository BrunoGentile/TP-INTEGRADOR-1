using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;
using System.Data;
using Entidades;
using System.Runtime.CompilerServices;

namespace Datos
{
    public class GestionMedicos
    {
        //CONEXION A LA BASE DE DATOS
        private string Conexion = @"Data Source=localhost\SQLEXPRESS; Initial Catalog=ClinicaGrupo15;Integrated Security = True";
        
        //OBJETO DE LA CLASE MEDICOS
        Medicos _Medico = new Medicos();

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

        public void actualizarMedicos(Medicos medico) { 
            SqlConnection conexion = ObtenerConexion();
            conexion.Open();
            String ConsultaSQL = "UPDATE Medicos SET Nombre_Medico = @Nombre, Apellido_Medico = @Apellido, CodEspecialidad_Medico = @Especialidad, " +
                "Correo_Medico = @Correo, Telefono_Medico = @Telefono, Sexo_Medico = @Sexo, Nacionalidad_Medico = @Nacionalidad, Provincia_Medico = @Provincia," + 
                "Ciudad_Medico = @Ciudad, Direccion_Medico = @Direccion, DiasAtencion_Medico = @DiasAtencion, HorarioInicio_Medico = @HorarioInicio, " +
                "HorarioFin_Medico = @HorarioFin WHERE Legajo_Medico = @Legajo";
            SqlCommand comando = new SqlCommand(ConsultaSQL, conexion);

            comando.Parameters.AddWithValue("@Legajo", medico.Legajo_Medico);
            comando.Parameters.AddWithValue("@Nombre", medico.Nombre_Medico);
            comando.Parameters.AddWithValue("@Apellido", medico.Apellido_Medico);
            comando.Parameters.AddWithValue("@Especialidad", medico.CodEspecialidad_Medico);
            comando.Parameters.AddWithValue("@Correo", medico.Correo_Medico);
            comando.Parameters.AddWithValue("@Telefono", medico.Telefono_Medico);
            comando.Parameters.AddWithValue("@Sexo", medico.Sexo_Medico);
            comando.Parameters.AddWithValue("@Nacionalidad", medico.Nacionalidad_Medico);
            comando.Parameters.AddWithValue("@Provincia", medico.Provincia_Medico);
            comando.Parameters.AddWithValue("@Ciudad", medico.Ciudad_Medico);
            comando.Parameters.AddWithValue("@Direccion", medico.Direccion_Medico);
            comando.Parameters.AddWithValue("@DiasAtencion", medico.DiasAtencion_Medico);
            comando.Parameters.AddWithValue("@HorarioInicio", medico.HorarioInicio_Medico);
            comando.Parameters.AddWithValue("@HorarioFin", medico.HorarioFin_Medico);

            //executar el comando
            comando.ExecuteNonQuery();
            ObtenerConexion().Close();
        }

        // -------------------------------------------------------------------------------------------------
        // --------------------------------------------- LOGIN ---------------------------------------------
        // -------------------------------------------------------------------------------------------------

        // [+] ---------- VERIFICACIÓN DE USUARIOS ---------- [+]

        public int ValidarLogin(string Legajo, string Password)
        {
            
            int Respuesta = 0; // USUARIO NO VÁLIDO POR DEFECTO

            /* USING PARA MANEJAR LA CONEXIÓN Y CERRARLA LUEGO AUTOMÁTICAMENTE
            AL SALIR EJECUTA Dispose() DE SqlConnection QUE CONTIENE LLAMADA INTERNA A Close() */
            using ( SqlConnection conexion = ObtenerConexion() )
            {
                
                conexion.Open();
                
                SqlCommand comando = new SqlCommand("SELECT * FROM Medicos WHERE Legajo_Medico = @Legajo AND Contraseña_Medico = @Password", conexion);
                comando.Parameters.AddWithValue("@Legajo", Legajo);
                comando.Parameters.AddWithValue("@Password", Password);
                
                // EJECUTAR COMANDO SQL Y OBTENER RESULTADO
                SqlDataReader reader = comando.ExecuteReader();
                
                // VERIFICAR SI HAY FILAS QUE COINCIDEN CON LA CONSULTA
                if (reader.HasRows)
                {
                    Respuesta = 2; // USUARIO MÉDICO VÁLIDO
                }
                else
                {
                    Respuesta = 0; // USUARIO NO VÁLIDO
                }

                reader.Close();

            }
            
            return Respuesta;

        }

        // [+] ---------- OBTENER USUARIO MÉDICO ---------- [+]

        public string ObtenerUsuario(string TB_Legajo)
        {

            string NombreCompleto = string.Empty;
            using (SqlConnection conexion = ObtenerConexion())
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand("SELECT Nombre_Medico, Apellido_Medico FROM Medicos WHERE Legajo_Medico = @Legajo", conexion);
                comando.Parameters.AddWithValue("@Legajo", TB_Legajo);
                
                SqlDataReader reader = comando.ExecuteReader();
                
                if (reader.Read())
                {
                    NombreCompleto = $"{reader["Nombre_Medico"]}" + ", " + $"{reader["Apellido_Medico"]}";
                }

                reader.Close();
            }
            
            return NombreCompleto;

        }

    }
}
