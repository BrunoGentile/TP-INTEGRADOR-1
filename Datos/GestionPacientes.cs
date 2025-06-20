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

        //OBJETO DE LA CLASE MEDICOS
        Pacientes _Paciente = new Pacientes();

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
    }   
}
