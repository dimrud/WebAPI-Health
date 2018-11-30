using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class ProcedureTypes
    {
        public int Id { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }
    }
}
