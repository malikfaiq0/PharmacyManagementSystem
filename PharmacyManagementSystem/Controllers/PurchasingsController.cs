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
    public class PurchasingsController : Controller
    {
        private PharmacyDatabaseEntities9 db = new PharmacyDatabaseEntities9();

        // GET: Purchasings
        public ActionResult Index()
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            else
            {
                var purchasings = db.Purchasings.Include(p => p.Customer).Include(p => p.Medicine);
                return View(purchasings.ToList());
            }
           
        }

        // GET: Purchasings/Details/5
        public ActionResult Details(int? id)
        {
            return View(db.Purchasings.Where(x=>x.pur_id==id).FirstOrDefault());

        }

        // GET: Purchasings/Create
        public ActionResult Create()
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            else
            {
                ViewBag.cus_id = new SelectList(db.Customers, "cus_id", "firstname");
                ViewBag.med_id = new SelectList(db.Medicines, "med_id", "name");
                return View();
            }
        }

        // POST: Purchasings/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Purchasing purchasing)
        {
            if (ModelState.IsValid)
            {
                db.Purchasings.Add(purchasing);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.cus_id = new SelectList(db.Customers, "cus_id", "firstname", purchasing.cus_id);
            ViewBag.med_id = new SelectList(db.Medicines, "med_id", "name", purchasing.med_id);
            return View(purchasing);
        }

        // GET: Purchasings/Edit/5
        public ActionResult Edit(int id)
        {
            Purchasing purchasing = new Purchasing();
            ViewBag.cus_id = new SelectList(db.Customers, "cus_id", "firstname", purchasing.cus_id);
            ViewBag.med_id = new SelectList(db.Medicines, "med_id", "name", purchasing.med_id);
            return View(db.Purchasings.Where(x => x.pur_id == id).FirstOrDefault());

        }

        // POST: Purchasings/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Purchasing purchasing)
        {
            if (ModelState.IsValid)
            {
                db.Entry(purchasing).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.cus_id = new SelectList(db.Customers, "cus_id", "firstname", purchasing.cus_id);
            ViewBag.med_id = new SelectList(db.Medicines, "med_id", "name", purchasing.med_id);
            return View(purchasing);
        }

        // GET: Purchasings/Delete/5
        public ActionResult Delete(int? id)
        {
            return View(db.Purchasings.Where(x => x.pur_id == id).FirstOrDefault());

        }

        // POST: Purchasings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Purchasing purchasing = db.Purchasings.Find(id);
            db.Purchasings.Remove(purchasing);
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
