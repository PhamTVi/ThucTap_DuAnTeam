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
    
    public partial class DGNHANSUTHEOTUAN
    {
        public int idDanhGiaNSTuan { get; set; }
        public Nullable<int> idTuan { get; set; }
        public Nullable<int> idNguoiDung { get; set; }
        public Nullable<int> HoanThanh { get; set; }
        public string KhoiLuong { get; set; }
        public string TienDo { get; set; }
        public string ChatLuong { get; set; }
        public string LoiTrongTuan { get; set; }
        public string NhanXetTuan { get; set; }
    
        public virtual NGUOIDUNG NGUOIDUNG { get; set; }
        public virtual TUANLAMVIEC TUANLAMVIEC { get; set; }
    }
}