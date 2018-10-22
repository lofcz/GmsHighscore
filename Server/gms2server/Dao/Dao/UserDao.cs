using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using gms2server.Dao.Dao.Base;
using gms2server.Dao.Models;
using NHibernate.Criterion;

namespace gms2server.Dao.Dao
{
    public class UserDao : DaoBase<User>
    {
        public bool NameFree(string name)
        {
            return !(session.CreateCriteria<User>().Add(Restrictions.Like("Name", name)).List<User>().Count > 0);
        }

        public User GetByName(string name)
        {
            return session.CreateCriteria<User>().Add(Restrictions.Like("Name", name)).UniqueResult<User>();
        }
    }
}