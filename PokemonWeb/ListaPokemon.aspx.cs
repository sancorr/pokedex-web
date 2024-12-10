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
			try
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
			catch (Exception ex)
			{
				Session.Add("error", ex.ToString());
			}
		}

		protected void btnAgregar_Click(object sender, EventArgs e)
		{
			try
			{
				Response.Redirect("FormPokemon.aspx", false);
			}
			catch (Exception ex)
			{
				Session.Add("error", "error al redireccionar");
			}
		}

		protected void dgvListaPokemon_SelectedIndexChanged(object sender, EventArgs e)
		{
			try
			{
				string id = dgvListaPokemon.SelectedDataKey.Value.ToString();
				Response.Redirect("FormPokemon.aspx?id=" + id, false);
			}
			catch (Exception ec)
			{
				Session.Add("error", "Error al redireccionar");
			}
		}

		protected void dgvListaPokemon_PageIndexChanging(object sender, GridViewPageEventArgs e)
		{
			try
			{
				dgvListaPokemon.PageIndex = e.NewPageIndex;
				dgvListaPokemon.DataBind();
			}
			catch (Exception ex)
			{
				Session.Add("error", ex.ToString());
			}
		}

		protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
		{
			try
			{
				ddlCriterio.Items.Clear();
				if (ddlCampo.SelectedItem.ToString() == "Número")
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
			catch (Exception ex)
			{
				Session.Add("error", ex.ToString());
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