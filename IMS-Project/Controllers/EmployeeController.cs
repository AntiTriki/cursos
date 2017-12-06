using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS_Project.Models;
using System.Data;

namespace IMS_Project.Controllers
{
    public class EmployeeController : Controller
    {
        cursosEntities db = new cursosEntities();

        public ActionResult Index()
        {
            return View(db.profesor.ToList());
        }
        
        public ActionResult Create()
        {            
            return View();
        }

        [HttpPost]
        public ActionResult Create(profesor emp)
        {
            if (ModelState.IsValid)
            {
                db.profesor.Add(emp);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
           
            return View();
        }

        //Get Edit
        [HttpGet]
        public ActionResult Edit(int id)
        {
            profesor emp = db.profesor.Single(x => x.id == id);
            if (emp==null)
            {
                return HttpNotFound();
            }
            //ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "RoleName", emp.RoleID);
            return View("Edit",emp);
        }

        //Post Edit
        [HttpPost]
        public ActionResult Edit(profesor emp)
        {
            if (ModelState.IsValid)
            {
                db.Entry(emp).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            //ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "RoleName", emp.RoleID);
            return View(emp);
        }

        //Get Details
        public ActionResult Details(int id)
        {
           profesor emp= db.profesor.Find(id);
           if (emp==null)
           {
               return HttpNotFound();
           }
           return View(emp);
        }

        //Get Delete
        public ActionResult Delete(int id)
        {
            profesor emp = db.profesor.Find(id);
            if (emp==null)
            {
                return HttpNotFound();
            }
            return View(emp);
 
        }

        //Post Delete Confirmed
        [HttpPost,ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            profesor admin_Employee = db.profesor.Find(id);
            db.profesor.Remove(admin_Employee);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }
        
    }
}