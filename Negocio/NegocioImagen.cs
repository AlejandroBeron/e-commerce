using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class NegocioImagen
    {
        public void eliminar(int id)
        {
            try
            {
                Acceso_Datos datos = new Acceso_Datos();
                datos.setearconsulta("delete from Imagen where Id = @Id");
                datos.setearparametro("@Id", id);
                datos.ejecutaraccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public void agregar(Imagen nuevo)
        {
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("insert into Imagen(Id_Inmueble, ImagenUrl) values(@IdI, @Imagen)");
                datos.setearparametro("@IdI", nuevo.id_Articulo);
                datos.setearparametro("@Imagen", nuevo.Nombre_imagen);
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
        public List<Imagen> ListarItems(int ID)
        {
            List<Imagen> Lista_imagen = new List<Imagen>();
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("Select ImagenUrl, Id, Id_articulo from Imagen where Id_articulo  =@ID ");
                datos.setearparametro("@ID", ID);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Imagen aux = new Imagen();

                    aux.id_imagen = (int)datos.lector["Id"];
                    aux.id_Articulo = (int)datos.lector["Id_articulo"];
                    aux.Nombre_imagen = (string)datos.lector["ImagenUrl"];

                    Lista_imagen.Add(aux);


                }
                return Lista_imagen;
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
        public List<Imagen> Listar()
        {
            List<Imagen> Lista_imagen = new List<Imagen>();
            Acceso_Datos datos = new Acceso_Datos();
            try
            {

                datos.setearconsulta("select  A.nombre , I.Id , I.ImagenUrl,I.Id_articulo,A.id_producto from Imagen as I left join Articulo as A on I.Id_articulo = A.id_producto");
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Imagen aux = new Imagen();
                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Nombre"))))
                    {

                        //aux.nombre_inmueble = (string)datos.lector["Nombre"];
                        aux.id_imagen = (int)datos.lector["id_producto"];
                     //   aux.id_inmueble = (int)datos.lector["Id_articulo"];
                        aux.Nombre_imagen = (string)datos.lector["ImagenUrl"];

                        Lista_imagen.Add(aux);
                    }
                }
                return Lista_imagen;
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
        public void Agregar(List<string> imagenes, int productId)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                foreach (var imagen in imagenes)
                {

                    datos.setearconsulta("INSERT INTO Imagen (ImagenUrl, Id_Inmueble) VALUES ('" + imagen + "','" + productId + "' )");
                    //datos.setearparametro("@Id_inmueble", productId);
                    //datos.setearparametro("@Url",imagen);
                    datos.ejecutaraccion2();
                    



                }
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