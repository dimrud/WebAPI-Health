using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class Priorities
    {
        public int Id { get; set; }
        public string Priority { get; set; }
        public string Description { get; set; }
    }
}
