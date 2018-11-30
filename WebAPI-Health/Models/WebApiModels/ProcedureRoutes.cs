using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class ProcedureRoutes
    {
        public int Id { get; set; }
        public string Route { get; set; }
        public string Description { get; set; }
    }
}
