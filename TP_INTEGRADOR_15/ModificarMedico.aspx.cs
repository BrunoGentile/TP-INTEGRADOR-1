using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using Negocio;
using Entidades;

namespace TP_INTEGRADOR_15
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        private string Usuario = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                // Si el Session no contiene el usuario, redirigir a la página de inicio de sesión
                Response.Redirect("Login.aspx");
            } else
            {
                lblNombreUsuario.Text = Session["Usuario"].ToString();
            }

            if (!IsPostBack)
            {
                cargarGridView();
            }
        }

        public void cargarGridView()
        {
            if (txtFiltrado.Text == string.Empty)
            {
                NegocioMedicos negocioMedicos = new NegocioMedicos();
                gvMedico.DataSource = negocioMedicos.ObtenerMedicos();
                gvMedico.DataBind();
            }
            else
            {
                NegocioMedicos _NegMedicos = new NegocioMedicos();
                gvMedico.DataSource = _NegMedicos.filtrarMedicosPorLegajo(txtFiltrado.Text);
                gvMedico.DataBind();
            }

        }

       
        //CANCELAR
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMedico.EditIndex = e.NewEditIndex;

            // Volver a cargar los datos al editar
            cargarGridView();
        }

        //EDITAR
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMedico.EditIndex = -1;

            // Volver a cargar los datos al cancelar la edición
            cargarGridView();
        }

        //ACTUALIZAR
        protected void gvMedico_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string legajo = ((Label)gvMedico.Rows[e.RowIndex].FindControl("lbl_Eit_Legajo")).Text;
            string nombre = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtNombre")).Text;
            string apellido = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtApellido")).Text;

            string especialidad = ((DropDownList)gvMedico.Rows[e.RowIndex].FindControl("DDL_EIT_Especialidades")).SelectedValue;

            string correo = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtCorreo")).Text;
            string telefono = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtTelefono")).Text;

            string sexo = ((RadioButtonList)gvMedico.Rows[e.RowIndex].FindControl("RBL_Sexo")).SelectedValue;

            string nacionalidad = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtNacionalidad")).Text;

            string provincia = ((DropDownList)gvMedico.Rows[e.RowIndex].FindControl("DDL_EIT_Provincias")).SelectedItem.Text;
            string ciudad = ((DropDownList)gvMedico.Rows[e.RowIndex].FindControl("DDL_EIT_Ciudades")).SelectedItem.Text;

            string direccion = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtDireccion")).Text;
            string diasAtencion = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtDiasAtencion")).Text;
            string horaInicio = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtHoraInicio")).Text;
            string horaFin = ((TextBox)gvMedico.Rows[e.RowIndex].FindControl("txtHoraFin")).Text;

            // Crear una instancia de Medicos con los datos actualizados

            Medicos medico = new Medicos
            {
                Legajo_Medico = legajo,
                Nombre_Medico = nombre,
                Apellido_Medico = apellido,
                CodEspecialidad_Medico = especialidad,
                Correo_Medico = correo,
                Telefono_Medico = telefono,
                Sexo_Medico = sexo,
                Nacionalidad_Medico = nacionalidad,
                Provincia_Medico = provincia,
                Ciudad_Medico = ciudad,
                Direccion_Medico = direccion,
                DiasAtencion_Medico = diasAtencion,
                HorarioInicio_Medico = horaInicio,
                HorarioFin_Medico = horaFin
            };

            // Llamar al método de actualización en la capa de negocio
            NegocioMedicos negocioMedicos = new NegocioMedicos();
            negocioMedicos.ActualizarMedico(medico);

            gvMedico.EditIndex = -1;
            cargarGridView();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            NegocioMedicos negocioMedicos = new NegocioMedicos();

            if (negocioMedicos.existeLegajoMedico(txtFiltrado.Text.Trim()))
            {
                DataTable dtFiltrado = negocioMedicos.filtrarMedicosPorLegajo(txtFiltrado.Text.Trim());
                gvMedico.DataSource = dtFiltrado;
                gvMedico.DataBind();

                lblLegajoInexistente.Text = string.Empty; // Limpiar mensaje de error si el legajo si existe
                
            }
            else
            {
                lblLegajoInexistente.Text = "El legajo ingresado no existe.";
            }

 
        }

        protected void gvMedico_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnReiniciar_Click(object sender, EventArgs e)
        {
            txtFiltrado.Text = string.Empty;
            cargarGridView();

            lblLegajoInexistente.Text = string.Empty;
        }

        protected void gvMedico_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMedico.PageIndex = e.NewPageIndex;
            cargarGridView();
        }

        protected void gvMedico_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState.HasFlag(DataControlRowState.Edit))
            {
                // LISTAR ESPECIALIDADES
                NegocioMedicos _NegMedicos = new NegocioMedicos();

                DropDownList DDLEspecialidades = (DropDownList)e.Row.FindControl("DDL_EIT_Especialidades");
                DDLEspecialidades.DataSource = _NegMedicos.ListarEspecialidad();
                DDLEspecialidades.DataTextField = "Especialidad";
                DDLEspecialidades.DataValueField = "Cod_Especialidad";
                DDLEspecialidades.DataBind();
                DDLEspecialidades.Items.Insert(0, new ListItem("-- Seleccione una Especialidad --", "0"));

                // CARGAR PROVINCIAS
                NegocioPacientes _NegPacientes = new NegocioPacientes();

                DropDownList ddlProvincias = (DropDownList)e.Row.FindControl("DDL_EIT_Provincias");
                ddlProvincias.DataSource = _NegPacientes.listarProvincias();
                ddlProvincias.DataTextField = "Desc_Provincia";
                ddlProvincias.DataValueField = "CodProvincia";
                ddlProvincias.DataBind();

                // CARGAR LOCALIDADES SEGÚN LA PROVINCIA SELECCIONADA
                DropDownList ddlLocalidades = (DropDownList)e.Row.FindControl("DDL_EIT_Ciudades");
                string codProvincia = ((DropDownList)e.Row.FindControl("DDL_EIT_Provincias")).Text;
                ddlLocalidades.DataSource = _NegPacientes.listarLocalidades(codProvincia);
                ddlLocalidades.DataTextField = "Desc_Ciudad";
                ddlLocalidades.DataValueField = "CodPostal_Ciudad";

                ddlLocalidades.DataBind();
            }
        }

        protected void DDL_EIT_Provincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlProvincia = (DropDownList)sender;

            // BUSCO LA FILA DEL GRIDVIEW QUE CONTIENE EL DROPDOWNLIST
            GridViewRow fila = (GridViewRow)ddlProvincia.NamingContainer;

            DropDownList ddlCiudad = (DropDownList)fila.FindControl("DDL_EIT_Ciudades");

            // Cargo las ciudades correspondientes
            NegocioPacientes _Neg = new NegocioPacientes();
            ddlCiudad.DataSource = _Neg.listarLocalidades(ddlProvincia.SelectedValue);
            ddlCiudad.DataTextField = "Desc_Ciudad";
            ddlCiudad.DataValueField = "CodPostal_Ciudad";
            ddlCiudad.DataBind();
        }
    }
}