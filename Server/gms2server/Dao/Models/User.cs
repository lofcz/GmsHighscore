using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using gms2server.Dao.Interface;

namespace gms2server.Dao.Models
{
    public class User : IEntity
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Pass { get; set; }
    }
}