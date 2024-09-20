using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class NegocioInmueble
    {
        /* public List<Inmueble> uploadInmuebleList(string query)
         {
             List<Inmueble> inm = new List<Inmueble>();
             try
             {
                 Acceso_Datos inmunegocio = new Acceso_Datos();
                 NegocioImagen inegocio = new NegocioImagen();

                 inmunegocio.setearconsulta(query);
                 inmunegocio.ejecutarlectura();

                 while (inmunegocio.lector.Read())
                 {
                     Inmueble inmueble = new Inmueble();
                     Ubicacion auxi = new Ubicacion();
                     Imagen aux = new Imagen();

                     inmueble.NombreUsuario = (string)inmunegocio.lector["Nombreusuario"];
                     inmueble.Imagenes = new List<Imagen>();
                     inmueble.Id_I = (int)inmunegocio.lector["Id"];
                     inmueble.nombre_I = (string)inmunegocio.lector["Nombre"];
                     inmueble.descripcion_I = (string)inmunegocio.lector["Descripcion"];
                     if (inmunegocio.lector.IsDBNull(inmunegocio.lector.GetOrdinal("Categoria")))
                     {
                         inmueble.categoria_I.nombre_categoria = " ";
                     }
                     else
                     {
                         inmueble.categoria_I.nombre_categoria = (string)inmunegocio.lector["Categoria"];
                         inmueble.categoria_I.codigo_categoria = (short)inmunegocio.lector["IdCategoria"];
                     }
                     inmueble.ubicacion.Direccion = (string)inmunegocio.lector["Domicilio"];
                     inmueble.ubicacion.Codigo_Postal = (int)inmunegocio.lector["Codigo_Postal"];
                     inmueble.ubicacion.Localidad = (string)inmunegocio.lector["Localidad"];
                     inmueble.ubicacion.Partido = (string)inmunegocio.lector["Partido"];
                     inmueble.tipo_operacion = (string)inmunegocio.lector["TipoOperacion"];
                     inmueble.precio_I = (decimal)inmunegocio.lector["Precio"];
                     inmueble.precio_I = Math.Round(inmueble.precio_I, 2);
                     inmueble.ambientes = (int)inmunegocio.lector["Ambientes"];
                     inmueble.baños = (int)inmunegocio.lector["Baños"];
                     inmueble.gasnatural = (bool)inmunegocio.lector["Gas_Natural"];
                     inmueble.aguacorriente = (bool)inmunegocio.lector["Agua_Corriente"];
                     inmueble.cloacas = (bool)inmunegocio.lector["Cloacas"];
                     inmueble.luz = (bool)inmunegocio.lector["Luz"];
                     inmueble.cochera = (bool)inmunegocio.lector["Cochera"];
                     inmueble.patio = (bool)inmunegocio.lector["Patio"];
                     inmueble.aireacondicionado = (bool)inmunegocio.lector["Aire_Acondicionado"];
                     inmueble.calefaccion = (bool)inmunegocio.lector["Calefacción"];
                     inmueble.pavimento = (bool)inmunegocio.lector["Pavimento"];

                     inmueble.Imagenes = inegocio.ListarItems(inmueble.Id_I);
                     if (inmueble.Imagenes.Count() == 0)
                     {
                         aux.Nombre_imagen = "sinimagen";
                         inmueble.Imagenes.Add(aux);
                     }
                     inm.Add(inmueble);
                 }
                 return inm;
             }
             catch (Exception ex)
             {
                 throw ex;
             }
         }
        */

        public int ObtenerUltimoIdInmueble()
        {
            Acceso_Datos datosAcceso = new Acceso_Datos();
            int ultimoId = 0;
            try
            {
                datosAcceso.setearconsulta("SELECT MAX(Id) AS UltimoId FROM Inmueble");
                datosAcceso.ejecutarlectura();

                if (datosAcceso.lector.Read())
                {
                    ultimoId = Convert.ToInt32(datosAcceso.lector["UltimoId"]);
                }

                return ultimoId;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datosAcceso.cerrarconexion();
            }
        }

        public List<Inmueble> Listapropia(string usuari)
        {

            List<Inmueble> inm = new List<Inmueble>();
            Acceso_Datos inmunegocio = new Acceso_Datos();
            NegocioImagen inegocio = new NegocioImagen();
            try
            {
                inmunegocio.setearconsulta("select I.Id As Id,I.Nombreusuario,I.Activa,I.Domicilio,I.Codigo_Postal, I.Pausa, I.Estado, I.Nombre As Nombre, I.Descripcion As Descripcion, C.Nombre As Categoria, C.Id As IdCategoria, I.Precio  As Precio, I.Ambientes, I.Baños, I.Gas_Natural, I.Agua_Corriente, I.Cloacas, I.Luz, I.Cochera, I.Patio, I.Aire_Acondicionado, I.Calefacción, I.Pavimento,I.TipoOperacion FROM  Inmueble I  left join Categoria C on C.Id = I.Id_categoria where I.Nombreusuario=@Nombre and I.Activa=1 ");
                inmunegocio.setearparametro("@Nombre", usuari);
                inmunegocio.ejecutarlectura();

                while (inmunegocio.lector.Read())
                {
                    Inmueble inmueble = new Inmueble();
                    Ubicacion auxi = new Ubicacion();
                    Imagen aux = new Imagen();

                    inmueble.NombreUsuario = (string)inmunegocio.lector["Nombreusuario"];
                    inmueble.Imagenes = new List<Imagen>();
                    inmueble.Id_I = (int)inmunegocio.lector["Id"];
                    inmueble.Pausa = (bool)inmunegocio.lector["Pausa"];
                    inmueble.nombre_I = (string)inmunegocio.lector["Nombre"];
                    inmueble.descripcion_I = (string)inmunegocio.lector["Descripcion"];
                    if (inmunegocio.lector.IsDBNull(inmunegocio.lector.GetOrdinal("Categoria")))
                    {
                        inmueble.categoria_I.nombre_categoria = " ";
                    }
                    else
                    {
                        inmueble.categoria_I.nombre_categoria = (string)inmunegocio.lector["Categoria"];
                        inmueble.categoria_I.codigo_categoria = (short)inmunegocio.lector["IdCategoria"];
                    }
                    inmueble.tipo_operacion = (string)inmunegocio.lector["TipoOperacion"];

                    inmueble.ubicacion.Codigo_Postal = (int)inmunegocio.lector["Codigo_Postal"];
                    inmueble.ubicacion.Direccion = (string)inmunegocio.lector["Domicilio"];
                    inmueble.precio_I = (decimal)inmunegocio.lector["Precio"];
                    inmueble.precio_I = Math.Round(inmueble.precio_I, 2);
                    inmueble.ambientes = (int)inmunegocio.lector["Ambientes"];
                    inmueble.baños = (int)inmunegocio.lector["Baños"];
                    inmueble.gasnatural = (bool)inmunegocio.lector["Gas_Natural"];
                    inmueble.aguacorriente = (bool)inmunegocio.lector["Agua_Corriente"];
                    inmueble.cloacas = (bool)inmunegocio.lector["Cloacas"];
                    inmueble.luz = (bool)inmunegocio.lector["Luz"];
                    inmueble.cochera = (bool)inmunegocio.lector["Cochera"];
                    inmueble.patio = (bool)inmunegocio.lector["Patio"];
                    inmueble.aireacondicionado = (bool)inmunegocio.lector["Aire_Acondicionado"];
                    inmueble.calefaccion = (bool)inmunegocio.lector["Calefacción"];
                    inmueble.pavimento = (bool)inmunegocio.lector["Pavimento"];

                    inmueble.Imagenes = inegocio.ListarItems(inmueble.Id_I);
                    if (inmueble.Imagenes.Count() == 0)
                    {
                        aux.Nombre_imagen = "sinimagen";
                        inmueble.Imagenes.Add(aux);
                    }
                    inm.Add(inmueble);
                }
                return inm;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public List<Inmueble> listar()
        {
            List<Inmueble> lista = new List<Inmueble>();
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("select I.Nombre,I.Nombreusuario, I.Precio, I.Id ,I.Pausa, I.Estado, I.Descripcion, C.Nombre Categoria, I.Id_categoria IdCategoria from Inmueble AS I left join Categoria C ON I.Id_categoria = C.Id where I.Activa=1 ");
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Inmueble aux = new Inmueble();
                    aux.nombre_I = (string)datos.lector["Nombre"];
                    aux.NombreUsuario = (string)datos.lector["Nombreusuario"];

                    aux.precio_I = (decimal)datos.lector["Precio"];
                    aux.precio_I = Math.Round(aux.precio_I, 2);
                    aux.descripcion_I = (string)datos.lector["Descripcion"];
                    aux.Id_I = (int)datos.lector["Id"];

                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Categoria"))))
                    {
                        aux.categoria_I = new Categoria();
                        aux.categoria_I.nombre_categoria = (string)datos.lector["Categoria"];
                        aux.categoria_I.codigo_categoria = (int)datos.lector["IdCategoria"];
                    }
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


        public void agregar(Articulos nuevo, List<string> imagenUrls)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("INSERT INTO Articulo (nombre, descripcion,id_categoria, precio,pausa,estado,Activa)VALUES (@nombre, @descripcion, @id_categoria, @Precio,@pausa,@estado)");

                // datos.setearparametro("@Nombreusuario", nuevo.);
                datos.setearparametro("@nombre", nuevo.nombre_a);
                datos.setearparametro("@descripcion", nuevo.descripcion_a);
                // datos.setearparametro("@Domicilio", nuevo.ubicacion.Direccion);
                datos.setearparametro("@id_categoria", nuevo.categoria_a.codigo_categoria);
                // datos.setearparametro("@CodigoPostal", nuevo.ubicacion.Codigo_Postal);
                datos.setearparametro("@precio", nuevo.precio_a);
                //datos.setearparametro("@Ambientes", nuevo.ambientes);
                // datos.setearparametro("@Baños", nuevo.baños);
                //datos.setearparametro("@TipoOperacion", nuevo.tipo_operacion);
                //datos.setearparametro("@GasNatural", nuevo.gasnatural);
                // datos.setearparametro("@AguaCorriente", nuevo.aguacorriente);
                //datos.setearparametro("@Cloacas", nuevo.cloacas);
                // datos.setearparametro("@Luz", nuevo.luz);
                //  datos.setearparametro("@Cochera", nuevo.cochera);
                // datos.setearparametro("@Patio", nuevo.patio);
                //  datos.setearparametro("@AireAcondicionado", nuevo.aireacondicionado);
                // datos.setearparametro("@Calefaccion", nuevo.calefaccion);
                // datos.setearparametro("@Pavimento", nuevo.pavimento);
                datos.setearparametro("@estado", 1);
                datos.setearparametro("@pausa", 0);
                //datos.setearparametro("@Activa", 0);

                datos.ejecutaraccion();
                datos.setearconsulta("select top 1 id_producto from negocio order by Id desc");
                int id = Convert.ToInt32(datos.ejecutarScalar());

                NegocioImagen imagen = new NegocioImagen();
                imagen.Agregar(imagenUrls, id);

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

        public int ObtenerUltimoId()
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("SELECT TOP 1 Id FROM Inmueble ORDER BY Id DESC");
                datos.ejecutarlectura();

                if (datos.lector.Read())
                {
                    return (int)datos.lector["Id"];
                }
                else
                {
                    throw new Exception("No se pudo obtener el ID del último inmueble.");
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



        public List<Inmueble> listarid(int id)
        {
            List<Inmueble> lista = new List<Inmueble>();
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("select  I.Id , I.Nombreusuario, I.Nombre, I.Precio,I.Pausa, I.Estado, I.Descripcion Detalle, C.Nombre Categoria, I.Id_categoria IdCategoria from Inmueble I, Categoria C where I.Id=@Id  and C.Id = I.Id_categoria and Activa=1");
                datos.setearparametro("@Id", id);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Inmueble aux = new Inmueble();
                    aux.nombre_I = (string)datos.lector["Nombre"];
                    aux.NombreUsuario = (string)datos.lector["Nombreusuario"];
                    aux.precio_I = (decimal)datos.lector["Precio"];
                    aux.precio_I = Math.Round(aux.precio_I, 2);
                    aux.descripcion_I = (string)datos.lector["Descripcion"];
                    aux.Id_I = (int)datos.lector["Id"];

                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Categoria"))))
                    {
                        aux.categoria_I = new Categoria();
                        aux.categoria_I.nombre_categoria = (string)datos.lector["Categoria"];
                        aux.categoria_I.codigo_categoria = (int)datos.lector["IdCategoria"];

                    }
                    lista.Add(aux);

                }
                return lista;

            }
            catch (Exception ex)
            {

                return null;

            }
            finally { datos.cerrarconexion(); }
        }
        public List<Inmueble> listarno(string nom)
        {
            List<Inmueble> lista = new List<Inmueble>();
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("select I.Id , I.Nombreusuario, I.Nombre,I.Pausa, I.Estado, I.Precio, I.Descripcion Detalle, C.Nombre Categoria, I.Id_categoria IdCategoria from Inmueble I, Categoria C where I.Nombre = @nombre and C.Id = I.Id_categoria and Activa=1");
                datos.setearparametro("@nombre", nom);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Inmueble aux = new Inmueble();
                    aux.nombre_I = (string)datos.lector["Nombre"];
                    aux.NombreUsuario = (string)datos.lector["Nombreusuario"];
                    aux.precio_I = (decimal)datos.lector["Precio"];
                    aux.precio_I = Math.Round(aux.precio_I, 2);
                    aux.descripcion_I = (string)datos.lector["Descripcion"];
                    aux.Id_I = (int)datos.lector["Id"];

                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Categoria"))))
                    {
                        aux.categoria_I = new Categoria();
                        aux.categoria_I.nombre_categoria = (string)datos.lector["Categoria"];
                        aux.categoria_I.codigo_categoria = (int)datos.lector["IdCategoria"];

                    }
                    lista.Add(aux);

                }
                return lista;

            }
            catch (Exception ex)
            {

                return null;

            }
            finally { datos.cerrarconexion(); }
        }

        public List<Inmueble> listarcategoria(Categoria id)
        {
            List<Inmueble> lista = new List<Inmueble>();
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("select I.Id, I.Nombre, I.Nombreusuario, I.Pausa, I.Estado, I.Precio, I.Descripcion, C.Nombre Categoria, i.Id_categoria IdCategoria from Inmueble I, Categoria C where I.Id_categoria = @Id and C.Id = @Id and Activa=1");
                datos.setearparametro("@Id", id.codigo_categoria);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Inmueble aux = new Inmueble();
                    aux.nombre_I = (string)datos.lector["Nombre"];
                    aux.NombreUsuario = (string)datos.lector["Nombreusuario"];
                    aux.precio_I = (decimal)datos.lector["Precio"];
                    aux.precio_I = Math.Round(aux.precio_I, 2);
                    aux.descripcion_I = (string)datos.lector["Descripcion"];
                    aux.Id_I = (int)datos.lector["Id"];

                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Categoria"))))
                    {
                        aux.categoria_I = new Categoria();
                        aux.categoria_I.nombre_categoria = (string)datos.lector["Categoria"];
                        aux.categoria_I.codigo_categoria = (int)datos.lector["IdCategoria"];

                    }
                    lista.Add(aux);

                }
                return lista;

            }
            catch (Exception ex)
            {

                throw ex;

            }
            finally { datos.cerrarconexion(); }

        }
        public void modificar(Inmueble articulo)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("update Inmueble set Nombre= @Nombre,Codigo_Postal=@CodigoPostal,Domicilio=@Domicilio,TipoOperacion=@TipoOperacion, Descripcion = @Descripcion, Id_categoria = @IdCategoria, Precio= @Precio, Cloacas=@Cloaca, Ambientes=@Ambientes, Baños=@Baños, Calefacción = @Calefaccion, Pavimento=@Pavimento, Aire_Acondicionado=@AireAcondicionado, Agua_Corriente=@AguaCorriente, Gas_Natural=@GasNatural, Luz=@Luz, Cochera=@Cochera, Patio=@Patio where Id=@Id ");
                datos.setearparametro("@Nombre", articulo.nombre_I);
                datos.setearparametro("@Descripcion", articulo.descripcion_I);
                datos.setearparametro("@IdCategoria", articulo.categoria_I.codigo_categoria);
                datos.setearparametro("@Precio", articulo.precio_I);
                datos.setearparametro("@Id", articulo.Id_I);
                datos.setearparametro("@Ambientes", articulo.ambientes);
                datos.setearparametro("@Baños", articulo.baños);
                datos.setearparametro("@GasNatural", articulo.gasnatural);
                datos.setearparametro("@AguaCorriente", articulo.aguacorriente);
                datos.setearparametro("@Cloaca", articulo.cloacas);
                datos.setearparametro("@Luz", articulo.luz);
                datos.setearparametro("@Cochera", articulo.cochera);
                datos.setearparametro("@Patio", articulo.patio);
                datos.setearparametro("@AireAcondicionado", articulo.aireacondicionado);
                datos.setearparametro("@Calefaccion", articulo.calefaccion);
                datos.setearparametro("@Pavimento", articulo.pavimento);
                datos.setearparametro("@Domicilio", articulo.ubicacion.Direccion);
                datos.setearparametro("@TipoOperacion", articulo.tipo_operacion);
                datos.setearparametro("@Codigo_Postal", articulo.ubicacion.Codigo_Postal);

                datos.ejecutaraccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Pausar(int id, bool pausa = false)
        {
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("update Inmueble set  Pausa= @pausa where Id=@Id and Activa=1");

                datos.setearparametro("@Pausa", pausa);
                datos.setearparametro("@Id", id);
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
                datos.setearconsulta("update Inmueble set Estado=@Estado from  where Id = @Id ");
                datos.setearparametro("@Id", Id);
                datos.setearparametro("@Estado", 0);
                datos.ejecutaraccion();



            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
        public void AdminElimina_Activa(int Id, bool activa = false)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("update Inmueble set Activa= @Activa where Id=@Id");
                datos.setearparametro("@Activa", activa);
                datos.setearparametro("@Id", Id);

                datos.ejecutaraccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void AdminElimina_Elimina(int Id)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("delete from PagosInmobiliaria where Id_Inmueble=@Id");
                datos.setearparametro("@Id", Id);
                datos.ejecutaraccion2();
                datos.setearconsulta("delete from Imagen where Id_Inmueble=@Id");
                datos.ejecutaraccion2();
                datos.setearconsulta("delete from Inmueble where Id=@Id");
                datos.ejecutaraccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        public List<Inmueble> Listaautorizar()
        {

            List<Inmueble> inm = new List<Inmueble>();
            Acceso_Datos inmunegocio = new Acceso_Datos();
            NegocioImagen inegocio = new NegocioImagen();
            try
            {
                inmunegocio.setearconsulta("select I.Id As Id,I.Nombreusuario,I.TipoOperacion, I.Pausa, I.Estado, I.Nombre As Nombre, I.Descripcion As Descripcion, C.Nombre As Categoria, C.Id As IdCategoria, I.Precio  As Precio, I.Ambientes, I.Baños, I.Gas_Natural, I.Agua_Corriente, I.Cloacas, I.Luz, I.Cochera, I.Patio, I.Aire_Acondicionado, I.Calefacción, I.Pavimento, I.Domicilio,I.Codigo_Postal FROM  Inmueble I  left join Categoria C on C.Id = I.Id_categoria where I.Activa=0");
                inmunegocio.ejecutarlectura();

                while (inmunegocio.lector.Read())
                {
                    Inmueble inmueble = new Inmueble();
                    Ubicacion auxi = new Ubicacion();
                    Imagen aux = new Imagen();

                    inmueble.NombreUsuario = (string)inmunegocio.lector["Nombreusuario"];
                    inmueble.Imagenes = new List<Imagen>();
                    inmueble.Id_I = (int)inmunegocio.lector["Id"];
                    inmueble.Pausa = (bool)inmunegocio.lector["Pausa"];
                    inmueble.nombre_I = (string)inmunegocio.lector["Nombre"];
                    inmueble.descripcion_I = (string)inmunegocio.lector["Descripcion"];
                    if (inmunegocio.lector.IsDBNull(inmunegocio.lector.GetOrdinal("Categoria")))
                    {
                        inmueble.categoria_I.nombre_categoria = " ";
                    }
                    else
                    {
                        inmueble.categoria_I.nombre_categoria = (string)inmunegocio.lector["Categoria"];
                        inmueble.categoria_I.codigo_categoria = (short)inmunegocio.lector["IdCategoria"];
                    }
                    inmueble.tipo_operacion = (string)inmunegocio.lector["TipoOperacion"];

                    inmueble.ubicacion.Codigo_Postal = (int)inmunegocio.lector["Codigo_Postal"];
                    inmueble.ubicacion.Direccion = (string)inmunegocio.lector["Domicilio"];
                    inmueble.precio_I = (decimal)inmunegocio.lector["Precio"];
                    inmueble.precio_I = Math.Round(inmueble.precio_I, 2);
                    inmueble.ambientes = (int)inmunegocio.lector["Ambientes"];
                    inmueble.baños = (int)inmunegocio.lector["Baños"];
                    inmueble.gasnatural = (bool)inmunegocio.lector["Gas_Natural"];
                    inmueble.aguacorriente = (bool)inmunegocio.lector["Agua_Corriente"];
                    inmueble.cloacas = (bool)inmunegocio.lector["Cloacas"];
                    inmueble.luz = (bool)inmunegocio.lector["Luz"];
                    inmueble.cochera = (bool)inmunegocio.lector["Cochera"];
                    inmueble.patio = (bool)inmunegocio.lector["Patio"];
                    inmueble.aireacondicionado = (bool)inmunegocio.lector["Aire_Acondicionado"];
                    inmueble.calefaccion = (bool)inmunegocio.lector["Calefacción"];
                    inmueble.pavimento = (bool)inmunegocio.lector["Pavimento"];

                    inmueble.Imagenes = inegocio.ListarItems(inmueble.Id_I);
                    if (inmueble.Imagenes.Count() == 0)
                    {
                        aux.Nombre_imagen = "sinimagen";
                        inmueble.Imagenes.Add(aux);
                    }
                    inm.Add(inmueble);
                }
                return inm;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}