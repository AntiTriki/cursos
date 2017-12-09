using IMS_Project.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS_Project.Controllers
{
    public class CustomerController : Controller
    {
        cursosEntities db = new cursosEntities();

        public ActionResult Index()
        {
            return View(db.estudiante.ToList());
        }

        public ActionResult Create()
        {
            GetViewBagData();
            return View();
        }
        public void GetViewBagData()
        {
            
            ViewBag.id_grupo = new SelectList(db.grupo, "id", "nombre");
        }

        [HttpPost]
        public ActionResult Create(estudiante customer)
        {
            if (ModelState.IsValid)
            {
                db.estudiante.Add(customer);
                db.SaveChanges();
                return RedirectToAction("Index", "Customer");
            }
            GetViewBagData();
            return View();
        }

        //Get Edit
        [HttpGet]
        public ActionResult Edit(int id)
        {
            estudiante cust = db.estudiante.Single(x => x.id == id);
            if (cust == null)
            {
                return HttpNotFound();
            }
            GetViewBagData();
            return View("Edit", cust);
        }

        //Post Edit
        [HttpPost]
        public ActionResult Edit(estudiante cust)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cust).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "Customer");
            }
            GetViewBagData();
            return View(cust);
        }

        //Get Details
        public ActionResult Details(int id)
        {
            estudiante cust = db.estudiante.Find(id);
            if (cust == null)
            {
                return HttpNotFound();
            }
            return View(cust);
        }

        //Get Delete
        public ActionResult Delete(int id)
        {
            estudiante cust = db.estudiante.Find(id);
            if (cust == null)
            {
                return HttpNotFound();
            }
            return View(cust);

        }

        //Post Delete Confirmed
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            estudiante cust = db.estudiante.Find(id);
            db.estudiante.Remove(cust);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
    }
}