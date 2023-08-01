using ProjectDB.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectDB
{
    internal class DBConnection
    {
        public static void Main(string[] args)
        {
            DBConnection db = new DBConnection();
            db.query();

            Console.ReadKey();
        }

        private void query()
        {
            Ciudad c = new Ciudad();
            IList<string> ciudades = c.getCiudades();

            if (ciudades == null)
            {
                Console.WriteLine("No data");
                return;
            }
            for (int i = 0; i < ciudades.Count; i++)
            {
                Console.WriteLine(ciudades[i]);
            }
        }
    }
}
