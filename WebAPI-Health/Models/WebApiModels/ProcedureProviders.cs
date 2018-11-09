using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class ProcedureProviders
    {
        public int Ppid { get; set; }
        public string FullName { get; set; }
        public string Npi { get; set; }
        public string SendAppId { get; set; }
        public string SendFacId { get; set; }
        public string RecvAppId { get; set; }
        public string RecvFacId { get; set; }
        public string Direction { get; set; }
        public string Protocol { get; set; }
        public string RemoteHost { get; set; }
        public string OrdersPath { get; set; }
        public string ResultsPath { get; set; }
        public string Notes { get; set; }
    }
}
