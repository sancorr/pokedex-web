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
	public partial class PokeMaster : System.Web.UI.MasterPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				imageAvatar.ImageUrl = "https://imgs.search.brave.com/UoEGoEVhpqRO83GQUva4-8Xw_r1PhAGKGtCKmb9aaDA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA4Lzc1LzQ1Lzk3/LzM2MF9GXzg3NTQ1/OTcxOV84aTdKM2F0/R2JzRG9SUFQwWlcw/RGpCcGdBRlZUcktB/ZS5qcGc";

				if (!(Page is Login || Page is Registro || Page is Default || Page is Error || Page is DetallePokemon))
				{
					if(!Seguridad.sesionActiva(Session["user"]))
					{
						Response.Redirect("Login.aspx", false);
					}
					else
					{
						Entrenador user = (Entrenador)Session["user"];
						lblUser.Text = user.Email;
						if (!string.IsNullOrEmpty(user.ImagenPerfil))
							imageAvatar.ImageUrl = "~/Images/Perfil/" + user.ImagenPerfil;
					}
				}
				else if((Page is Default || Page is Error || Page is DetallePokemon) && Seguridad.sesionActiva(Session["user"]))
				{
					Entrenador user = (Entrenador)Session["user"];
					lblUser.Text = user.Email;
					if (!string.IsNullOrEmpty(user.ImagenPerfil))
						imageAvatar.ImageUrl = "~/Images/Perfil/" + user.ImagenPerfil;
				}
			}
		}

		protected void btnIngresar_Click(object sender, EventArgs e)
		{
			Response.Redirect("Login.aspx", false);
		}

		protected void btnRegistrarse_Click(object sender, EventArgs e)
		{
			Response.Redirect("Registro.aspx", false);
		}

		protected void btnSalir_Click(object sender, EventArgs e)
		{
			Session.Clear();
			Response.Redirect("Login.aspx", false);
		}
	}
}