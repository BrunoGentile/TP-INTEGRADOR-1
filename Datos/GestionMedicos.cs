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

        // -------------------------------------------------------------------------------------------------
        // --------------------------------------------- LOGIN ---------------------------------------------
        // -------------------------------------------------------------------------------------------------

        // [+] ---------- VERIFICACIÓN DE USUARIOS ---------- [+]

        public int ValidarLogin(string Legajo, string Password)
        {
            
            int Respuesta = 0; // USUARIO NO VÁLIDO POR DEFECTO

            /* USING PARA MANEJAR LA CONEXIÓN Y CERRARLA LUEGO AUTOMÁTICAMENTE
            AL SALIR EJECUTA Dispose() DE SqlConnection QUE CONTIENE LLAMADA INTERNA A Close() */
            using (SqlConnection conexion = ObtenerConexion())
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

    }
}
