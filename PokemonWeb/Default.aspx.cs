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
	public partial class Default : System.Web.UI.Page
	{
		public List<Pokemon> ListaPokemon { get; set; }
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				PokemonNegocio negocio = new PokemonNegocio();
				ListaPokemon = negocio.listarConSP();
				RepeaterPokemons.DataSource = ListaPokemon;
				RepeaterPokemons.DataBind();
			}
		}

		protected void btnVerPokemon_Click(object sender, EventArgs e)
		{
			string valor = ((Button)sender).CommandArgument;
			Response.Redirect("DetallePokemon.aspx?id=" + valor);
		}
	}
}