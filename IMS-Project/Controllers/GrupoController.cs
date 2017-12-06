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
    public class GrupoController : Controller
    {
        cursosEntities db = new cursosEntities();

        public ActionResult Index()
        {
            return View(db.curso.ToList());
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
        public ActionResult Create(curso prod)
        {
            if (ModelState.IsValid)
            {
                
                db.curso.Add(prod);
                db.SaveChanges();
                return RedirectToAction("Index", "Product");
            }
            GetViewBagData();
            return View();
        }


        //Get Edit
        [HttpGet]
        public ActionResult Edit(int id)
        {
            curso product = db.curso.Single(x => x.id == id);
            if (product == null)
            {
                return HttpNotFound();
            }
            GetViewBagData();
            return View("Edit", product);
        }

        //Post Edit
        [HttpPost]
        public ActionResult Edit(curso prod)
        {
            if (ModelState.IsValid)
            {
                db.Entry(prod).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "Product");
            }
            GetViewBagData();
            return View(prod);
        }

        //Get Details
        public ActionResult Details(int id)
        {
            curso  product = db.curso.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        //Get Delete
        public ActionResult Delete(int id)
        {
            curso product = db.curso.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);

        }

        //Post Delete Confirmed
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            curso product = db.curso.Find(id);
            db.curso.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
        
    }
}