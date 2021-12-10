using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThucTap_DuAnTeam_PhamThiVi.Models;
namespace ThucTap_DuAnTeam_PhamThiVi.Controllers
{
    public class TienDoCVTuanController : Controller
    {
        TASK_THUCTAPEntities ql = new TASK_THUCTAPEntities();
        // GET: TienDoCVTuan
        public ActionResult Index()
        {
            int? maDAN = (int?)Session["MaDuAn"];
            var toDoList = ql.TODOLISTs.Where(td => td.idDuAn == maDAN).ToList();
            if (toDoList.Count != 0)
            {
                ViewBag.slToDo = ql.TODOLISTs.Where(td => td.idDuAn == maDAN).Count();
                ViewData["todoList"] = ql.TODOLISTs.Where(td => td.idDuAn == maDAN).ToList();
            }
            else
            {
                ViewBag.slToDo = 0;
            }    
            return View();
        }
        public JsonResult LoadTuanCVDuAn(DateTime ngayHienTai)
        {
            int? maDAN = (int?)Session["MaDuAn"];
            List<CONGVIECTUAN> lst = (from cvt in ql.CONGVIECTUANs.Where( x=> x.NgayKT <= ngayHienTai)
                                      join tlv in ql.TUANLAMVIECs on cvt.idTuan equals tlv.idTuan
                                      join thanglv in ql.THANGLAMVIECs on tlv.idThang equals thanglv.idThang
                                      join da in ql.DUANs on thanglv.idDuAn equals da.idDuAn
                                      where da.idDuAn == maDAN
                                      select cvt).ToList();
            List<int?> lstNV = lst.Select(t => t.idNguoiDung).Distinct().ToList();
            List<TienDoHT> lstHT = new List<TienDoHT>();
            foreach (int? nv in lstNV)
            {
                int? tongGio = lst.Where(t => t.idNguoiDung == nv).Sum(r => r.ThoiGianLam);
                int? tongHT = lst.Where(t => t.idNguoiDung == nv && t.TrangThai == "Đã xong").Sum(r => r.ThoiGianLam);
                int? hoanThanh = tongHT * 100 / tongGio;
                string tenNV = ql.NGUOIDUNGs.FirstOrDefault(p => p.idNguoiDung == nv).HoDemND + ql.NGUOIDUNGs.FirstOrDefault(p => p.idNguoiDung == nv).TenND;
                lstHT.Add(new TienDoHT(nv, hoanThanh, tenNV));
            }
            return Json(new
                {
                    dataList = (from a in lstHT select new { name = a.TenNV ,value = a.hoanThanh}).ToList(),
                    status = true
                }, JsonRequestBehavior.AllowGet);
        }
    }
}