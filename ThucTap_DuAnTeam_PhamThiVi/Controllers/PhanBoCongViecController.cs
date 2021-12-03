using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DayPilot.Web.Mvc;
using DayPilot.Web.Mvc.Data;
using DayPilot.Web.Mvc.Enums;
using DayPilot.Web.Mvc.Enums.Gantt;
using DayPilot.Web.Mvc.Events.Gantt;
using ThucTap_DuAnTeam_PhamThiVi.Models;

namespace ThucTap_DuAnTeam_PhamThiVi.Controllers
{
    public class PhanBoCongViecController : Controller
    {
        // GET: PhanBoCongViec
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Backend()
        {
            Gantt y = new Gantt();
            y.maduan = (int)Session["MaDuAn"];
            return y.CallBack(this);
        }

        class Gantt : DayPilotGantt
        {
            public int maduan { get; set; }
            TASK_THUCTAPEntities db = new TASK_THUCTAPEntities();
            protected override void OnInit(InitArgs e)
            {
                try
                {
                    List<CONGVIECTUAN> lst = (from cvt in db.CONGVIECTUANs
                                              join tlv in db.TUANLAMVIECs on cvt.idTuan equals tlv.idTuan
                                              join thanglv in db.THANGLAMVIECs on tlv.idThang equals thanglv.idThang
                                              join da in db.DUANs on thanglv.idDuAn equals da.idDuAn
                                              where da.idDuAn == maduan
                                              select cvt).ToList();
                    //DateTime ngayBD = new DateTime();
                    //ngayBD = DateTime.Parse(lst[0].NgayBD.ToString());
                    //foreach(CONGVIECTUAN cvt in lst)
                    //{
                    //    if (DateTime.Compare(ngayBD, DateTime.Parse(cvt.NgayBD.ToString())) > 0)
                    //    {
                    //        ngayBD = DateTime.Parse(cvt.NgayBD.ToString());
                    //    }
                    //}
                    //StartDate = new DateTime(ngayBD.Year, ngayBD.Month, ngayBD.Day);
                    List<CONGVIECTUAN> temp = lst.OrderBy(t => t.NgayBD).ToList();
                    DateTime ngayBD = DateTime.Parse(temp[0].NgayBD.ToString());
                    temp = lst.OrderByDescending(t => t.NgayKT).ToList();
                    DateTime ngayKT = DateTime.Parse(temp[0].NgayKT.ToString());
                    StartDate = ngayBD;
                    Days = (ngayKT - ngayBD).Days + 1;
                    LoadTasks(lst);
                    UpdateWithMessage("Welcome!");
                }
                catch
                {

                }


            }
            private void LoadTasks(List<CONGVIECTUAN> lst)
            {
                //Task group = Tasks.AddGroup("Vi", "1");
                //group.Children.Add(new Task("Xin nghĩ 1 Buổi", "2", DateTime.Today, DateTime.Today.AddDays(2)));
                //group.Children.Add(new Task("Họp công việc tuần của team", "3", DateTime.Today, DateTime.Today.AddDays(2)));
                //group.Children.AddMilestone("Milestone 1", "4", DateTime.Today);
                List<int?> lstNV = lst.Select(t => t.idNguoiDung).Distinct().ToList();
                int dem = 1;
                int con = 1;
                foreach (int? nv in lstNV)
                {
                    Task group = Tasks.AddGroup(db.NGUOIDUNGs.Where(t => t.idNguoiDung == nv).Select(t => t.TenND).FirstOrDefault().ToString(), "id" + dem);
                    dem++;
                    foreach (CONGVIECTUAN cvt in lst.Where(t => t.idNguoiDung == nv))
                    {
                        group.Children.Add(new Task(cvt.TenCongViec, "task" + con, DateTime.Parse(cvt.NgayBD.ToString()), DateTime.Parse(cvt.NgayKT.ToString())));
                        con++;
                    }
                }
            }
        }
    }
}