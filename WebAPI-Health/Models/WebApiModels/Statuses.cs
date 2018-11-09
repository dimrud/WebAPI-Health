using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class Statuses
    {
        public int Id { get; set; }
        public string Status { get; set; }
        public string Description { get; set; }
    }
}
