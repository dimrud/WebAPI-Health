using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class Specimens
    {
        public int Id { get; set; }
        public string Specimen { get; set; }
        public string Description { get; set; }
    }
}
