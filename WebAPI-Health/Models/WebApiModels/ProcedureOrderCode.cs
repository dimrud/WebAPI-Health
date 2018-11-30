using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class ProcedureOrderCode
    {
        public Guid ProcedureOrderId { get; set; }
        public int ProcedureOrderSeq { get; set; }
        public int ProcedureCode { get; set; }
        public string ProcedureSource { get; set; }
        public string Diagnoses { get; set; }
        public bool? DoNotSend { get; set; }
        public string ProcedureOrderTitle { get; set; }
    }
}
