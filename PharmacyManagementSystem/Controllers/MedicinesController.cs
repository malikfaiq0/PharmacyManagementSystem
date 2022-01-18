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
    public class MedicinesController : Controller
    {
        private PharmacyDatabaseEntities9 db = new PharmacyDatabaseEntities9();

        // GET: Medicines
        public ActionResult Index()
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            else
            {
                var medicines = db.Medicines.Include(m => m.Category).Include(m => m.Supplier);
                return View(medicines.ToList());
            }
            
        }

        // GET: Medicines/Details/5
        public ActionResult Details(int id)
        {
            return View(db.Medicines.Where(x=>x.med_id==id).FirstOrDefault());

        }

        // GET: Medicines/Create
        public ActionResult Create()
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            else
            {
                ViewBag.cat_id = new SelectList(db.Categories, "cat_id", "cat_name");
                ViewBag.sup_id = new SelectList(db.Suppliers, "sup_id", "name");
                return View();
            }
        }

        // POST: Medicines/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Medicine medicine)
        {
            if (ModelState.IsValid)
            {
                db.Medicines.Add(medicine);
                medicine.total = medicine.quantity * medicine.price;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.cat_id = new SelectList(db.Categories, "cat_id", "cat_name", medicine.cat_id);
            ViewBag.sup_id = new SelectList(db.Suppliers, "sup_id", "name", medicine.sup_id);
            return View(medicine);
        }

        // GET: Medicines/Edit/5
        public ActionResult Edit(int id)
        {

            Medicine medicine = new Medicine();
            ViewBag.cat_id = new SelectList(db.Categories, "cat_id", "cat_name", medicine.cat_id);
            ViewBag.sup_id = new SelectList(db.Suppliers, "sup_id", "name", medicine.sup_id);
            return View(db.Medicines.Where(x=>x.med_id==id).FirstOrDefault());

        }

        // POST: Medicines/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Medicine medicine)
        {
            if (ModelState.IsValid)
            {
                db.Entry(medicine).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.cat_id = new SelectList(db.Categories, "cat_id", "cat_name", medicine.cat_id);
            ViewBag.sup_id = new SelectList(db.Suppliers, "sup_id", "name", medicine.sup_id);
            return View(medicine);
        }

        // GET: Medicines/Delete/5
        public ActionResult Delete(int id)
        {
            return View(db.Medicines.Where(x => x.med_id == id).FirstOrDefault());

        }

        // POST: Medicines/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Medicine medicine = db.Medicines.Find(id);
            db.Medicines.Remove(medicine);
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
