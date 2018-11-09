using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class ProcedureReport
    {
        public Guid Id { get; set; }
        public Guid ProcedureOrderId { get; set; }
        public int ProcedureOrderSeq { get; set; }
        public DateTime? DateCollected { get; set; }
        public string DateCollectedTz { get; set; }
        public DateTime? DateReport { get; set; }
        public string DateReportTz { get; set; }
        public int Source { get; set; }
        public int? Specimen { get; set; }
        public int? ReportStatus { get; set; }
        public int? ReviewStatus { get; set; }
        public string ReportNotes { get; set; }
    }
}
