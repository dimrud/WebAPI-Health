using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class OrderTypes
    {
        public int Id { get; set; }
        public string OrderType { get; set; }
        public string Description { get; set; }
    }
}
