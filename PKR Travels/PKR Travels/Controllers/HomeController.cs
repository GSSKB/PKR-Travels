using PKR_Travels.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PKR_Travels.Controllers
{
    public class HomeController : Controller
    {
        DatabaseBus db = new DatabaseBus();

       [HttpGet]
        // GET: Home
        public ActionResult AddBusData()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddBusData(PKRTravel bus)
        {
            db.PKRTravels.Add(bus); 
            db.SaveChanges();
            return RedirectToAction("Index");

        /*  var boardingPoint = db.PKRTravels.ToList();
            ViewBag.BoardingPoint=new SelectList(boardingPoint,"BoardingPoint");*/
        }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult List()
        {
            List<PKRTravel> pkr=db.PKRTravels.ToList();
            return View(pkr);
        }
    }
}