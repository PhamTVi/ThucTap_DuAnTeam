using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThucTap_DuAnTeam_PhamThiVi.Models;

namespace ThucTap_DuAnTeam_PhamThiVi.Controllers
{
    public class HomeController : Controller
    {
        TASK_THUCTAPEntities ql = new TASK_THUCTAPEntities();
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            var tenDN = f["TenDangNhap"];
            var matKhau = f["MatKhau"];
            if (String.IsNullOrEmpty(tenDN))
            {
                ViewData["Loi1"] = "Tên đăng nhập không bỏ trống";
            }
            if (String.IsNullOrEmpty(matKhau))
            {
                ViewData["Loi2"] = "Vui lòng nhập mật khẩu";
            }
            if (!String.IsNullOrEmpty(tenDN) && !String.IsNullOrEmpty(matKhau))
            {
                NGUOIDUNG kh = ql.NGUOIDUNGs.SingleOrDefault(n => n.TenDangNhap == tenDN && n.MatKhau == matKhau && n.TrangThai == true);
                if (kh != null)
                {
                    Session["TaiKhoan"] = kh;
                    Session["MaTaiKhoan"] = kh.idNguoiDung;
                    Session["tenTaiKhoan"] = kh.HoDemND + kh.TenND;
                    return RedirectToAction("ThamGiaDuAnTheoND", "DuAnThamGia");
                }
                else if (tenDN == "ADMIN" && matKhau == "123")
                {
                    Session["TaiKhoan"] = null;
                    Session["tenTaiKhoan"] = "QUẢN LÝ";
                    return RedirectToAction("ALLDuAn", "Home");
                }
                else
                {
                    return View();
                }
            }
            return View();
        }
        public ActionResult ALLDUAN()
        {
            return View(ql.DUANs.ToList());
        }
        public JsonResult hienThiThangLamViec(int id)
        {
                int? maDAN = (int?)Session["MaDuAn"];
                var rs = ql.THANGLAMVIECs.SingleOrDefault(sp => sp.GiaTri == id && sp.idDuAn == maDAN);
                if (rs != null)
                {
                    return Json(new
                    {
                        idThang = rs.idThang,
                        TenThang = rs.TenThang,
                        NamLamViec = rs.Nam,
                        NgayBDLam2 = DateTime.Parse(rs.NgayBDLam.ToString()).ToString("yyyy-MM-dd"),
                        NgayKTLam2 = DateTime.Parse(rs.NgayKTLam.ToString()).ToString("yyyy-MM-dd"),
                        status = true
                    }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new
                    {
                        idThang = "",
                        TenThang = "",
                        NamLamViec = "",
                        NgayBDLam2 = "",
                        NgayKTLam2 = "",
                        status = true
                    }, JsonRequestBehavior.AllowGet);
                }
        }
        public JsonResult LoadTuanCongViec(int id)
        {
                var rs = ql.TUANLAMVIECs.Where(sp => sp.idThang == id).ToList();
                return Json(new
                {
                    dataList = (from a in rs select new {
                        a.idTuan, a.TenTuan, a.STTTuan,
                        NgayBD = DateTime.Parse(a.NgayBD.ToString()).ToString("yyyy-MM-dd"),
                        NgayKT = DateTime.Parse(a.NgayKT.ToString()).ToString("yyyy-MM-dd"),
                        NgayBDau = DateTime.Parse(a.NgayBD.ToString()).ToString("dd-MM"),
                        NgayKThuc = DateTime.Parse(a.NgayKT.ToString()).ToString("dd-MM"), 
                        a.SoGioLamViec, a.TrangThai }).ToList(),
                    status = true
                }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ThemThangLamViec(int MaThangLV, string TenThang, int NamLamViec, string NgayBDLam, string NgayKTLam)
        {
            try
            {
                var sp = new THANGLAMVIEC();
                sp.GiaTri = MaThangLV;
                sp.TenThang = TenThang;
                sp.Nam = NamLamViec;
                sp.NgayBDLam = DateTime.Parse(NgayBDLam);
                sp.NgayKTLam = DateTime.Parse(NgayKTLam);
                sp.idDuAn = (int)Session["MaDuAn"];
                ql.THANGLAMVIECs.Add(sp);
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

        public JsonResult SuaThangLamViec(int MaThangLV, string TenThang, int NamLamViec, string NgayBDLam, string NgayKTLam)
        {
            try
            {
                int? maDAN = (int?)Session["MaDuAn"];   
                var sp = ql.THANGLAMVIECs.Single(x => x.GiaTri == MaThangLV && x.idDuAn == maDAN);
                sp.TenThang = TenThang;
                sp.Nam = NamLamViec;
                sp.NgayBDLam = DateTime.Parse(NgayBDLam);
                sp.NgayKTLam = DateTime.Parse(NgayKTLam);
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
        public JsonResult hienThiALLThangLamViec()
        {
                int? maDAN = (int?)Session["MaDuAn"];
                var rs = ql.THANGLAMVIECs.Where(sp => sp.idDuAn == maDAN).ToList();
                return Json(new
                {
                    dataList = (from a in rs select new { a.idThang, a.GiaTri, a.TenThang, NgayBDau = DateTime.Parse(a.NgayBDLam.ToString()).ToString("dd-MM"), NgayKThuc = DateTime.Parse(a.NgayKTLam.ToString()).ToString("dd-MM"), a.Nam }).ToList(),
                    status = true
                }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ThemTuanLamViec(int giaTri, string TenTuan, int STTTuan, string NgayBDau, string NgayKThuc, int SoGioLamViec)
        {
            try
            {
                int? maDAN = (int?)Session["MaDuAn"];
                var sp = new TUANLAMVIEC();
                int idThang = ql.THANGLAMVIECs.FirstOrDefault(s => s.GiaTri == giaTri && s.idDuAn == maDAN).idThang;
                sp.idThang = idThang;
                sp.TenTuan = TenTuan;
                sp.STTTuan = STTTuan;
                sp.NgayBD = DateTime.Parse(NgayBDau);
                sp.NgayKT = DateTime.Parse(NgayKThuc);
                sp.SoGioLamViec = SoGioLamViec;
                sp.TrangThai = true;
                ql.TUANLAMVIECs.Add(sp);
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