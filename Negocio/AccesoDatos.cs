using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;


namespace Negocio
{
    public class Acceso_Datos
    {
        private SqlConnection conexion;
        public SqlCommand comando;
        private SqlDataReader Lector;

        public SqlDataReader lector
        {
            get { return Lector; }
        }

        public Acceso_Datos()
        {
            conexion = new SqlConnection("server=.\\SQLEXPRESS; database=negocio; integrated security=true");
            comando = new SqlCommand();



        }
        public void setearconexion(SqlConnection conexion)
        {
            this.conexion = conexion;
        }
        public void abrir()
        {
            conexion = new SqlConnection("server=.\\SQLEXPRESS; database=negocio; integrated security=true");
            comando = new SqlCommand();
            conexion.Open();


        }

        public void setearconsulta(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;

        }
        public void setearparametro(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }


        public void ejecutarlectura()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                Lector = comando.ExecuteReader();

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }

        public void ejecutaraccion()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void ejecutaraccion2()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void ejecutaraccion3()
        {
            comando.Connection = conexion;
            try
            {
                //conexion.Open();
                comando.ExecuteNonQuery();
                conexion.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public object ejecutarScalar()
        {

            object res = comando.ExecuteScalar();
            conexion.Close();
            return res;
        }



        public void cerrarconexion()
        {
            if (lector != null)
                lector.Close();
            conexion.Close();
        }

    }
}