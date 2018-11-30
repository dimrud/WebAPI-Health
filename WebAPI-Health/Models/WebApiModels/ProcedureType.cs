using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class ProcedureType
    {
        public int Id { get; set; }
        public int? Parent { get; set; }
        public string Name { get; set; }
        public int? LabId { get; set; }
        public string ProcedureCode { get; set; }
        public int ProcedureType1 { get; set; }
        public string BodySite { get; set; }
        public int? Specimen { get; set; }
        public int? RouteAdmin { get; set; }
        public string Laterality { get; set; }
        public string Description { get; set; }
        public string StandardCode { get; set; }
        public string RelatedCode { get; set; }
        public int? Units { get; set; }
        public string Range { get; set; }
        public int? Seq { get; set; }
        public bool? Activity { get; set; }
        public string Notes { get; set; }
    }
}
