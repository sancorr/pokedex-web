using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PokemonWeb
{
	public partial class Favoritos : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		private void Page_Error(object sender, EventArgs e)
		{
			Exception exc = Server.GetLastError();

			Session.Add("error", exc.ToString());
			Server.Transfer("Error.aspx");
		}
	}
}