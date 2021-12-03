using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThucTap_DuAnTeam_PhamThiVi.Models;

namespace ThucTap_DuAnTeam_PhamThiVi.Controllers
{
    public class TienDoCongViecController : Controller
    {
        TASK_THUCTAPEntities ql = new TASK_THUCTAPEntities();
        // GET: TienDoCongViec
        public ActionResult tienDoCongViec(int MaDuAn)
        {
            DUAN duAn = ql.DUANs.Single(s => s.idDuAn == MaDuAn);
            Session["DuAn"] = duAn.TenDuAn;
            Session["MaDuAn"] = duAn.idDuAn;
            if (Session["TaiKhoan"] != null)
            {
                Session["MaBP"] = getMABP((int)Session["MaTaiKhoan"]);
            }
            else
            {
                Session["MaBP"] = "null";
            }
            if (duAn == null)
            {
                return HttpNotFound();
            }
            return RedirectToAction("tuanLamViec", "TienDoCongViec");
        }
        public ActionResult tuanLamViec(string TimKiemThang)
        {
            int? maDAN = (int?)Session["MaDuAn"];
            ViewBag.maDAn = maDAN;
            if (!string.IsNullOrEmpty(TimKiemThang))
            {
                var duAn3 = ql.THANGLAMVIECs.Where(s => s.idDuAn == maDAN && s.TenThang.Contains(TimKiemThang)).ToList();
                return View(duAn3);
            }
            else
            {
                var duAn = ql.THANGLAMVIECs.Where(s => s.idDuAn == maDAN).ToList();
                return View(duAn);
            }    
        }
        public string getMABP(int MaND)
        {
                int? maDAN = (int?)Session["MaDuAn"];
                var rs = ql.DUANTHAMGIAs.FirstOrDefault(sp => sp.idDuAn == maDAN && sp.idNguoiDung == MaND).idBoPhan;
                return rs.ToString();
        }
        public JsonResult SuaTuanLamViec(int MaTuanLV, int MaThangLV, bool TrangThai)
        {
            try
            {
                var sp = ql.TUANLAMVIECs.Single(x => x.idThang == MaThangLV  && x.STTTuan == MaTuanLV);
                sp.TrangThai = TrangThai;
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