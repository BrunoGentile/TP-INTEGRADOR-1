using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_INTEGRADOR_15
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                // MUESTRA EL NOMBRE DEL USUARIO LOGUEADO
                LBL_UserName.Text = Session["Usuario"].ToString(); 

                // CARGA EL GRIDVIEW CON LOS PACIENTES
                CargarGridView();
            }

        }

        // [+] ---------- CARGAR GRID VIEW ---------- [+]
        protected void CargarGridView()
        {
            NegocioPacientes _NegPacientes = new NegocioPacientes();
            GV_Pacientes.DataSource = _NegPacientes.ListarPacientes();
            GV_Pacientes.DataBind();
        }

        // [+] ---------- PAGINACIÓN ---------- [+]
        protected void GV_Pacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GV_Pacientes.PageIndex = e.NewPageIndex;
            CargarGridView();
        }

        // [+] ---------- BOTÓN EDITAR ---------- [+]
        protected void GV_Pacientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GV_Pacientes.EditIndex = e.NewEditIndex;
            CargarGridView();
        }

        // [+] ---------- BOTÓN CANCELAR ---------- [+]
        protected void GV_Pacientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GV_Pacientes.EditIndex = -1;
            CargarGridView();
        }

        // [+] ---------- BOTÓN ACTUALIZAR ---------- [+]
        protected void GV_Pacientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            Pacientes _Paciente = new Pacientes();

            _Paciente.DNI_Paciente = ((Label)GV_Pacientes.Rows[e.RowIndex].FindControl("LBL_EIT_DNI")).Text;
            _Paciente.Nombre_Paciente = ((TextBox)GV_Pacientes.Rows[e.RowIndex].FindControl("TB_EIT_Nombre")).Text;
            _Paciente.Apellido_Paciente = ((TextBox)GV_Pacientes.Rows[e.RowIndex].FindControl("TB_EIT_Apellido")).Text;
            _Paciente.Sexo_Paciente = ((Label)GV_Pacientes.Rows[e.RowIndex].FindControl("LBL_EIT_Sexo")).Text;
            _Paciente.Nacionalidad_Paciente = ((TextBox)GV_Pacientes.Rows[e.RowIndex].FindControl("TB_EIT_Nacionalidad")).Text;
            _Paciente.FechaNacimiento_Paciente = ((Label)GV_Pacientes.Rows[e.RowIndex].FindControl("LBL_EIT_FechaNacimiento")).Text;
            _Paciente.Direccion_Paciente = ((TextBox)GV_Pacientes.Rows[e.RowIndex].FindControl("TB_EIT_Direccion")).Text;
            _Paciente.Provincia_Paciente = ((Label)GV_Pacientes.Rows[e.RowIndex].FindControl("LBL_EIT_Provincia")).Text;
            _Paciente.Localidad_Paciente = ((Label)GV_Pacientes.Rows[e.RowIndex].FindControl("LBL_EIT_Ciudad")).Text;
            _Paciente.Correo_Paciente = ((TextBox)GV_Pacientes.Rows[e.RowIndex].FindControl("TB_EIT_Correo")).Text;
            _Paciente.Telefono_Paciente = ((TextBox)GV_Pacientes.Rows[e.RowIndex].FindControl("TB_EIT_Telefono")).Text;

            NegocioPacientes _NegPacientes = new NegocioPacientes();
            _NegPacientes.ActualizarPaciente(_Paciente);
            
            GV_Pacientes.EditIndex = -1;
            CargarGridView();   

        }
    }
}