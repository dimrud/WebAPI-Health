using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class ProcedureResult
    {
        public Guid Id { get; set; }
        public Guid ProcedureReportId { get; set; }
        public string ResultDataType { get; set; }
        public string ResultCode { get; set; }
        public string ResultText { get; set; }
        public DateTime? ResultDate { get; set; }
        public string Facility { get; set; }
        public int? Units { get; set; }
        public string Result { get; set; }
        public string Range { get; set; }
        public int? Abnormal { get; set; }
        public string Comments { get; set; }
        public Guid? DocumentId { get; set; }
        public int ResultStatus { get; set; }
    }
}
