using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Entidades;
using Negocio;

namespace TP_INTEGRADOR_15
{
    public partial class AsignarTurnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LBL_UserName.Text = Session["Usuario"].ToString();
                CargarEspecialidades();
                CargarMedicos();
                CargarDiasDisponibles();
                CargarHorarios();
            }

        }

        // [+] ---------- CARGAR ESPECIALIDADES ---------- [+]
        protected void CargarEspecialidades()
        {
            NegocioTurnos _NegTurnos = new NegocioTurnos();
            DDL_Especialidad.DataSource = _NegTurnos.CargarEspecialidades();
            DDL_Especialidad.DataTextField = "Especialidad";
            DDL_Especialidad.DataValueField = "Cod_Especialidad";
            DDL_Especialidad.DataBind();
        }

        // [+] ---------- CARGAR MÉDICOS POR ESPECIALIDAD ---------- [+]
        protected void CargarMedicos()
        {
            NegocioTurnos _NegTurnos = new NegocioTurnos();
            DDL_Medicos.DataSource = _NegTurnos.CargarMedicosPorEspecialidad(DDL_Especialidad.SelectedValue);
            DDL_Medicos.DataTextField = "NombreCompleto";
            DDL_Medicos.DataValueField = "Legajo_Medico";
            DDL_Medicos.DataBind();
        }

        // [+] ---------- CARGAR HORARIOS DISPONIBLES DEL MÉDICO ---------- [+]

        protected void CargarHorarios()
        {
            NegocioTurnos _NegTurnos = new NegocioTurnos();
            LBL_HSMedico.Text = _NegTurnos.CargarHorariosDisponibles(DDL_Medicos.SelectedValue);
        }


        // [+] ---------- MOSTRAR DÍAS EN EL QUE EL MÉDICO TIENE TURNOS DISPONIBLES ---------- [+]

        protected void CargarDiasDisponibles()
        {
            NegocioTurnos _NegTurnos = new NegocioTurnos();
            DDL_Dias.DataSource = _NegTurnos.CargarDiasDisponibles(DDL_Medicos.SelectedValue);
            DDL_Dias.DataTextField = "DIA";
            DDL_Dias.DataValueField = "DIA";
            DDL_Dias.DataBind();
        }

        protected void DDL_Especialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarMedicos();
            CargarHorarios();
        }

        protected void DDL_Medicos_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDiasDisponibles();
            CargarHorarios();
        }

    }
}