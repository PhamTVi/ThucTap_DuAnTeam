using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThucTap_DuAnTeam_PhamThiVi.Models;

namespace ThucTap_DuAnTeam_PhamThiVi.Controllers
{
    public class QuanLyNguoiDungController : Controller
    {
        TASK_THUCTAPEntities ql = new TASK_THUCTAPEntities();
        // GET: QuanLyNguoiDung
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult hienThiTatCaDuAn()
        {
            var rs = ql.DUANs.ToList();
            var soLuong = ql.BOPHANs.Count();
            return Json(new
            {
                dataList = (from a in rs select new { a.idDuAn, a.TenDuAn }).ToList(),
                soLuong,
                status = true
            }, JsonRequestBehavior.AllowGet); ;
        }
        public JsonResult hienThiBoPhan()
        {
            var rs = ql.BOPHANs.ToList();
            return Json(new
            {
                dataList = (from a in rs select new { a.idBoPhan, a.TenBP }).ToList(),
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ThemNguoiDung(string HoDemND, string TenND, string TenDangNhap, string MatKhau)
        {
            try
            {
                var sp = new NGUOIDUNG();
                sp.HoDemND = HoDemND;
                sp.TenND = TenND;
                sp.TenDangNhap = TenDangNhap;
                sp.MatKhau = MatKhau;
                sp.TrangThai = true;
                sp.idNguoiDung = ql.NGUOIDUNGs.Max(s => s.idNguoiDung) + 1;
                ql.NGUOIDUNGs.Add(sp);
                ql.SaveChanges();
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
        public JsonResult TenDuAnThamGia(string HoDemND, string TenND, string TenDangNhap, string MatKhau)
        {
            try
            {
                var sp = new NGUOIDUNG();
                sp.HoDemND = HoDemND;
                sp.TenND = TenND;
                sp.TenDangNhap = TenDangNhap;
                sp.MatKhau = MatKhau;
                sp.TrangThai = true;
                sp.idNguoiDung = ql.NGUOIDUNGs.Max(s => s.idNguoiDung) + 1;
                ql.NGUOIDUNGs.Add(sp);
                ql.SaveChanges();
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
    }
}