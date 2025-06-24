using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class NegocioMarca
    {
        public List<Marca> listar()
        {
            List<Marca> lista = new List<Marca>();
            Acceso_Datos datos = new Acceso_Datos();

            try
            {

                datos.setearconsulta("select id, descripcion  from Marcas");
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Marca aux = new Marca();
                    aux.Nombre = (string)datos.lector["descripcion"];
                    aux.Codigo = (short)datos.lector["id"];

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

        public void agregar(Marca nueva_Marca)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("insert into Marcas values('" + nueva_Marca.Nombre + "')");

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
        public void modificar(Marca mar)
        {
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("update Marcas set  descripcion= @Nombre where id=@Id");
                datos.setearparametro("@Nombre", mar.Nombre);
                datos.setearparametro("@Id", mar.Codigo);

                datos.ejecutaraccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void Eliminar(int Id)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("delete from Marcas where id = @Id ");
                datos.setearparametro("@Id", Id);
                datos.ejecutaraccion();



            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
    

    }
}
