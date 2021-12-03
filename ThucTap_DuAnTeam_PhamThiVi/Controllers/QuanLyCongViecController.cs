using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThucTap_DuAnTeam_PhamThiVi.Models;

namespace ThucTap_DuAnTeam_PhamThiVi.Controllers
{
    public class QuanLyCongViecController : Controller
    {
       TASK_THUCTAPEntities  ql = new TASK_THUCTAPEntities();
        // GET: QuanLyCongViec
        public ActionResult Index(int MaDuAn)
        {
            DUAN duAn = ql.DUANs.Single(s => s.idDuAn == MaDuAn);
            Session["DuAn"] = duAn.TenDuAn;
            Session["MaDuAn"] = duAn.idDuAn;
            if (duAn == null)
            {
                return HttpNotFound();
            }
            var toDoList = ql.TODOLISTs.Where(td => td.idDuAn == duAn.idDuAn).ToList();
            if(toDoList.Count != 0)
            { 
                ViewBag.slToDo = ql.TODOLISTs.Where(td => td.idDuAn == duAn.idDuAn).Count();
                ViewBag.hanDen = ql.TODOLISTs.Where(td => td.idDuAn == duAn.idDuAn).FirstOrDefault().HanDen.ToString();
                ViewBag.noiDung = ql.TODOLISTs.Where(td => td.idDuAn == duAn.idDuAn).FirstOrDefault().NoiDung;
                ViewData["todoList"] = ql.TODOLISTs.Where(td => td.idDuAn == duAn.idDuAn).ToList();
                ViewData["tracuu"] = ql.NGUOIDUNGs.ToList();
            }    
            else
            {
                ViewBag.slToDo = 0;
            }    
            
            return RedirectToAction("QuanLyCongViec", "QuanLyCongViec");
        }
        [HttpGet]
        public ActionResult QuanLyCongViec()
        {
            int? maduan = (int?)Session["MaDuAn"];
            DUAN duAn = ql.DUANs.Single(s => s.idDuAn == maduan);
            if (duAn == null)
            {
                return HttpNotFound();
            }
            var toDoList = ql.TODOLISTs.Where(td => td.idDuAn == duAn.idDuAn).ToList();
            if (toDoList.Count != 0)
            {
                ViewBag.slToDo = ql.TODOLISTs.Where(td => td.idDuAn == duAn.idDuAn).Count();
                ViewBag.hanDen = ql.TODOLISTs.Where(td => td.idDuAn == duAn.idDuAn).FirstOrDefault().HanDen.ToString();
                ViewBag.noiDung = ql.TODOLISTs.Where(td => td.idDuAn == duAn.idDuAn).FirstOrDefault().NoiDung;
                ViewData["todoList"] = ql.TODOLISTs.Where(td => td.idDuAn == duAn.idDuAn).ToList();
                ViewData["tracuu"] = ql.NGUOIDUNGs.ToList();
            }
            else
            {
                ViewBag.slToDo = 0;
            }

            return View(duAn);
        }
        //tue sua o day
        [HttpPost]
        public ActionResult QuanLyCongViec(FormCollection f)
        {
            int? maduan = (int?)Session["MaDuAn"];
            DUAN duAn = ql.DUANs.Single(s => s.idDuAn == maduan);
            Session["DuAn"] = duAn.TenDuAn;
            Session["MaDuAn"] = duAn.idDuAn;
            if (duAn == null)
            {
                return HttpNotFound();
            }
            var toDoList = ql.TODOLISTs.Where(td => td.idDuAn == duAn.idDuAn).ToList();
            if (toDoList.Count != 0)
            {
                ViewBag.slToDo = ql.TODOLISTs.Where(td => td.idDuAn == duAn.idDuAn).Count();
                ViewBag.hanDen = ql.TODOLISTs.Where(td => td.idDuAn == duAn.idDuAn).FirstOrDefault().HanDen.ToString();
                ViewBag.noiDung = ql.TODOLISTs.Where(td => td.idDuAn == duAn.idDuAn).FirstOrDefault().NoiDung;
                ViewData["todoList"] = ql.TODOLISTs.Where(td => td.idDuAn == duAn.idDuAn).ToList();
                ViewData["tracuu"] = ql.NGUOIDUNGs.ToList();
            }
            else
            {
                ViewBag.slToDo = 0;
            }
            int? idTuan = int.Parse(f["TuanLamViec"]);
            ViewBag.idTuan = idTuan;
            ViewData["lstCVTuan"] = ql.CONGVIECTUANs.Where(t => t.idTuan == idTuan).ToList();
            ViewData["lstNV"] = ql.CONGVIECTUANs.Where(t => t.idTuan == idTuan).Select(t => t.idNguoiDung).Distinct().ToList();
            ViewData["lstNV2"] = ql.NGUOIDUNGs.ToList();
            ViewData["DanhGiaNS"] = ql.DGNHANSUTHEOTUANs.Where(t => t.idTuan == idTuan).ToList();
            ViewData["dsModule"] = ql.MODULEs.ToList();
            return View(duAn);
        }
        public JsonResult hienThiModule()
        {
                int? maDAN = (int?)Session["MaDuAn"];
                var rs = ql.MODULEs.ToList();
                return Json(new
                {
                    dataList = (from a in rs select new { a.idModule, a.TenModule }).ToList(),
                    status = true
                }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ThemCongViecTuan(int idTuan, int MaModule, int MaND, string TenIssue, string UrlIssue, string TenCongViec, int ThoiGianLam, string Nguon, string TrangThai, string NgayBD, string NgayKT, string GhiChu, int? GTThang)
        {
            try
            {
                var sp = new CONGVIECTUAN();
                sp.idTuan = idTuan;
                sp.idModule = MaModule;
                sp.idNguoiDung = MaND;
                sp.TenIssue = TenIssue;
                sp.Urllssue = UrlIssue;
                sp.TenCongViec = TenCongViec;
                sp.ThoiGianLam = ThoiGianLam;
                sp.Nguon = Nguon;
                sp.TrangThai = TrangThai;
                sp.NgayBD = DateTime.Parse(NgayBD);
                sp.NgayKT = DateTime.Parse(NgayKT);
                sp.GhiChu = GhiChu;
                ql.CONGVIECTUANs.Add(sp);
                ql.SaveChanges();
                int? maduan = (int?)Session["MaDuAn"];
                int? ibThang = GTThang;
                var ktra = ql.DGNHANSUTHEOTUANs.Where(s => s.idNguoiDung == MaND && s.idTuan == idTuan).ToList();
                if(ktra.Count == 0)
                {
                    var nhanSu = new DGNHANSUTHEOTUAN();
                    nhanSu.idTuan = idTuan;
                    nhanSu.idNguoiDung = MaND;
                    ql.DGNHANSUTHEOTUANs.Add(nhanSu);
                    ql.SaveChanges();
                }    
                var KTrathang = ql.DGNHANSUTHEOTHANGs.Where(s => s.idNguoiDung == MaND && s.idThang == ibThang).ToList();
                if (KTrathang.Count == 0)
                {
                    var nhanSuT = new DGNHANSUTHEOTHANG();
                    nhanSuT.idThang = ibThang;
                    nhanSuT.idNguoiDung = MaND;
                    ql.DGNHANSUTHEOTHANGs.Add(nhanSuT);
                    ql.SaveChanges();
                }
                else
                {
                    var sua = ql.DGNHANSUTHEOTHANGs.Single(s => s.idNguoiDung == MaND && s.idThang == ibThang);
                    sua.KhoiLuong = sua.KhoiLuong + " ";
                    ql.SaveChanges();
                }    
                return Json(new
                {
                    status = true
                }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                return Json(new
                {
                    code = 500,
                    msg = "Lỗi rồi" + ex.Message
                }, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        public ActionResult SuaCVT(FormCollection f)
        {
            int idCVT = int.Parse(f["idCVT"]);
            var cvt = ql.CONGVIECTUANs.Where(t => t.idCongViecTuan == idCVT).FirstOrDefault();
            cvt.idModule = int.Parse(f["module"]);
            cvt.Urllssue = f["url"];
            cvt.TenCongViec = f["TenCongViec"];
            cvt.Nguon = f["Nguon"];
            cvt.ThoiGianLam = int.Parse(f["ThoiGianLam"]);
            cvt.NgayBD = DateTime.Parse(f["NgayBD"]);
            cvt.NgayKT = DateTime.Parse(f["NgayKT"]);
            cvt.TrangThai = f["TrangThai"];
            cvt.GhiChu = f["GhiChu"];
            int? idThang = int.Parse(f["idThang"]);
            int? idNguoiDung = int.Parse(f["idNguoiDung"]);
            var sua = ql.DGNHANSUTHEOTHANGs.Single(s => s.idNguoiDung == idNguoiDung && s.idThang == idThang);
            if( sua != null)
            {
                sua.KhoiLuong = sua.KhoiLuong + " ";
                ql.SaveChanges();
            }    
            ql.SaveChanges();
            var maduan = Session["MaDuAn"];
            return RedirectToAction("QuanLyCongViec", "QuanLyCongViec");
        }

      
    }
}