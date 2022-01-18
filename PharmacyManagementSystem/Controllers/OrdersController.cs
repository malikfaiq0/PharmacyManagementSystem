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
    public class OrdersController : Controller
    {
        private PharmacyDatabaseEntities9 db = new PharmacyDatabaseEntities9();

        // GET: Orders
        public ActionResult Index()
        {
            if (Session["UserId"] == null)
            {
                return RedirectToAction("Index", "Login");
            }
            else
            {
                var orders = db.Orders.Include(o => o.Customer).Include(o => o.Medicine); 
                return View(orders.ToList());
            }
           
        }

        // GET: Orders/Details/5
        public ActionResult Details(int id)
        {
            return View(db.Orders.Where(x=>x.ord_id==id).FirstOrDefault());
           

        }

        // GET: Orders/Create
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

        // POST: Orders/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Order order)
        {
            if (ModelState.IsValid)
            {
                db.Orders.Add(order);
                order.total = order.quantity * order.unit_price;
                db.SaveChanges();
                return RedirectToAction("Index");
              
            }

            ViewBag.cus_id = new SelectList(db.Customers, "cus_id", "firstname", order.cus_id);
            ViewBag.med_id = new SelectList(db.Medicines, "med_id", "name", order.med_id);
            return View(order);
        }

        // GET: Orders/Edit/5
        public ActionResult Edit(int id)
        {
            Order order = new Order();
            ViewBag.cus_id = new SelectList(db.Customers, "cus_id", "firstname", order.cus_id);
            ViewBag.med_id = new SelectList(db.Medicines, "med_id", "name", order.med_id);
            return View(db.Orders.Where(x => x.ord_id == id).FirstOrDefault());

        }

        // POST: Orders/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Order order)
        {
            if (ModelState.IsValid)
            {
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.cus_id = new SelectList(db.Customers, "cus_id", "firstname", order.cus_id);
            ViewBag.med_id = new SelectList(db.Medicines, "med_id", "name", order.med_id);
            return View(order);
        }

        // GET: Orders/Delete/5
        public ActionResult Delete(int id)
        {
            return View(db.Orders.Where(x=>x.ord_id==id).FirstOrDefault());

        }

        // POST: Orders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Order order = db.Orders.Find(id);
            db.Orders.Remove(order);
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
