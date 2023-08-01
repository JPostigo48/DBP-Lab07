using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace ProjectService
{
    [ServiceContract]
    public interface IService1
    {
        [OperationContract]
        string addAlumno(IList<String> data);

        [OperationContract]
        IList<String> getCiudades();
    }
}
