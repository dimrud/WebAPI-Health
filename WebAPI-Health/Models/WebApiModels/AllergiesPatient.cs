using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class AllergiesPatient
    {
        public Guid Id { get; set; }
        public int? Pid { get; set; }
        public int? Eid { get; set; }
        public int? AllergyCode { get; set; }
        public DateTime? BeginDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string Reaction { get; set; }
        public string Severity { get; set; }
        public string Location { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? UpdateDate { get; set; }
    }
}
