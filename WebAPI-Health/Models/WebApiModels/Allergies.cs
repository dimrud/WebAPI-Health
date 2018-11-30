using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class Allergies
    {
        public int Id { get; set; }
        public string Summary { get; set; }
        public string AllergyName { get; set; }
        public string AllergyType { get; set; }
    }
}
