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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class TASK_THUCTAPEntities : DbContext
    {
        public TASK_THUCTAPEntities()
            : base("name=TASK_THUCTAPEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<BOPHAN> BOPHANs { get; set; }
        public virtual DbSet<CONGVIECTUAN> CONGVIECTUANs { get; set; }
        public virtual DbSet<DGNHANSUTHEOTHANG> DGNHANSUTHEOTHANGs { get; set; }
        public virtual DbSet<DGNHANSUTHEOTUAN> DGNHANSUTHEOTUANs { get; set; }
        public virtual DbSet<DUAN> DUANs { get; set; }
        public virtual DbSet<DUANTHAMGIA> DUANTHAMGIAs { get; set; }
        public virtual DbSet<MODULE> MODULEs { get; set; }
        public virtual DbSet<NGUOIDUNG> NGUOIDUNGs { get; set; }
        public virtual DbSet<THANGLAMVIEC> THANGLAMVIECs { get; set; }
        public virtual DbSet<TODOLIST> TODOLISTs { get; set; }
        public virtual DbSet<TUANLAMVIEC> TUANLAMVIECs { get; set; }
    }
}
