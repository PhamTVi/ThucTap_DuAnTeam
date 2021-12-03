using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThucTap_DuAnTeam_PhamThiVi.Models;

namespace ThucTap_DuAnTeam_PhamThiVi.Controllers
{
    public class DuAnThamGiaController : Controller
    {
        TASK_THUCTAPEntities ql = new TASK_THUCTAPEntities();
        // GET: DuAnThamGia
         public ActionResult ThamGiaDuAnTheoND()
        {
            if(Session["TaiKhoan"] != null)
            {
                    NGUOIDUNG nd = (NGUOIDUNG)Session["TaiKhoan"];
                    var ndu = ql.DUANTHAMGIAs.Where(s => s.idNguoiDung == nd.idNguoiDung);
                    if (ndu != null)
                    {
                        return View(ndu.ToList());
                    }
            }
            else
            {
                return View(ql.DUANTHAMGIAs.ToList());
            }    
            return HttpNotFound();

        }
    }
}