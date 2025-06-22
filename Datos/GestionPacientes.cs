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
    public class GestionPacientes
    {
        //CONEXION A LA BASE DE DATOS
        private string Conexion = @"Data Source=localhost\SQLEXPRESS; Initial Catalog=ClinicaGrupo15;Integrated Security = True";

        //OBJETO DE LA CLASE PACIENTES
        Pacientes Paciente = new Pacientes();

        //OBTENER CONEXION
        private SqlConnection ObtenerConexion()
        {

            SqlConnection conexion = new SqlConnection(Conexion);
            return conexion;

        }

        //Métodos
        public void insertarPaciente(string nombre, string apellido, string DNI, string Sexo, string Nacionalidad, string FechaNac, string Direc, string Prov, string Localidad, string Correo, string Telefono)
        {
            SqlConnection conexion = ObtenerConexion();
            conexion.Open();
            string consultaSQL = @"
            INSERT INTO Pacientes 
            (DNI_Paciente, Nombre_Paciente, Apellido_Paciente, Sexo_Paciente, FechaNacimiento_Paciente, Correo_Paciente, Telefono_Paciente, Direccion_Paciente, CodCiudad_Paciente, CodProvincia_Paciente)
            VALUES 
            (@DNI, @Nombre, @Apellido, @Sexo, @FechaNac, @Correo, @Telefono, @Direccion, @Ciudad, @Provincia)";

            SqlCommand comando = new SqlCommand(consultaSQL, conexion);

            DateTime fechaNac;

            DateTime.TryParse(FechaNac, out fechaNac);

            comando.Parameters.AddWithValue("@DNI", DNI);
            comando.Parameters.AddWithValue("@Nombre", nombre);
            comando.Parameters.AddWithValue("@Apellido", apellido);
            comando.Parameters.AddWithValue("@Sexo", Sexo);
            comando.Parameters.AddWithValue("@FechaNac", fechaNac);
            //comando.Parameters.AddWithValue("@Nacionalidad", Nacionalidad);
            comando.Parameters.AddWithValue("@Correo", Correo);
            comando.Parameters.AddWithValue("@Telefono", Telefono);
            comando.Parameters.AddWithValue("@Direccion", Direc);
            comando.Parameters.AddWithValue("@Ciudad", Localidad);
            comando.Parameters.AddWithValue("@Provincia", Prov);

            comando.ExecuteNonQuery();
            conexion.Close();
        }

        //DropDownList Provincias
        public DataTable Provincias()
        {
            SqlConnection conexion = ObtenerConexion();
            conexion.Open();

            string consultaSQL = @"SELECT * FROM Provincias";
            SqlCommand sqlCommand = new SqlCommand(consultaSQL, conexion);

            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();

            DataTable ddlProvincias = new DataTable();

            ddlProvincias.Load(sqlDataReader);

            conexion.Close();
            return ddlProvincias;
        }


        //DropDownList Localidades
        public DataTable Localidades(string codProvincia)
        {
            SqlConnection conexion = ObtenerConexion();
            conexion.Open();

            string consultaSQL = @"SELECT * FROM Ciudades WHERE CodProvincia = @CodProvincia";

            SqlCommand comando = new SqlCommand(consultaSQL, conexion);

            comando.Parameters.AddWithValue("@CodProvincia", codProvincia);

            SqlDataReader sqlDataReader = comando.ExecuteReader();
            DataTable ddlLocalidades = new DataTable();
            ddlLocalidades.Load(sqlDataReader);

            conexion.Close();
            return ddlLocalidades;
        }

        // [+] ---------- LISTAR PACIENTES ( TODOS LOS CAMPOS ) ---------- [+]

        public DataTable ListarPacientes()
        {

            SqlConnection conexion = ObtenerConexion();
            conexion.Open();

            string consultaSQL = @"
            SELECT 
                DNI_Paciente, 
                Nombre_Paciente, 
                Apellido_Paciente, 
                Sexo_Paciente, 
                FechaNacimiento_Paciente, 
                Correo_Paciente, 
                Telefono_Paciente, 
                Direccion_Paciente, 
                Desc_Ciudad, 
                Desc_Provincia,
                Nacionalidad_Paciente    
            FROM Pacientes INNER JOIN Ciudades
                ON CodCiudad_Paciente = CodPostal_Ciudad AND CodProvincia_Paciente = CodProvincia
            INNER JOIN Provincias
                ON Ciudades.CodProvincia = Provincias.CodProvincia";

            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            SqlDataReader sqlDataReader = comando.ExecuteReader(); // DEVUELVE OBJETO SQLDataReader - Apuntador
            DataTable DTPacientes = new DataTable();

            DTPacientes.Load(sqlDataReader); // ALMACENO CADA FILA DEL SQLDataReader EN UN DataTable

            conexion.Close();
            return DTPacientes;
        }

        // [+] ---------- TRAER DATOS DEL PACIENTE ---------- [+]

        public Pacientes TraerDatosPaciente(Pacientes Paciente)
        {
            
            SqlConnection conexion = ObtenerConexion();
            conexion.Open();

            string consultaSQL = @"
            SELECT 
                DNI_Paciente, 
                Nombre_Paciente, 
                Apellido_Paciente, 
                Sexo_Paciente, 
                FechaNacimiento_Paciente, 
                Correo_Paciente, 
                Telefono_Paciente, 
                Direccion_Paciente, 
                CodCiudad_Paciente, 
                CodProvincia_Paciente
            FROM Pacientes
            WHERE DNI_Paciente = @DNI";
            
            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            comando.Parameters.AddWithValue("@DNI", Paciente.DNI_Paciente);

            SqlDataReader sqlDataReader = comando.ExecuteReader();

            if (sqlDataReader.Read())
            {
                Paciente.DNI_Paciente = Paciente.DNI_Paciente == string.Empty ? sqlDataReader["DNI_Paciente"].ToString() :  Paciente.DNI_Paciente;
                Paciente.Nombre_Paciente = Paciente.Nombre_Paciente == string.Empty ? sqlDataReader["Nombre_Paciente"].ToString() : Paciente.Nombre_Paciente;
                Paciente.Apellido_Paciente = Paciente.Apellido_Paciente == string.Empty ? sqlDataReader["Apellido_Paciente"].ToString() : Paciente.Apellido_Paciente;
                Paciente.Sexo_Paciente = Paciente.Sexo_Paciente == string.Empty ? sqlDataReader["Sexo_Paciente"].ToString() : Paciente.Sexo_Paciente;
                Paciente.FechaNacimiento_Paciente = Paciente.FechaNacimiento_Paciente == string.Empty ? sqlDataReader["FechaNacimiento_Paciente"].ToString() : Paciente.FechaNacimiento_Paciente;
                Paciente.Correo_Paciente = Paciente.Correo_Paciente == string.Empty ? sqlDataReader["Correo_Paciente"].ToString() : Paciente.Correo_Paciente;
                Paciente.Telefono_Paciente = Paciente.Telefono_Paciente == string.Empty ? sqlDataReader["Telefono_Paciente"].ToString() : Paciente.Telefono_Paciente;
                Paciente.Direccion_Paciente = Paciente.Direccion_Paciente == string.Empty ? sqlDataReader["Direccion_Paciente"].ToString() : Paciente.Direccion_Paciente;
                Paciente.Provincia_Paciente = Paciente.Provincia_Paciente == string.Empty ? sqlDataReader["CodProvincia_Paciente"].ToString() : Paciente.Provincia_Paciente;
                Paciente.Localidad_Paciente = Paciente.Localidad_Paciente == string.Empty ? sqlDataReader["CodCiudad_Paciente"].ToString() : Paciente.Localidad_Paciente;

            }
            
            conexion.Close();
            return Paciente;
        }

        // [+] ---------- ACTUALIZAR PACIENTE ---------- [+]

        public void ActualizarPaciente(Pacientes Paciente)
        {

            SqlConnection conexion = ObtenerConexion();
            conexion.Open();

            string consultaSQL = @"
            UPDATE Pacientes 
            SET 
                Nombre_Paciente = @Nombre, 
                Apellido_Paciente = @Apellido, 
                Sexo_Paciente = @Sexo, 
                FechaNacimiento_Paciente = @FechaNac, 
                Correo_Paciente = @Correo, 
                Telefono_Paciente = @Telefono, 
                Direccion_Paciente = @Direccion
            WHERE DNI_Paciente = @DNI";

            SqlCommand comando = new SqlCommand(consultaSQL, conexion);
            DateTime fechaNac;
            DateTime.TryParse(Paciente.FechaNacimiento_Paciente, out fechaNac);

            comando.Parameters.AddWithValue("@DNI", Paciente.DNI_Paciente);
            comando.Parameters.AddWithValue("@Nombre", Paciente.Nombre_Paciente);
            comando.Parameters.AddWithValue("@Apellido", Paciente.Apellido_Paciente);
            comando.Parameters.AddWithValue("@Sexo", Paciente.Sexo_Paciente);
            comando.Parameters.AddWithValue("@FechaNac", fechaNac);
            //comando.Parameters.AddWithValue("@Nacionalidad", Paciente.Nacionalidad_Paciente);
            comando.Parameters.AddWithValue("@Correo", Paciente.Correo_Paciente);
            comando.Parameters.AddWithValue("@Telefono", Paciente.Telefono_Paciente);
            comando.Parameters.AddWithValue("@Direccion", Paciente.Direccion_Paciente);
            // comando.Parameters.AddWithValue("@Ciudad", Paciente.Localidad_Paciente);
            // comando.Parameters.AddWithValue("@Provincia", Paciente.Provincia_Paciente);
            comando.ExecuteNonQuery();
            conexion.Close();

        }
    }
}
