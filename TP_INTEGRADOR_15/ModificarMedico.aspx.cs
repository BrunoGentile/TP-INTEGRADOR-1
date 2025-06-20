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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NegocioMedicos negocioMedicos = new NegocioMedicos();

                gvMedico.DataSource = negocioMedicos.ObtenerMedicos();
                gvMedico.DataBind();
            }
        }

        //CANCELAR
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMedico.EditIndex = e.NewEditIndex;

            // Volver a cargar los datos al editar
            gvMedico.DataBind();
        }

        //EDITAR
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMedico.EditIndex = -1;

            // Volver a cargar los datos al cancelar la edición
            gvMedico.DataBind();
        }

        //ACTUALIZAR
        protected void gvMedico_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
    }
}