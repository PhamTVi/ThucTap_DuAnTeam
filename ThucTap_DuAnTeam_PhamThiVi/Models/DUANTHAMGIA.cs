//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ThucTap_DuAnTeam_PhamThiVi.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DUANTHAMGIA
    {
        public int idDuAnThamGia { get; set; }
        public Nullable<int> idDuAn { get; set; }
        public Nullable<int> idNguoiDung { get; set; }
        public Nullable<int> idBoPhan { get; set; }
        public Nullable<bool> TrangThai { get; set; }
    
        public virtual BOPHAN BOPHAN { get; set; }
        public virtual DUAN DUAN { get; set; }
        public virtual NGUOIDUNG NGUOIDUNG { get; set; }
    }
}
