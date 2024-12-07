using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;

namespace negocio
{
	public class EmailService
	{
		//ATRIBUTOS:
		//mensaje: a quien envio, cuerpo, etc
		private MailMessage email;
		//instancia de servidor mediante el cual voy a enviar el mail
		private SmtpClient server;

		//CONSTRUCTOR DE LA CLASE- Cuando lo intancie, va a nacer con todas las configuraciones necesarias para enviar el email
		//CONFIGURACIONES:
		//1- Instancia del servidor
		//2- Credenciales
		//3- Ssl- certificado de seguridad
		//4- Puerto del servidor
		//5- Host 

		public EmailService()
		{
			server = new SmtpClient();
			server.Credentials = new NetworkCredential("smtp@mailtrap.io", "c6cc44c82faa82076756e66df0356170");
			server.EnableSsl = true;
			server.Port = 587;
			server.Host = "live.smtp.mailtrap.io";
		}

		//METODO PARA ARMAR EL CORREO(MAIL)

		public void armarEmail(string destino, string asunto, string cuerpo)
		{
			email = new MailMessage();
			email.From = new MailAddress("noresponder@pokedex.santi.com");
			email.To.Add(destino);
			email.Subject = asunto;
			email.Body = cuerpo;
		}

		//METODO PARA ENVIAR EL MAIL
		public void enviarMail()
		{
			try
			{
				server.Send(email);
			}
			catch (Exception ex)
			{

				throw ex;
			}
		}

	}
}
