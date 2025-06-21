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

        protected void CargarGridView()
        {
            NegocioPacientes _NegPacientes = new NegocioPacientes();
            GV_Pacientes.DataSource = _NegPacientes.ListarPacientes();
            GV_Pacientes.DataBind();
        }

    }
}