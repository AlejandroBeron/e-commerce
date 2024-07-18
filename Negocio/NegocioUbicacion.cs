using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
namespace Negocio
{
    public class NegocioUbicacion
    {
        public List<Ubicacion> listar()
        {
            List<Ubicacion> lista = new List<Ubicacion>();
            Acceso_Datos datos = new Acceso_Datos();

            try
            {

                datos.setearconsulta("select CP, Nombre from Localidad");
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Ubicacion aux = new Ubicacion();
                    aux.Codigo_Postal = (int)datos.lector["CP"];
                    aux.Localidad = (string)datos.lector["Nombre"];

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
        public String listarcodigopostal(int codigo)
        {
            String seleccionado;
            Acceso_Datos datos = new Acceso_Datos();

            try
            {

                datos.setearconsulta("select Nombre from Localidad where CP=@CP");
                datos.setearparametro("@CP", codigo);
                datos.ejecutarlectura();
                datos.lector.Read();

                seleccionado = (string)datos.lector["Nombre"];

                return seleccionado;
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
