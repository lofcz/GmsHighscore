using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using gms2server.Dao.Dao;
using gms2server.Dao.Models;
using Microsoft.Ajax.Utilities;

namespace gms2server.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult PostScore(int? score, string name, string pass)
        {

            if (score.HasValue)
            {
                UserDao d = new UserDao();
                User u = d.GetByName(name);

                if (u.Pass == pass)
                {
                    ScoreEntry s = new ScoreEntry()
                    {
                        Id = 0,
                        Score = (int) score,
                        Timestamp = DateTime.Now,
                        UserId = u.Id
                    };

                    new ScoreEntryDao().Create(s);
                    return Json("ok", JsonRequestBehavior.AllowGet);
                }

                return Json("errorWrongPassword", JsonRequestBehavior.AllowGet);
            }

            return Json("error1", JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetAllScore()
        {
            UserDao d = new UserDao();
            var data = new ScoreEntryDao().GetAll();

            foreach (ScoreEntry se in data)
            {
                se.UserName = d.GetById(se.UserId).Name;
            }
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetUserPosition(string user)
        {
            UserDao d = new UserDao();
            User u = d.GetByName(user);
            List<User> allUsers = d.GetAll().ToList();

            ScoreEntryDao sd = new ScoreEntryDao();
            List<ScoreEntry> entries = sd.GetAll().ToList();

            if (u == null)
            {
                return Json("errorUserDoesntExist", JsonRequestBehavior.AllowGet);
            }

            entries.OrderByDescending(x => x.Score);
            ScoreEntry firstResult = entries.FirstOrDefault(x => x.UserId == u.Id);

            if (firstResult == null)
            {
                return Json("errorUserHasNoScore", JsonRequestBehavior.AllowGet);
            }

            return Json(entries.FindIndex(x => x.UserId == u.Id), JsonRequestBehavior.AllowGet);
        }

        public ActionResult CheckUser(string name)
        {
            bool flag = new UserDao().NameFree(name);
            return Json(flag, JsonRequestBehavior.AllowGet);
        }

        public ActionResult PostUser(string name, string pass)
        {
            UserDao d = new UserDao();
            if (d.NameFree(name))
            {
                User u = new User()
                {
                    Id = 0,
                    Name = name,
                    Pass = pass
                };

                d.Create(u);
                return Json("ok", JsonRequestBehavior.AllowGet);
            }

            return Json("errorNameTaken", JsonRequestBehavior.AllowGet);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}