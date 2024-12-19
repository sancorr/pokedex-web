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
	public partial class DetallePokemon : System.Web.UI.Page
	{
		public List<Pokemon> ListaPokemon { get; set; }
		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				if (!IsPostBack)
				{
					string id = Request.QueryString["id"];

					if (!string.IsNullOrEmpty(id))
					{
						PokemonNegocio negocio = new PokemonNegocio();
						ListaPokemon = negocio.listar(id);
						RepeaterDetalles.DataSource = ListaPokemon;
						RepeaterDetalles.DataBind();
					}
				}
			}
			catch (Exception ex)
			{
				Session.Add("error", ex.ToString());
			}
			
		}

		protected void btnFavoritos_Click(object sender, EventArgs e)
		{
			try
			{
				PokemonNegocio negocio = new PokemonNegocio();
				//Buscar el elemento LABEL dentro del contenedor de datos del boton que disparo el evento
				Button btn = (Button)sender;
				RepeaterItem i = (RepeaterItem)btn.NamingContainer;
				Label lblFavoritos = (Label)i.FindControl("lblFavoritos");

				string id = ((Button)sender).CommandArgument;
				//Busco el objeto en la lista, aunque devuelve un objeto solo, si no uso el find me da un error de conversion redundante de lista de objeto a objeto del mismo tipo
				Pokemon seleccionado = negocio.listar(id).Find(x => x.Id == int.Parse(id));
				//creo la lista en session
				List<Pokemon> favoritos = (List<Pokemon>)Session["favoritos"];
				//manejo de excepcion de lista nula
				if (favoritos == null)
					favoritos = new List<Pokemon>();
				//si no existe el objeto en la lista, lo agrego a la lista
				if (!favoritos.Any(x => x.Id == seleccionado.Id))
				{
					favoritos.Add(seleccionado);
					//actualizo la lista en session
					Session["favoritos"] = favoritos;

					lblFavoritos.Text = "¡Agregado a Favoritos!";
					lblFavoritos.Visible = true;
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