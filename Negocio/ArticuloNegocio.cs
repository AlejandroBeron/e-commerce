using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;


namespace Negocio
{
    public class ArticulosNegocio

    {
        public object Session { get; private set; }

        public List<Articulos> uploadArticlesList(string query)
        {
            List<Articulos> art = new List<Articulos>();
            Usuario usuario = new Usuario();
            try
            {
                Acceso_Datos anegocio = new Acceso_Datos();
                NegocioImagen inegocio = new NegocioImagen();


                anegocio.setearconsulta(query);
                anegocio.ejecutarlectura();
                while (anegocio.lector.Read())
                {
                    Articulos artic = new Articulos();
                    Imagen aux = new Imagen();

                    artic.nombre_a = (string)anegocio.lector["Nombre"];
                    artic.Imagenes = new List<Imagen>();
                    artic.Id_a = (int)anegocio.lector["Id"];
                    artic.descripcion_a = (string)anegocio.lector["Descripcion"];
                    artic.codigo_a = (string)anegocio.lector["Codigo"];
                    artic.marca_a.Nombre = (string)anegocio.lector["Marca"];
                    artic.marca_a.Codigo = (short)anegocio.lector["IdMarca"];


                    if (anegocio.lector.IsDBNull(anegocio.lector.GetOrdinal("Categoria")))
                    {
                        artic.categoria_a.nombre_categoria = " ";
                    }
                    else
                    {
                        artic.categoria_a.nombre_categoria = (string)anegocio.lector["Categoria"];
                        artic.categoria_a.codigo_categoria = (short)anegocio.lector["IdCategoria"];
                    }

                    artic.precio_a = (decimal)anegocio.lector["Precio"];
                    artic.precio_a = Math.Round(artic.precio_a, 2);
                    artic.Imagenes = inegocio.ListarItems(artic.Id_a);
                    if (artic.Imagenes.Count() == 0)
                    {
                        aux.Nombre_imagen = "sinimagen";
                        artic.Imagenes.Add(aux);
                    }




                    art.Add(artic);
                }

                return art;
            }
            catch (Exception ex)
            {
                return art;
                // throw ex;
            }


        }

