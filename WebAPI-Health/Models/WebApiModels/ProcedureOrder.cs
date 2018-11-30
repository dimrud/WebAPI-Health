using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class ProcedureOrder
    {
        public Guid Id { get; set; }
        public int ProviderId { get; set; }
        public int PatientId { get; set; }
        public Guid? EncounterId { get; set; }
        public DateTime DateCollected { get; set; }
        public DateTime DateOrdered { get; set; }
        public int? OrderPriority { get; set; }
        public int OrderStatus { get; set; }
        public string PatientInstructions { get; set; }
        public bool Activity { get; set; }
        public string ControlId { get; set; }
        public int LabId { get; set; }
        public int SpecimenType { get; set; }
        public string SpecimenLocation { get; set; }
        public string SpecimenVolume { get; set; }
        public DateTime? DateTransmitted { get; set; }
        public string ClinicalHx { get; set; }
        public int? ExternalId { get; set; }
        public bool HistoryOrder { get; set; }
    }
}
