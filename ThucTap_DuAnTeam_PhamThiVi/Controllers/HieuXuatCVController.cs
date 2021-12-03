using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThucTap_DuAnTeam_PhamThiVi.Models;
namespace ThucTap_DuAnTeam_PhamThiVi.Controllers
{
    public class HieuXuatCVController : Controller
    {
        TASK_THUCTAPEntities ql = new TASK_THUCTAPEntities();
        // GET: HieuXuatCV
        public ActionResult Index(int? TimKiem)
        {
            if (TimKiem != null)
            {
                ViewBag.idThang = TimKiem;
                return View();

            }    
            else
            {
                ViewBag.idThang = 1;
                return View();
            }    
               
        }
        public JsonResult loadDGThangLamViec(int? TimKiemThang)
        {
            int? maDAN = (int?)Session["MaDuAn"];
            ViewBag.idThang = TimKiemThang;
            var rs = ql.DGNHANSUTHEOTHANGs.Where(s => s.idThang == TimKiemThang && s.THANGLAMVIEC.idDuAn == maDAN).ToList();
            if (rs != null)
            {
                return Json(new
                {
                    dataList = (from a in rs select new { year = a.NGUOIDUNG.HoDemND + a.NGUOIDUNG.TenND, soGio = a.TongGio, tbHoanThanh = a.TBThang, }).ToList(),
                    status = true
                }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new
                {
                    status = true
                }, JsonRequestBehavior.AllowGet);
            }
        }
        public JsonResult LoadDGThang(int? TimKiemThang)
        {
            int? maDAN = (int?)Session["MaDuAn"];
            ViewBag.idThang = TimKiemThang;
            var rs = ql.DGNHANSUTHEOTHANGs.Where(s => s.idThang == TimKiemThang && s.THANGLAMVIEC.idDuAn == maDAN).ToList();
            var tuan = ql.TUANLAMVIECs.Where(s => s.idThang == TimKiemThang).ToList();
             var DGTuan = ql.DGNHANSUTHEOTUANs.Where(s => s.idTuan == s.TUANLAMVIEC.idTuan && s.idNguoiDung == s.NGUOIDUNG.idNguoiDung).ToList();
            if (rs != null)
            {
                return Json(new
                {
                    dataList = (from a in rs select new { tenNS = a.NGUOIDUNG.TenND, a.XepLoai, a.NhanXetCaThang, tbHoanThanh = a.TBThang, }).ToList(),
                    dataList2 = (from a in DGTuan select new { a.idNguoiDung, a.HoanThanh }).ToList(),
                    status = true
                }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new
                {
                    status = true
                }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}