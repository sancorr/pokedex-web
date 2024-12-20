using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
	public class EntrenadorNegocio
	{
		public int insertarTrainer(Entrenador nuevoEntrenador)
		{
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.setearSP("storedInsertTrainee");
				datos.setearParametro("@mail", nuevoEntrenador.Email);
				datos.setearParametro("@pass", nuevoEntrenador.Pass);
				
				return datos.ejecutarAccionScalar();
			}
			catch (Exception ex)
			{
				throw ex;
			}
			finally
			{
				datos.cerrarConexion();
			}
		}

		public bool logInTrainer(Entrenador user)
		{
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.setearConsulta("select id, email, pass, admin, nombre, apellido, fechaNacimiento, imagenPerfil from USERS where email = @email and pass = @pass");
				datos.setearParametro("@email", user.Email);
				datos.setearParametro("@pass", user.Pass);
				datos.ejecutarLectura();

				while (datos.Lector.Read())
				{
					user.Id = (int)datos.Lector["id"];
					user.Admin = (bool)datos.Lector["admin"];
					user.Email = (string)datos.Lector["email"];
					if(!(datos.Lector["imagenPerfil"] is DBNull))
						user.ImagenPerfil = (string)datos.Lector["imagenPerfil"];
					if (!(datos.Lector["nombre"] is DBNull))
						user.Nombre = (string)datos.Lector["nombre"];
					if (!(datos.Lector["apellido"] is DBNull))
						user.Apellido = (string)datos.Lector["apellido"];
					if (!(datos.Lector["fechaNacimiento"] is DBNull))
						user.FechaNacimiento = DateTime.Parse(datos.Lector["fechaNacimiento"].ToString());

					return true;
				}
				return false;
			}
			catch (Exception ex)
			{

				throw ex;
			}
			finally
			{
				datos.cerrarConexion();
			}
		}

		public void actualizarRegistro(Entrenador user)
		{
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.setearConsulta("update USERS set nombre = @nombre, apellido = @apellido, fechaNacimiento = @fecha, imagenPerfil = @image where id = @id");
				datos.setearParametro("@nombre", (object)user.Nombre ?? DBNull.Value);
				datos.setearParametro("@apellido", (object)user.Apellido ?? DBNull.Value);
				datos.setearParametro("@fecha", (object)user.FechaNacimiento ?? DBNull.Value);
				datos.setearParametro("@image", (object)user.ImagenPerfil ?? DBNull.Value);
				datos.setearParametro("@id", user.Id);
				datos.ejecutarAccion();
			}
			catch (Exception ex)
			{

				throw ex;
			}
			finally
			{
				datos.cerrarConexion();
			}
		}
	}
}
