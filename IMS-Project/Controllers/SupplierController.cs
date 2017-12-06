using IMS_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;

namespace IMS_Project.Controllers
{
    public class SupplierController : Controller
    {

        cursosEntities db = new cursosEntities();

        // GET: Supplier
        public ActionResult Index()
        {
            return View(db.carrera.ToList());
        }

        
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(carrera supp)
        {
            if (ModelState.IsValid)
            {
                db.carrera.Add(supp);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View();
        }
        public ActionResult Edit(int id)
        {
            carrera supp = db.carrera.Single(x => x.id == id);
            if (supp==null)
            {
                return HttpNotFound();
            }
            return View(supp);
        }

        [HttpPost]
        public ActionResult Edit(carrera supp)
        {
            if (ModelState.IsValid)
            {
                db.Entry(supp).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(supp);
        }

        public ActionResult Details(int id)
        {
            carrera supp = db.carrera.Find(id);
            if (supp == null)
            {
                return HttpNotFound();
            }
            return View(supp);
        }

        public ActionResult Delete(int id)
        {
            carrera supp = db.carrera.Find(id);
            if (supp == null)
            {
                return HttpNotFound();
            }
            return View(supp);
        }

        //Post Delete Confirmed
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            carrera supp = db.carrera.Find(id);
            db.carrera.Remove(supp);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}