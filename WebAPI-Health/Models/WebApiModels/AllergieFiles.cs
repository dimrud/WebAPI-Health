using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class AllergieFiles
    {
        public Guid Id { get; set; }
        public string FileName { get; set; }
        public int Length { get; set; }
        public string Mime { get; set; }
        public byte[] Content { get; set; }
        public string OwnedBy { get; set; }
        public DateTime CreatedOn { get; set; }
    }
}
