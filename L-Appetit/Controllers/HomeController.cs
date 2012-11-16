using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace L_Appetit.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "L'Appétit";


            return View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
