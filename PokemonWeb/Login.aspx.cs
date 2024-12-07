using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace PokemonWeb
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void btnIngresarEntrenador_Click(object sender, EventArgs e)
		{
			try
			{
				Entrenador user = new Entrenador();
				EntrenadorNegocio negocio = new EntrenadorNegocio();

				user.Email = tbxEntrenadorIngreso.Text;
				user.Pass = tbxPasswordEntrenadorIngreso.Text;

				if (negocio.logInTrainer(user))
				{
					Session.Add("user", user);
					Response.Redirect("MiPerfil.aspx", false);
				}
				else
				{
					Session.Add("error", "Hubo un error en el login, intente nuevamente");
					Response.Redirect("Error.aspx", false);
				}
			}
			catch (Exception ex)
			{
				Session.Add("error", ex.ToString());
			}
		}

		protected void btnCancelarIngreso_Click(object sender, EventArgs e)
		{
			Response.Redirect("Default.aspx", false);
		}
	}
}