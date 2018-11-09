using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class UserToUserRelationTypes
    {
        public int Id { get; set; }
        public string RelationType { get; set; }
        public string RelationDescription { get; set; }
    }
}
