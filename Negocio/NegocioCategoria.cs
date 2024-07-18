using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class NegocioCategoria
    {
        public List<Categoria> listar()
        {
            List<Categoria> lista = new List<Categoria>();
            Acceso_Datos datos = new Acceso_Datos();

            try
            {

                datos.setearconsulta("select Id, Nombre from Categoria");
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Categoria aux = new Categoria();
                    aux.nombre_categoria = (string)datos.lector["Nombre"];
                    aux.codigo_categoria = (short)datos.lector["Id"];

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

        public void agregar(Categoria nueva_Categoria)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("insert into Categoria values('" + nueva_Categoria.nombre_categoria + "')");

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
        public void modificar(Categoria cat)
        {
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("update Categoria set  Nombre= @Nombre where Id=@Id");
                datos.setearparametro("@Id", cat.codigo_categoria);
                datos.setearparametro("@Nombre", cat.nombre_categoria);

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
                datos.setearconsulta("delete from Categoria where Id = @Id ");
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