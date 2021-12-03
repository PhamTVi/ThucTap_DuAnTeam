using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThucTap_DuAnTeam_PhamThiVi.Models;

namespace ThucTap_DuAnTeam_PhamThiVi.Controllers
{
    public class ToDoListController : Controller
    {
        TASK_THUCTAPEntities ql = new TASK_THUCTAPEntities();
        // GET: ToDoList
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult hienThiALLToDoList()
        {
                int? maDAN = (int?)Session["MaDuAn"];
                var rs = ql.TODOLISTs.Where(sp => sp.idDuAn == maDAN).ToList();
                    return Json(new
                {
                    dataList = (from a in rs
                                select new
                                {
                                    a.NoiDung,
                                    NgayBDau = DateTime.Parse(a.NgayGiao.ToString()).ToString("dd-MM") ,
                                    NgayKThuc = DateTime.Parse(a.HanDen.ToString()).ToString("dd-MM"),
                                    a.GhiChu,
                                    a.TrangThai,
                                    TenND =  a.NGUOIDUNG.HoDemND + a.NGUOIDUNG.TenND,
                                    ThoiHan2 = DateTime.Parse(a.HanDen.ToString()) - DateTime.Now
                                }).ToList(),
                    status = true
                }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult timKiemToDoList(string noidung, int MaND)
        {
            int? maDAN = (int?)Session["MaDuAn"];
            var rs = ql.TODOLISTs.Where(sp => sp.idDuAn == maDAN && sp.NoiDung.Contains(noidung) && sp.idNguoiDung == MaND).ToList();
            return Json(new
            {
                dataList = (from a in rs
                            select new
                            {
                                a.NoiDung,
                                NgayBDau = DateTime.Parse(a.NgayGiao.ToString()).ToString("dd-MM"),
                                NgayKThuc = DateTime.Parse(a.HanDen.ToString()).ToString("dd-MM"),
                                a.GhiChu,
                                a.TrangThai,
                                TenND = a.NGUOIDUNG.HoDemND + a.NGUOIDUNG.TenND,
                                ThoiHan2 = DateTime.Parse(a.HanDen.ToString()) - DateTime.Now
                            }).ToList(),
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult hienThiNguoiDung()
        {
            int? maDAN = (int?)Session["MaDuAn"];
            var rs = ql.DUANTHAMGIAs.Where(s => s.idDuAn == maDAN);
            return Json(new
            {
                dataList = (from a in rs select new { HoDemND = a.NGUOIDUNG.HoDemND, TenND = a.NGUOIDUNG.TenND, idNguoiDung = a.NGUOIDUNG.idNguoiDung }).ToList(),
                status = true
            }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ThemToDoList(int MaND, string NoiDung, string NgayGiao, string HanDen, string ghiChu, Boolean TrangThai = false)
        {
            try
            {
                int maDAN = (int)Session["MaDuAn"];
                var sp = new TODOLIST();
                sp.idNguoiDung = MaND;
                sp.idDuAn = maDAN;
                sp.NoiDung = NoiDung;
                sp.NgayGiao = DateTime.Parse(NgayGiao);
                sp.HanDen = DateTime.Parse(HanDen);
                sp.GhiChu = ghiChu;
                sp.TrangThai = TrangThai;
                ql.TODOLISTs.Add(sp);
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