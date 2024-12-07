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
				EntrenadorNegocio entrenadorNegocio = new EntrenadorNegocio();
				Entrenador user = new Entrenador();
				EmailService email = new EmailService();

				user.Email = tbxEmailEntrenador.Text;
				user.Pass = tbxPasswordEntrenador.Text;
				user.Id = entrenadorNegocio.insertarTrainer(user);
				Session.Add("user", user);

				//email.armarEmail(entrenador.Email, "Bienvenido/a entrenador pokemon", "Te damos la bienvenida a la aplicacion");
				//email.enviarMail();
				Response.Redirect("Default.aspx", false);
			}
			catch (Exception ex)
			{
				Session.Add("error", ex.ToString());
			}
		}
	}
}