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
            return View(db.grupo.ToList());
        }

        public ActionResult Create()
        {
            GetViewBagData();
            return View();
        }
        public void GetViewBagData()
        {
            ViewBag.id_profesor = new SelectList(db.profesor, "id", "profesor");
            ViewBag.id_estudiante = new SelectList(db.estudiante, "id", "estudiante");
            ViewBag.id_curso = new SelectList(db.curso, "id", "nombre");
        }

        [HttpPost]
        public ActionResult Create(grupo prod)
        {
            if (ModelState.IsValid)
            {
                
                db.grupo.Add(prod);
                db.SaveChanges();
                return RedirectToAction("Index", "Grupo");
            }
            GetViewBagData();
            return View();
        }


        //Get Edit
        [HttpGet]
        public ActionResult Edit(int id)
        {
            grupo product = db.grupo.Single(x => x.id == id);
            if (product == null)
            {
                return HttpNotFound();
            }
            GetViewBagData();
            return View("Edit", product);
        }

        //Post Edit
        [HttpPost]
        public ActionResult Edit(grupo prod)
        {
            if (ModelState.IsValid)
            {
                db.Entry(prod).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "Grupo");
            }
            GetViewBagData();
            return View(prod);
        }

        //Get Details
        public ActionResult Details(int id)
        {
            grupo product = db.grupo.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        //Get Delete
        public ActionResult Delete(int id)
        {
            grupo product = db.grupo.Find(id);
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
            grupo product = db.grupo.Find(id);
            db.grupo.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
        
    }
}