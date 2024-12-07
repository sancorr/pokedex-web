using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
	static public class Seguridad
	{
		static public bool sesionActiva(object user)
		{
			Entrenador userActivo = user != null ? (Entrenador)user : null;
			if (userActivo != null && userActivo.Id != 0)
				return true;
			else
				return false;
		}

		static public bool esAdmin(object admin)
		{
			Entrenador adminActivo = admin != null ? (Entrenador)admin : null;
			return adminActivo != null ? adminActivo.Admin : false;
		}
	}
}
