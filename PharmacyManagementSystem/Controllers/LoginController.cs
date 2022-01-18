using PharmacyManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PharmacyManagementSystem.Controllers
{
    public class LoginController : Controller
    {
        PharmacyDatabaseEntities db = new PharmacyDatabaseEntities();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(login objcheck)
        {
            var user = db.logins.Where(model => model.username == objcheck.username && model.password == objcheck.password).FirstOrDefault();
            if (user != null)
            {
                Session["UserId"] = objcheck.id.ToString();
                Session["UserName"] = objcheck.username.ToString();
                TempData["LoginSuccessMessage"] = "<script>alert('Login Successfull !!')</script>";
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.ErrorMessage = "<script>alert('Username or password is incorrect!!')</script>";
                return View();
               
            
            }

        }


        public ActionResult Signup()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Signup(login objcheck)
        {
            if(ModelState.IsValid == true)
            {
                db.logins.Add(objcheck);
                int a = db.SaveChanges();
                if(a > 0)
                {
                    ViewBag.InsertMessage = "<script>alert('Registered Successfully !!')</script>";
                    ModelState.Clear();

                }
                else
                {
                    ViewBag.InsertMessage = "<script>alert('Registeration Failed !!')</script>";

                }
            }
            return View();
        }

        public ActionResult Logout()
        {

            Session.Clear();
            return RedirectToAction("Index", "Login");

        }

    }
}