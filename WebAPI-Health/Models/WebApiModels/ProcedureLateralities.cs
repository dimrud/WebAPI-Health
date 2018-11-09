using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class ProcedureLateralities
    {
        public int Id { get; set; }
        public string Laterality { get; set; }
        public string Description { get; set; }
    }
}
