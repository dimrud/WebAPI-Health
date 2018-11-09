using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class ProcedureResultAbnormal
    {
        public int Id { get; set; }
        public string ResultAbnormal { get; set; }
        public string Description { get; set; }
    }
}
