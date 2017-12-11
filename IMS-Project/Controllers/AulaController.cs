using IMS_Project.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS_Project.Controllers
{
    public class AulaController : Controller
    {
        cursosEntities db = new cursosEntities();

        public ActionResult Index()
        {
            return View(db.aula.ToList());
        }

        public ActionResult Create()
        {
            GetViewBagData();
            return View();
        }
        public void GetViewBagData()
        {
            ViewBag.SupplierID = new SelectList(db.carrera, "Carrera", "Carrera");
            

        }

        [HttpPost]
        public ActionResult Create(aula prod)
        {
            if (ModelState.IsValid)
            {
                
                db.aula.Add(prod);
                db.SaveChanges();
                return RedirectToAction("Index", "Aula");
            }
            GetViewBagData();
            return View();
        }


        //Get Edit
        [HttpGet]
        public ActionResult Edit(int id)
        {
            aula Aula = db.aula.Single(x => x.id == id);
            if (Aula == null)
            {
                return HttpNotFound();
            }
            GetViewBagData();
            return View("Edit", Aula);
        }

        //Post Edit
        [HttpPost]
        public ActionResult Edit(aula prod)
        {
            if (ModelState.IsValid)
            {
                db.Entry(prod).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "Aula");
            }
            GetViewBagData();
            return View(prod);
        }

        //Get Details
        public ActionResult Details(int id)
        {
            aula  Aula = db.aula.Find(id);
            if (Aula == null)
            {
                return HttpNotFound();
            }
            return View(Aula);
        }

        //Get Delete
        public ActionResult Delete(int id)
        {
            aula Aula = db.aula.Find(id);
            if (Aula == null)
            {
                return HttpNotFound();
            }
            return View(Aula);

        }

        //Post Delete Confirmed
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            aula Aula = db.aula.Find(id);
            db.aula.Remove(Aula);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
        
    }
}