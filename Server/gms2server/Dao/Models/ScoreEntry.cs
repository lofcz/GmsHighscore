using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using gms2server.Dao.Interface;

namespace gms2server.Dao.Models
{
    public class ScoreEntry : IEntity
    {
        public int Id { get; set; }
        public DateTime Timestamp { get; set; }
        public int Score { get; set; }
        public int UserId { get; set; }

        // internal
        public string UserName { get; set; }
    }
}