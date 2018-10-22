using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace gms2server.Dao.Interface
{
    interface IDaoBase<T>
    {
        IList<T> GetAll();
        int GetCount();
        object Create(T entity);
        void Update(T entity);
        void Delete(T entity);
        T GetById(int id);

    }
}
