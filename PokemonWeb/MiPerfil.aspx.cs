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
	public partial class MiPerfil : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				if (Seguridad.sesionActiva(Session["user"]))
				{
					Entrenador user = (Entrenador)Session["user"];
					tbxEmail.Text = user.Email;
					tbxEmail.ReadOnly = true;
					tbxNombre.Text = user.Nombre;
					tbxApellido.Text = user.Apellido;
					tbxFecha.Text = user.FechaNacimiento.ToString("yyyy-MM-dd");
					if (!string.IsNullOrEmpty(user.ImagenPerfil))
						imagenPerfil.ImageUrl = "~/Images/Perfil/" + user.ImagenPerfil;
				}
			}
		}

		protected void btnGuardar_Click(object sender, EventArgs e)
		{
			try
			{
				EntrenadorNegocio negocio = new EntrenadorNegocio();
				Entrenador user = (Entrenador)Session["user"];
				//Ruta donde se va a escribir la referencia a la imagen- ruta fisica
				if(tbxImagenPerfil.PostedFile.FileName != "")
				{
					string ruta = Server.MapPath("./Images/Perfil/");
					tbxImagenPerfil.PostedFile.SaveAs(ruta + "profile-" + user.Id + ".jpg");
					user.ImagenPerfil = "profile-" + user.Id + ".jpg";
				}
				//Informacion del objeto
				user.Email = tbxEmail.Text;
				user.Nombre = tbxNombre.Text;
				user.Apellido = tbxApellido.Text;
				user.FechaNacimiento = DateTime.Parse(tbxFecha.Text);
				//guardar datos del objeto
				negocio.actualizarRegistro(user);
				//Leer la imagen del avatar
				Image avatar = (Image)Master.FindControl("imageAvatar");
				avatar.ImageUrl = "~/Images/Perfil/" + user.ImagenPerfil;

				Response.Redirect("Default.aspx", false);
			}
			catch (Exception ex)
			{
				Session.Add("Error", ex.ToString());
			}
		}
	}
}