//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataAccessP
{
    using System;
    using System.Collections.Generic;
    
    public partial class PerformanceMusicianInstrumentTbl
    {
        public int ID { get; set; }
        public Nullable<int> PerformanceID { get; set; }
        public Nullable<int> MusicianID { get; set; }
        public Nullable<int> InstrumentID { get; set; }
    
        public virtual InstrumentTbl InstrumentTbl { get; set; }
        public virtual PerformanceTbl PerformanceTbl { get; set; }
        public virtual MusicianTbl MusicianTbl { get; set; }
    }
}
