using System.Web;
using System.Web.Mvc;

namespace ThucTap_DuAnTeam_PhamThiVi
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
