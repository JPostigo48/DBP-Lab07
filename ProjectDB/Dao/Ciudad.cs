using ProjectDB.Conexion;
using ProjectDB.IDao;
using ProjectDB.Dao;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectDB.Dao
{
    public class Ciudad : ICiudad
    {
        public IList<String> getCiudades()
        {
            ConexionSQL conSQL = new ConexionSQL();
            IList<String> result = new List <String>();

            try
            {
                conSQL.conectar();
                SqlDataReader reader = conSQL.executeQuery("SELECT ciudad FROM DataCiudad");
                

                while (reader.Read())
                {
                    result.Add(reader.GetString(0));
                }
                /*if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        result.Add(reader.GetString(0));
                    }
                }*/
                conSQL.desconectar();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return null;
            }

            return result;
        }
    }
}
