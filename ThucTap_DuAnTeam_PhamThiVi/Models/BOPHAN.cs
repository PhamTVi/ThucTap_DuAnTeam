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
    
    public partial class BOPHAN
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BOPHAN()
        {
            this.DUANTHAMGIAs = new HashSet<DUANTHAMGIA>();
        }
    
        public int idBoPhan { get; set; }
        public string TenBP { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DUANTHAMGIA> DUANTHAMGIAs { get; set; }
    }
}
