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
    public class ReportsController : Controller
    {
        private PharmacyDatabaseEntities9 db = new PharmacyDatabaseEntities9();

        // GET: Reports
        public ActionResult Index()
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            else
            {

                var reports = db.Reports.Include(r => r.Customer).Include(r => r.Order).Include(r => r.Purchasing);
                return View(reports.ToList());
            }
        }

        // GET: Reports/Details/5
        public ActionResult Details(int id)
        {
            return View(db.Reports.Where(x=>x.rep_id==id).FirstOrDefault());

        }

        // GET: Reports/Create
        public ActionResult Create()
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            else
            {
                ViewBag.cus_id = new SelectList(db.Customers, "cus_id", "firstname");
                ViewBag.ord_id = new SelectList(db.Orders, "ord_id", "ord_detail");
                ViewBag.pur_id = new SelectList(db.Purchasings, "pur_id", "pur_id");
                return View();
            }
        }

        // POST: Reports/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Report report)
        {
            if (ModelState.IsValid)
            {
                db.Reports.Add(report);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.cus_id = new SelectList(db.Customers, "cus_id", "firstname", report.cus_id);
            ViewBag.ord_id = new SelectList(db.Orders, "ord_id", "ord_detail", report.ord_id);
            ViewBag.pur_id = new SelectList(db.Purchasings, "pur_id", "pur_id", report.pur_id);
            return View(report);
        }

        // GET: Reports/Edit/5
        public ActionResult Edit(int id)
        {
            Report report = new Report();
            ViewBag.cus_id = new SelectList(db.Customers, "cus_id", "firstname", report.cus_id);
            ViewBag.ord_id = new SelectList(db.Orders, "ord_id", "ord_detail", report.ord_id);
            ViewBag.pur_id = new SelectList(db.Purchasings, "pur_id", "pur_id", report.pur_id);
            return View(db.Reports.Where(x => x.rep_id == id).FirstOrDefault());

        }

        // POST: Reports/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Report report)
        {
            if (ModelState.IsValid)
            {
                db.Entry(report).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.cus_id = new SelectList(db.Customers, "cus_id", "firstname", report.cus_id);
            ViewBag.ord_id = new SelectList(db.Orders, "ord_id", "ord_detail", report.ord_id);
            ViewBag.pur_id = new SelectList(db.Purchasings, "pur_id", "pur_id", report.pur_id);
            return View(report);
        }

        // GET: Reports/Delete/5
        public ActionResult Delete(int id)
        {
            return View(db.Reports.Where(x=>x.rep_id==id).FirstOrDefault());

        }

        // POST: Reports/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Report report = db.Reports.Find(id);
            db.Reports.Remove(report);
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
