using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS_Project.Models;

namespace IMS_Project.Controllers
{
    public class admin_LoginController : Controller
    {
        cursosEntities db = new cursosEntities();
        // GET: admin_Login
        public ActionResult Index()
        {
            return View();
        }        

        [HttpPost]
        public ActionResult Login(profesor login)
        {
            if (ModelState.IsValid)
            {
                var model = (from m in db.profesor
                             where m.nombre == login.nombre && m.ci == login.ci
                            select m).Any();
                if (model)
                {                 
                    var loginInfo = db.profesor.Where(x=>x.nombre==login.nombre && x.ci==login.ci).FirstOrDefault();

                    Session["username"] = loginInfo.nombre;
             
                   return RedirectToAction("Index", "Customer");
                }       
            }
            return View("Index");
        }
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "admin_Login");
        }
    }
}