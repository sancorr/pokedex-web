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
	public partial class ListaPokemon : System.Web.UI.Page
	{
		public List<Pokemon> lista { get; set; }
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Seguridad.esAdmin(Session["user"]))
			{
				Session.Add("Error", "Necesitas ser administrador para acceder a esta pagina");
				Response.Redirect("Error.aspx", false);
			}

			PokemonNegocio negocio = new PokemonNegocio();
			if (!IsPostBack)
			{
				lista = negocio.listarConSP();
				dgvListaPokemon.DataSource = lista;
				dgvListaPokemon.DataBind();
			}
		}

		protected void btnAgregar_Click(object sender, EventArgs e)
		{
			Response.Redirect("FormPokemon.aspx", false);
		}

		protected void dgvListaPokemon_SelectedIndexChanged(object sender, EventArgs e)
		{
			string id = dgvListaPokemon.SelectedDataKey.Value.ToString();
			Response.Redirect("FormPokemon.aspx?id=" + id);
		}

		protected void dgvListaPokemon_PageIndexChanging(object sender, GridViewPageEventArgs e)
		{
			dgvListaPokemon.PageIndex = e.NewPageIndex;
			dgvListaPokemon.DataBind();
		}

		protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
		{
			ddlCriterio.Items.Clear();
			if(ddlCampo.SelectedItem.ToString() == "Número")
			{
				ddlCriterio.Items.Add("Igual a");
				ddlCriterio.Items.Add("Mayor a");
				ddlCriterio.Items.Add("Menor a");
			}
			else
			{
				ddlCriterio.Items.Add("Contiene");
				ddlCriterio.Items.Add("Comienza con");
				ddlCriterio.Items.Add("Termina con");
			}
		}

		protected void btnBuscarFiltro_Click(object sender, EventArgs e)
		{
			try
			{
				PokemonNegocio negocio = new PokemonNegocio();
				dgvListaPokemon.DataSource = negocio.filtrar(ddlCampo.SelectedItem.ToString(), ddlCriterio.SelectedItem.ToString(), tbxFiltro.Text, ddlEstado.SelectedItem.ToString());
				dgvListaPokemon.DataBind();
			}
			catch (Exception ex)
			{
				Session.Add("Error", ex);
				throw;
			}
		}
	}
}