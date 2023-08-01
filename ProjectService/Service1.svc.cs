using ProjectDB.Dao;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Security.Cryptography.X509Certificates;
using System.ServiceModel;
using System.Text;

namespace ProjectService
{
    public class Service1 : IService1
    {
        public string addAlumno(IList<String> data)
        {
            Alumno a = new Alumno();
            string s = a.addAlumno(data);
            return s;
        }
        public IList<String> getCiudades()
        {
            Ciudad c = new Ciudad();
            IList<String> ciudades = c.getCiudades();
            return ciudades;
        }
    }
}