        public void Pausar(int id, bool pausa = false)
        {
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("update Articulo set  pausa= @Pausa where id_producto=@Id and estado=1");

                datos.setearparametro("@Pausa", pausa);
                datos.setearparametro("@Id", id);
                datos.ejecutaraccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public List<Articulos> Listacompleta()
        {
            return uploadArticlesList("select A.id_producto As Id, A.codigo As Codigo,A.nombre As Nombre ,C.Nombre as Categoria,A.descripcion As Descripcion ,M.descripcion Marca, C.Id As IdCategoria, M.id As IdMarca ,A.precio  As Precio FROM  Articulo A left JOIN  Marcas M on M.id= A.id_marca left JOIN Categoria C on C.Id= A.id_categoria");

        }

        public List<Articulos> listar()
        {
            List<Articulos> lista = new List<Articulos>();
            Acceso_Datos datos = new Acceso_Datos();

            try
            {

                datos.setearconsulta("select A.codigo,A.nombre,A.precio, A.id_producto , A.descripcion,M.descripcion Marca,A.id_marca idMarca,  A.id_categoria IdCategoria, C.Nombre Categoria from Articulo A left JOIN Marcas M ON A.id_marca = M.id left JOIN Categoria C ON A.id_categoria = C.Id");
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Articulos aux = new Articulos();
                    aux.nombre_a = (string)datos.lector["nombre"];
                    aux.precio_a = (decimal)datos.lector["precio"];
                    aux.precio_a = Math.Round(aux.precio_a, 2);
                    aux.codigo_a = (string)datos.lector["codigo"];
                    aux.descripcion_a = (string)datos.lector["descripcion"];
                    aux.Id_a = (int)datos.lector["id_producto"];

                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Categoria"))))
                    {
                        aux.categoria_a = new Categoria();
                        aux.categoria_a.nombre_categoria = (string)datos.lector["Categoria"];
                        aux.categoria_a.codigo_categoria = (short)datos.lector["IdCategoria"];

                    }
                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Marca"))))
                    {
                        aux.marca_a = new Marca();
                        aux.marca_a.Nombre = (string)datos.lector["Marca"];
                        aux.marca_a.Codigo = (short)datos.lector["IdMarca"];
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
                datos.setearconsulta("INSERT INTO Articulo (nombre, codigo, descripcion, precio, id_marca, id_categoria, estado, pausa) VALUES(@nombre, @codigo, @descripcion, @precio, @marca, @categoria,1,1)");
                datos.setearparametro("@codigo", nuevo.codigo_a);
                datos.setearparametro("@nombre", nuevo.nombre_a);
                datos.setearparametro("@descripcion", nuevo.descripcion_a);
                datos.setearparametro("@precio", nuevo.precio_a);
                datos.setearparametro("@marca", nuevo.marca_a.Codigo);
                datos.setearparametro("@categoria", nuevo.categoria_a.codigo_categoria);
                datos.ejecutaraccion();

                datos.setearconsulta("SELECT TOP 1 * FROM Articulo ORDER BY id_producto DESC");
                int id = Convert.ToInt32(datos.ejecutarScalar());

                NegocioImagen imagen = new NegocioImagen();
                imagen.Agregar(imagenUrls, id);

              //  datos.setearconsulta("insert into Imagen(Id_articulo, ImagenUrl) values(@Id,@url)");
              //  datos.setearparametro("@Id", id);
              //  datos.setearparametro("@url", imagenUrls);
              //  datos.ejecutaraccion();
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

        public List<Articulos> listarco(string cod)
        {
            List<Articulos> lista = new List<Articulos>();
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("select Codigo, A.id_producto , A.Nombre,A.Precio, A.Descripcion Detalle, M.Descripcion Marca, A.IdMarca idMarca, C.Descripcion Categoria, A.IdCategoria IdCategoria from ARTICULOS A, MARCAS M, CATEGORIAS C where A.Codigo = @Cod AND M.Id = A.IdMarca AND C.Id = A.IdCategoria");
                datos.setearparametro("@Cod", cod);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Articulos aux = new Articulos();
                    aux.nombre_a = (string)datos.lector["nombre"];
                    aux.precio_a = (decimal)datos.lector["precio"];
                    aux.precio_a = Math.Round(aux.precio_a, 2);
                    aux.codigo_a = (string)datos.lector["codigo"];
                    aux.descripcion_a = (string)datos.lector["Detalle"];
                    aux.Id_a = (int)datos.lector["id_producto"];

                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Categoria"))))
                    {
                        aux.categoria_a = new Categoria();
                        aux.categoria_a.nombre_categoria = (string)datos.lector["categoria"];
                        aux.categoria_a.codigo_categoria = (int)datos.lector["Id"];

                    }
                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Marca"))))
                    {
                        aux.marca_a = new Marca();
                        aux.marca_a.Nombre = (string)datos.lector["Marca"];
                        aux.marca_a.Codigo = (int)datos.lector["IdMarca"];
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
        public List<Articulos> listarid(int id)
        {
            List<Articulos> lista = new List<Articulos>();
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("select Codigo, A.Id , A.Nombre,A.Precio, A.Descripcion Detalle, M.Descripcion Marca, A.IdMarca idMarca, C.Descripcion Categoria, A.IdCategoria IdCategoria from ARTICULOS A, MARCAS M, CATEGORIAS C where A.Id=@Id AND M.Id = A.IdMarca AND C.Id = A.IdCategoria ");
                datos.setearparametro("@Id", id);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Articulos aux = new Articulos();
                    aux.nombre_a = (string)datos.lector["Nombre"];
                    aux.precio_a = (decimal)datos.lector["Precio"];
                    aux.precio_a = Math.Round(aux.precio_a, 2);
                    aux.codigo_a = (string)datos.lector["Codigo"];
                    aux.descripcion_a = (string)datos.lector["Detalle"];
                    aux.Id_a = (int)datos.lector["Id"];
                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Categoria"))))
                    {
                        aux.categoria_a = new Categoria();
                        aux.categoria_a.nombre_categoria = (string)datos.lector["Categoria"];
                        aux.categoria_a.codigo_categoria = (int)datos.lector["IdCategoria"];

                    }
                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Marca"))))
                    {
                        aux.marca_a = new Marca();
                        aux.marca_a.Nombre = (string)datos.lector["Marca"];
                        aux.marca_a.Codigo = (int)datos.lector["IdMarca"];
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
        public List<Articulos> listarno(string nom)
        {
            List<Articulos> lista = new List<Articulos>();
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("select Codigo, A.Id , A.Nombre, A.Precio, A.Descripcion Detalle, M.Descripcion Marca, A.IdMarca idMarca, C.Descripcion Categoria, A.IdCategoria IdCategoria from ARTICULOS A, MARCAS M, CATEGORIAS C where A.Nombre = @nombre AND M.Id = A.IdMarca AND C.Id = A.IdCategoria");
                datos.setearparametro("@nombre", nom);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Articulos aux = new Articulos();
                    aux.nombre_a = (string)datos.lector["Nombre"];
                    aux.precio_a = (decimal)datos.lector["Precio"];
                    aux.precio_a = Math.Round(aux.precio_a, 2);
                    aux.codigo_a = (string)datos.lector["Codigo"];
                    aux.descripcion_a = (string)datos.lector["Detalle"];
                    aux.Id_a = (int)datos.lector["Id"];

                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Categoria"))))
                    {
                        aux.categoria_a = new Categoria();
                        aux.categoria_a.nombre_categoria = (string)datos.lector["Categoria"];
                        aux.categoria_a.codigo_categoria = (int)datos.lector["IdCategoria"];

                    }
                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Marca"))))
                    {
                        aux.marca_a = new Marca();
                        aux.marca_a.Nombre = (string)datos.lector["Marca"];
                        aux.marca_a.Codigo = (int)datos.lector["IdMarca"];
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

        public List<Articulos> Listapropia(string nombre_u)
        {
            throw new NotImplementedException();
        }

        public List<Articulos> listar(Marca id)
        {
            List<Articulos> lista = new List<Articulos>();
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("select A.codigo, A.nombre, A.precio, A.Id, A.descripcion, M.descripcion Marca, A.id_marca idMarca, A.id_categoria IdCategoria from Articulo A, MARCAS M, Categoria C where A.id_marca = @Id AND C.Id = A.id_categoria AND m.Id = @Id");
                datos.setearparametro("@Id", id.Codigo);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Articulos aux = new Articulos();
                    aux.nombre_a = (string)datos.lector["Nombre"];
                    aux.precio_a = (decimal)datos.lector["Precio"];
                    aux.precio_a = Math.Round(aux.precio_a, 2);
                    aux.codigo_a = (string)datos.lector["Codigo"];
                    aux.descripcion_a = (string)datos.lector["Descripcion"];
                    aux.Id_a = (int)datos.lector["Id"];
                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Categoria"))))
                    {
                        aux.categoria_a = new Categoria();
                        aux.categoria_a.nombre_categoria = (string)datos.lector["Categoria"];
                        aux.categoria_a.codigo_categoria = (int)datos.lector["IdCategoria"];

                    }
                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Marca"))))
                    {
                        aux.marca_a = new Marca();
                        aux.marca_a.Nombre = (string)datos.lector["Marca"];
                        aux.marca_a.Codigo = (int)datos.lector["IdMarca"];
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



        public List<Articulos> listarcategoria(Categoria id)
        {
            List<Articulos> lista = new List<Articulos>();
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("select Codigo, A.Id,A.Nombre,A.Precio, A.Descripcion, M.Descripcion Marca, A.IdMarca idMarca, C.Descripcion Categoria, A.IdCategoria IdCategoria from ARTICULOS A, MARCAS M, CATEGORIAS C where A.IdCategoria = @Id AND M.Id = A.IdMarca AND C.Id = @Id");
                datos.setearparametro("@Id", id.codigo_categoria);
                datos.ejecutarlectura();
                while (datos.lector.Read())
                {
                    Articulos aux = new Articulos();
                    aux.nombre_a = (string)datos.lector["Nombre"];
                    aux.precio_a = (decimal)datos.lector["Precio"];
                    aux.precio_a = Math.Round(aux.precio_a, 2);
                    aux.codigo_a = (string)datos.lector["Codigo"];
                    aux.descripcion_a = (string)datos.lector["Descripcion"];
                    aux.Id_a = (int)datos.lector["Id"];
                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Categoria"))))
                    {
                        aux.categoria_a = new Categoria();
                        aux.categoria_a.nombre_categoria = (string)datos.lector["Categoria"];
                        aux.categoria_a.codigo_categoria = (int)datos.lector["IdCategoria"];

                    }
                    if (!(datos.lector.IsDBNull(datos.lector.GetOrdinal("Marca"))))
                    {
                        aux.marca_a = new Marca();
                        aux.marca_a.Nombre = (string)datos.lector["Marca"];
                        aux.marca_a.Codigo = (int)datos.lector["IdMarca"];
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
        public void modificar(Articulos articulo)
        {
            Acceso_Datos datos = new Acceso_Datos();

            try
            {
                datos.setearconsulta("update Articulo set codigo=@Codigo, nombre= @Nombre, descripcion =@Descripcion,id_marca=@Id_marca, id_categoria= @Id_categoria, precio= @Precio where id_producto=@Id_producto");
                datos.setearparametro("@Codigo", articulo.codigo_a);
                datos.setearparametro("@Nombre", articulo.nombre_a);
                datos.setearparametro("@Descripcion", articulo.descripcion_a);
                datos.setearparametro("@Id_marca", articulo.marca_a.Codigo);
                datos.setearparametro("@Id_categoria", articulo.categoria_a.codigo_categoria);
                datos.setearparametro("@Precio", articulo.precio_a);
                datos.setearparametro("@Id_producto", articulo.Id_a);
                datos.ejecutaraccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void Eliminar(Articulos articulo)
        {
            Acceso_Datos datos = new Acceso_Datos();
            try
            {
                datos.setearconsulta("delete from Imagen where Id_articulo= @Id_producto");
                datos.setearparametro("@Id_producto", articulo.Id_a);
                datos.ejecutaraccion();
                datos.cerrarconexion();
                datos.setearconsulta("delete from Articulo where id_producto= @Id_produc");
               datos.setearparametro("@Id_produc", articulo.Id_a);
                datos.ejecutaraccion();
                datos.cerrarconexion();



            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
    }
}
