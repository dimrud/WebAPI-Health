using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class PatientAllergies
    {
        public Guid Id { get; set; }
        public int? Pid { get; set; }
        public int? Eid { get; set; }
        public string AllergyType { get; set; }
        public string Allergy { get; set; }
        public DateTime? BeginDate { get; set; }
        public DateTime? EndDate { get; set; }
        public string Reaction { get; set; }
        public string Severity { get; set; }
        public string Location { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? UpdateDate { get; set; }
        public long? CreatedUid { get; set; }
        public long? UpdatedUid { get; set; }
        public string AllergyCode { get; set; }
    }
}
