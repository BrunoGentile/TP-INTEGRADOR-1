using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP_INTEGRADOR_15
{
    public partial class BajaMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarGridView();
            }
        }

        public void cargarGridView()
        {
            NegocioMedicos negocioMedicos = new NegocioMedicos();
            gvMedico.DataSource = negocioMedicos.ObtenerMedicos();
            gvMedico.DataBind();
        }

        
    }
}