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
	public partial class Registro : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void btnRegistrarEntrenador_Click(object sender, EventArgs e)
		{
			try
			{
				Page.Validate();
				if (!Page.IsValid)
					return;

				EntrenadorNegocio entrenadorNegocio = new EntrenadorNegocio();
				Entrenador user = new Entrenador();				

				user.Email = tbxEmailEntrenador.Text;
				user.Pass = tbxPasswordEntrenador.Text;
				user.Id = entrenadorNegocio.insertarTrainer(user);
				Session.Add("user", user);
				
				Response.Redirect("Default.aspx", false);
			}
			catch (Exception ex)
			{
				Session.Add("error", ex.ToString());
			}
		}

		private void Page_Error(object sender, EventArgs e)
		{
			Exception exc = Server.GetLastError();

			Session.Add("error", exc.ToString());
			Server.Transfer("Error.aspx");
		}
	}
}