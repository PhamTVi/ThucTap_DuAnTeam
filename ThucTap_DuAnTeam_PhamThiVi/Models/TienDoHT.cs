using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ThucTap_DuAnTeam_PhamThiVi.Models
{
    public class TienDoHT
    {
        public int? idNhanVien { get; set; }
        public string TenNV { get; set; }
        public int? hoanThanh { get; set; }
        public TienDoHT(int? id, int? hoanThanh, string TenNV)
        {
            idNhanVien = id;
            this.TenNV = TenNV;
            this.hoanThanh = hoanThanh;
        }
    }
}