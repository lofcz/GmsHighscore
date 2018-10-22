using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using NHibernate;
using NHibernate.Cfg;

namespace gms2server
{
    public class NHibernateHelper
    {
        private static ISessionFactory factory;

        public static ISession Session
        {
            get
            {
                if (factory == null)
                {
                    Configuration cfg = new Configuration();
                    factory = cfg.Configure(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "hibernate.cfg.xml")).BuildSessionFactory();

                }

                return factory.OpenSession();
            }
        }
    }
}