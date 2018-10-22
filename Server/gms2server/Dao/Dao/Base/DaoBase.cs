using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using gms2server.Dao.Interface;
using NHibernate;
using NHibernate.Criterion;

namespace gms2server.Dao.Dao.Base
{
    public class DaoBase<T> : IDaoBase<T> where T : class, IEntity
    {
        protected ISession session;

        public DaoBase()
        {
            session = NHibernateHelper.Session;
        }

        public object Create(T entity)
        {
            object o;

            using (ITransaction t = session.BeginTransaction())
            {
                o = session.Save(entity);
                t.Commit();    
            }

            return o;
        }

        public void Delete(T entity)
        {
            using (ITransaction t = session.BeginTransaction())
            {
                session.Delete(entity);
                t.Commit();
            }
        }

        public IList<T> GetAll()
        {
            return session.QueryOver<T>().List<T>();
        }

        public T GetById(int id)
        {
            return session.CreateCriteria<T>().Add(Restrictions.Eq("Id", id)).UniqueResult<T>();
        }

        public int GetCount()
        {
            return session.QueryOver<T>().RowCount();
        }

        public void Update(T entity)
        {
            using (ITransaction t = session.BeginTransaction())
            {
                session.Update(entity);
                t.Commit();
            }
        }

        public void Close()
        {
            session.Close();
        }
    }
}