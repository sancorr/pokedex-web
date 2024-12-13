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
	public partial class FormPokemon : System.Web.UI.Page
	{
		public bool Eliminar { get; set; }
		public List<Elemento> ListaElementos { get; set; }
		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				Eliminar = false;
				if (!IsPostBack)
				{
					//si es alta..

					ElementoNegocio elementoNegocio = new ElementoNegocio();
					ListaElementos = elementoNegocio.listar();

					DropDownTipo.DataSource = ListaElementos;
					DropDownTipo.DataValueField = "Id";
					DropDownTipo.DataTextField = "Descripcion";
					DropDownTipo.DataBind();

					DropDownDebilidad.DataSource = ListaElementos;
					DropDownDebilidad.DataValueField = "Id";
					DropDownDebilidad.DataTextField = "Descripcion";
					DropDownDebilidad.DataBind();
				}

				btnEliminar.Visible = false;
				btnDesabilitar.Visible = false;

				//Si es modificacion..
				string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";

				if (id != "" && !IsPostBack) {
					PokemonNegocio negocio = new PokemonNegocio();
					List<Pokemon> lista = negocio.listar(id);
					Pokemon pokemon = lista[0];

					Session.Add("pokemon", pokemon);

					//Pre cargar el formulario
					tbxNumero.Text = pokemon.Numero.ToString();
					tbxNombre.Text = pokemon.Nombre;
					tbxDescripcion.Text = pokemon.Descripcion;
					tbxImagen.Text = pokemon.UrlImagen;
					tbxImagen_TextChanged(sender, e);
					//dropdowns
					DropDownTipo.SelectedValue = pokemon.Tipo.Id.ToString();
					DropDownDebilidad.SelectedValue = pokemon.Debilidad.Id.ToString();


					btnEliminar.Visible = true;
					btnDesabilitar.Visible = true;
					//configuraciones varias
					if (!pokemon.Activo) {
						btnDesabilitar.Text = "Hablitar";
					}
				}
			}
			catch (Exception ex)
			{
				Session.Add("error", ex.ToString());
			}
		}

		protected void btnAceptar_Click(object sender, EventArgs e)
		{
			Page.Validate();
			if (!Page.IsValid)
				return;

			Pokemon pokemon = new Pokemon();
			PokemonNegocio negocio = new PokemonNegocio();

			try
			{
				pokemon.Numero = int.Parse(tbxNumero.Text);
				pokemon.Nombre = tbxNombre.Text;
				pokemon.Descripcion = tbxDescripcion.Text;
				pokemon.UrlImagen = tbxImagen.Text;

				pokemon.Tipo = new Elemento();
				pokemon.Tipo.Id = int.Parse(DropDownTipo.SelectedValue);
				pokemon.Debilidad = new Elemento();
				pokemon.Debilidad.Id = int.Parse(DropDownDebilidad.SelectedValue);

				if (Request.QueryString["id"] != null)
				{
					pokemon.Id = int.Parse(Request.QueryString["id"]);
					negocio.modificarConSp(pokemon);
				}
				else
				{
					negocio.agregarConSp(pokemon);
				}

				Response.Redirect("ListaPokemon.aspx");
			}
			catch (Exception ex)
			{
				Session.Add("error", ex.ToString());
			}
		}

		protected void tbxImagen_TextChanged(object sender, EventArgs e)
		{
			imgPokemon.ImageUrl = tbxImagen.Text;
		}

		protected void btnEliminarConfirmar_Click(object sender, EventArgs e)
		{
			try
			{
				if (chkEliminarConfirmar.Checked)
				{
					PokemonNegocio negocio = new PokemonNegocio();
					Pokemon pokemon = (Pokemon)Session["pokemon"];
					negocio.eliminar(pokemon.Id);
					Response.Redirect("ListaPokemon.aspx");
				}
			}
			catch (Exception ex)
			{

				Session.Add("error", ex.ToString());
			}
		}

		protected void btnEliminar_Click(object sender, EventArgs e)
		{
			Eliminar = true;
		}

		protected void btnDesabilitar_Click(object sender, EventArgs e)
		{
			try
			{
				PokemonNegocio negocio = new PokemonNegocio();
				Pokemon pokemon = (Pokemon)Session["pokemon"];
				negocio.eliminarLogico(pokemon.Id, !pokemon.Activo);
				Response.Redirect("ListaPokemon.aspx");
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