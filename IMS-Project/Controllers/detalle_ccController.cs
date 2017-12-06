using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS_Project.Models;

namespace IMS_Project.Controllers
{
    public class detalle_ccController : Controller
    {
        cursosEntities db = new cursosEntities();

        public void InsertWithoutData(curso prod, carrera sup)
        {
            using (db)
            {
                //add instances to context
                db.curso.Add(prod);
                db.carrera.Add(sup);

                //add instance that relates to another entity
                // in this case prod is an instance of Product entity
                // Product has a property call Supplier
                prod.carrera.Add(sup);

                //call SaveChanges from context to confirm inserts
                db.SaveChanges();
            }
        }
         public void InsertWithData(int productID, int supplierID)
        {
            using (db)
            {

                /*
				 * this steps have to follow to both entities
				 * 
				 * 1 - create instance of entity with relative primary key
				 * 
				 * 2 - add instance to context
				 * 
				 * 3 - attach instance to context
				 */

                // 1
                curso p = new curso { id = productID };
                // 2
                db.curso.Add(p);
                // 3
                db.curso.Attach(p);

                // 1
                carrera s = new carrera { id = supplierID };
                // 2
                db.carrera.Add(s);
                // 3
                db.carrera.Attach(s);

                // like previous method add instance that relates to another entity
                p.carrera.Add(s);

                // call SaveChanges
                db.SaveChanges();
            }
        }



        public void DeleteRelationship(int productID, int supplierID)
        {
            using (db)
            {
                // return one instance each entity by primary key

                var product = db.curso.FirstOrDefault(p => p.id == productID);
                var supplier = db.carrera.FirstOrDefault(s => s.id == supplierID);

                // call Remove method from navigation property for any instance
                // in other words, the statement
                // supplier.Product.Remove(product);
                // also works
                product.carrera.Remove(supplier);

                // call SaveChanges from context
                db.SaveChanges();
            }
        }

        public void UpdateRelationship(int oldProductID, int oldSupplierID, int newProductID, int newSupplierID)
        {
            DeleteRelationship(oldProductID, oldSupplierID);
            InsertWithData(newProductID, newSupplierID);
        }

        public List<DTOGenericObject> GetProductBySupplier(int supplierID)
        {
            using (db)
            {
                var result = (
                    // instance from context
                    from a in db.carrera
                        // instance from navigation property
                    from b in a.curso
                        //join to bring useful data
                    join c in db.curso on b.id equals c.id
                    where a.id == supplierID
                    select new DTOGenericObject
                    {
                        ID = c.id,
                        Name = c.nombre
                    }).ToList();

                return result;
            }
        }

        public List<DTOGenericObject> GetSupplierByProduct(int productID)
        {
            using (db)
            {
                var result = (from a in db.curso
                              from b in a.carrera
                              join c in db.carrera on b.id equals c.id
                              where a.id == productID
                              select new DTOGenericObject
                              {
                                  ID = c.id,
                                  Name = c.nombre
                              }).ToList();
                return result;
            }
        }






    }
}