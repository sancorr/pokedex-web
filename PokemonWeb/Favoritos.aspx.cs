using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace PokemonWeb
{
	public partial class Favoritos : System.Web.UI.Page
	{
		public List<Pokemon> Lista { get; set; }
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				if (Seguridad.sesionActiva(Session["user"]))
				{
					List<Pokemon> favoritos = (List<Pokemon>)Session["favoritos"];
					if(favoritos != null)
					{
						if (favoritos.Count == 0)
						{
							lblMsjFav.Text = "¡Aún no tienes pokemons favoritos, agrega algunos para empezar a verlos!";
							lblMsjFav.Visible = true;
						}

						Lista = favoritos;
						RepeaterFavoritos.DataSource = Lista;
						RepeaterFavoritos.DataBind();
					}
					else
					{
						lblMsjFav.Text = "¡Aún no tienes pokemons favoritos, agrega algunos para empezar a verlos!";
						lblMsjFav.Visible = true;
					}
					
				}//creo que no hace falta redirigir a login porque no hay acceso a esta ventana si no hay sesion en "user"
			}
		}
		protected void btnEliminarFavoritos_Click(object sender, EventArgs e)
		{
			try
			{
				string id = ((Button)sender).CommandArgument;
				PokemonNegocio negocio = new PokemonNegocio();
				List<Pokemon> favoritos = (List<Pokemon>)Session["favoritos"];
				Pokemon seleccionado = negocio.listar(id).Find(x => x.Id == int.Parse(id));
				favoritos.RemoveAll(x => x.Id == seleccionado.Id);
				Session["favoritos"] = favoritos;

				if(favoritos != null)
				{
					if(favoritos.Count == 0)
					{
						lblMsjFav.Text = "¡Aún no tienes pokemons favoritos, agrega algunos para empezar a verlos!";
						lblMsjFav.Visible = true;
					}

					Lista = favoritos;
					RepeaterFavoritos.DataSource = Lista;
					RepeaterFavoritos.DataBind();
				}
				else
				{
					lblMsjFav.Text = "¡Aún no tienes pokemons favoritos, agrega algunos para empezar a verlos!";
					lblMsjFav.Visible = true;
				}
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