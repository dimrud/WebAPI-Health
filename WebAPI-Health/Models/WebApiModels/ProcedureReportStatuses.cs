using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class ProcedureReportStatuses
    {
        public int Id { get; set; }
        public string ReportStatus { get; set; }
        public string Description { get; set; }
    }
}
