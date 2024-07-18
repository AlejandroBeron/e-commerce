using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;


namespace Negocio
{
    public class NegocioEmail
    {



        public void agregar(Email nuevo)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("Insert into Email values(@destinatario,@remitente,@asunto, @mensaje,1,1,getdate())");
                datos.setearparametro("@destinatario", nuevo.destino);
                datos.setearparametro("@remitente", nuevo.remitente);
                datos.setearparametro("@asunto", nuevo.asunto);
                datos.setearparametro("@mensaje", nuevo.mensaje);

                datos.ejecutaraccion();


            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarconexion();
            }
        }
        public List<Email> listarrecibidos(string des)
        {
            List<Email> lista = new List<Email>();
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("select Id,destinatario, remitente, Asunto,Mensaje,Estado, Visto,FechaHora from Email where Estado = 1 and  destinatario = @desti");
                datos.setearparametro("@desti", des);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Email aux = new Email();
                    aux.Id = (int)datos.lector["Id"];
                    aux.destino = (string)datos.lector["destinatario"];
                    aux.remitente = (string)datos.lector["remitente"];
                    aux.asunto = (string)datos.lector["Asunto"];
                    aux.mensaje = (string)datos.lector["Mensaje"];
                    aux.Estado = (bool)datos.lector["Estado"];
                    aux.Visto = (bool)datos.lector["Visto"];
                    aux.Fecha = (DateTime)datos.lector["FechaHora"];
                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarconexion();
            }

        }
        public List<Email> listarenviados(string rem)
        {
            List<Email> lista = new List<Email>();
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("select Id,destinatario, remitente, Asunto,Mensaje,Estado, Visto,FechaHora from Email where Estado = 1 and remitente = @remi");
                datos.setearparametro("@remi", rem);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Email aux = new Email();
                    aux.Id = (int)datos.lector["Id"];
                    aux.destino = (string)datos.lector["destinatario"];
                    aux.remitente = (string)datos.lector["remitente"];
                    aux.asunto = (string)datos.lector["Asunto"];
                    aux.mensaje = (string)datos.lector["Mensaje"];
                    aux.Estado = (bool)datos.lector["Estado"];
                    aux.Visto = (bool)datos.lector["Visto"];
                    aux.Fecha = (DateTime)datos.lector["FechaHora"];
                    lista.Add(aux);
                }
                return lista;
            }

            catch (Exception ex)
            {

                throw ex;

            }
            finally
            {
                datos.cerrarconexion();
            }

        }
        public List<Email> listartodos(string usu)
        {
            List<Email> lista = new List<Email>();
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("select Id, destinatario, remitente, Asunto,Mensaje,Estado, Visto,FechaHora from Email where Estado=1 and (destinatario = @usua or remitente = @usua)");
                datos.setearparametro("@usua", usu);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Email aux = new Email();

                    aux.Id = (int)datos.lector["Id"];
                    aux.destino = (string)datos.lector["destinatario"];
                    aux.remitente = (string)datos.lector["remitente"];
                    aux.asunto = (string)datos.lector["Asunto"];
                    aux.mensaje = (string)datos.lector["Mensaje"];
                    aux.Estado = (bool)datos.lector["Estado"];
                    aux.Visto = (bool)datos.lector["Visto"];
                    aux.Fecha = (DateTime)datos.lector["FechaHora"];
                    lista.Add(aux);
                }
                return lista;
            }

            catch (Exception ex)
            {

                throw ex;

            }
            finally
            {
                datos.cerrarconexion();
            }

        }
        public void BajaLogica(int id, bool pausa = false)
        {
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("update Email set  Estado= @pausa where Id=@Id");

                datos.setearparametro("@Pausa", pausa);
                datos.setearparametro("@Id", id);
                datos.ejecutaraccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public List<Email> listarpapelera(string usu)
        {
            List<Email> lista = new List<Email>();
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("select Id, destinatario, remitente, Asunto, Mensaje, Estado, Visto,FechaHora from Email where Estado=0 and (destinatario = @usua or remitente = @usua)");
                datos.setearparametro("@usua", usu);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Email aux = new Email();

                    aux.Id = (int)datos.lector["Id"];
                    aux.destino = (string)datos.lector["destinatario"];
                    aux.remitente = (string)datos.lector["remitente"];
                    aux.asunto = (string)datos.lector["Asunto"];
                    aux.mensaje = (string)datos.lector["Mensaje"];
                    aux.Estado = (bool)datos.lector["Estado"];
                    aux.Visto = (bool)datos.lector["Visto"];
                    aux.Fecha = (DateTime)datos.lector["FechaHora"];
                    lista.Add(aux);
                }
                return lista;
            }

            catch (Exception ex)
            {

                throw ex;

            }
            finally
            {
                datos.cerrarconexion();
            }

        }

        public void Leidos(int id)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("update Email set  Visto=0 where Id=@Id");
                datos.setearparametro("@Id", id);
                datos.ejecutaraccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<Email> listarLeidos(string usu)
        {
            List<Email> lista = new List<Email>();
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("select Id, destinatario, remitente, Asunto, Mensaje, Estado, Visto,FechaHora from Email where Visto=0 and Estado=1 and (destinatario = @usua or remitente = @usua)");
                datos.setearparametro("@usua", usu);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Email aux = new Email();

                    aux.Id = (int)datos.lector["Id"];
                    aux.destino = (string)datos.lector["destinatario"];
                    aux.remitente = (string)datos.lector["remitente"];
                    aux.asunto = (string)datos.lector["Asunto"];
                    aux.mensaje = (string)datos.lector["Mensaje"];
                    aux.Estado = (bool)datos.lector["Estado"];
                    aux.Visto = (bool)datos.lector["Visto"];
                    aux.Fecha = (DateTime)datos.lector["FechaHora"];
                    lista.Add(aux);
                }
                return lista;
            }

            catch (Exception ex)
            {

                throw ex;

            }
            finally
            {
                datos.cerrarconexion();
            }

        }
        public List<Email> listarnoLeidos(string usu)
        {
            List<Email> lista = new List<Email>();
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("select Id, destinatario, remitente, Asunto, Mensaje, Estado, Visto,FechaHora from Email where Visto=1 and Estado=1 and destinatario = @usua ");
                datos.setearparametro("@usua", usu);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Email aux = new Email();

                    aux.Id = (int)datos.lector["Id"];
                    aux.destino = (string)datos.lector["destinatario"];
                    aux.remitente = (string)datos.lector["remitente"];
                    aux.asunto = (string)datos.lector["Asunto"];
                    aux.mensaje = (string)datos.lector["Mensaje"];
                    aux.Estado = (bool)datos.lector["Estado"];
                    aux.Visto = (bool)datos.lector["Visto"];
                    aux.Fecha = (DateTime)datos.lector["FechaHora"];
                    lista.Add(aux);
                }
                return lista;
            }

            catch (Exception ex)
            {

                throw ex;

            }
            finally
            {
                datos.cerrarconexion();
            }

        }
    }
}