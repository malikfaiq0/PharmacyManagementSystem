using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PharmacyManagementSystem.Models;

namespace PharmacyManagementSystem.Controllers
{
    public class CustomersController : Controller
    {
        private PharmacyDatabaseEntities9 db = new PharmacyDatabaseEntities9();

        // GET: Customers
        public ActionResult Index()
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            else
            {
                var customers = db.Customers.Include(c => c.Staff);
                return View(customers.ToList());
            }
           
        }

        // GET: Customers/Details/5
        public ActionResult Details(int id)
        {
            return View(db.Customers.Where(x=>x.cus_id==id).FirstOrDefault());  
        }

        // GET: Customers/Create
        public ActionResult Create()
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            else
            {

                ViewBag.staf_id = new SelectList(db.Staffs, "staf_id", "firstname");
                return View();
            }
        }

        // POST: Customers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Customers.Add(customer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.staf_id = new SelectList(db.Staffs, "staf_id", "firstname", customer.staf_id);
            return View(customer);
        }

        // GET: Customers/Edit/5
        public ActionResult Edit(int id)
        {
           
            Customer customer = new Customer();
            ViewBag.staf_id = new SelectList(db.Staffs, "staf_id", "firstname", customer.staf_id);
            return View(db.Customers.Where(x => x.cus_id == id).FirstOrDefault());

        }

        // POST: Customers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(customer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }


            ViewBag.staf_id = new SelectList(db.Staffs, "staf_id", "firstname", customer.staf_id);
            return View(customer);
        }

        // GET: Customers/Delete/5
        public ActionResult Delete(int id)
        {
            return View(db.Customers.Where(x=>x.cus_id==id).FirstOrDefault());
            
        }

        // POST: Customers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Customer customer = db.Customers.Find(id);
            db.Customers.Remove(customer);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
