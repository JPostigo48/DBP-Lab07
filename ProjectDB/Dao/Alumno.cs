using ProjectDB.Conexion;
using ProjectDB.IDao;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;

namespace ProjectDB.Dao
{
    public class Alumno :IAlumno
    {
        public string addAlumno(IList<string> data)
        {
            ConexionSQL conSQL = new ConexionSQL();


            try
            {
                conSQL.conectar();
                string query = "INSERT INTO DataAlumnos (Nombre,Apellidos,Email,Sexo,Ciudad,Requerimiento) VALUES ('" + data[0] + "','" + data[1] + "','" + data[2] + "','" + data[3] + "','" + data[4] + "','" + data[5] + "')";
                SqlDataReader reader = conSQL.executeQuery(query);
                conSQL.desconectar();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return "Hubo un error: " + ex.Message;
            }
            return "Alumno agregado exitosamente";
        }
    }
}
