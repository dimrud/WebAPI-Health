using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class UserToUserRelation
    {
        public int UserA { get; set; }
        public int UserB { get; set; }
        public int RelationId { get; set; }
    }
}
