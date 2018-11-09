using System;
using System.Collections.Generic;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class User
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Dob { get; set; }
        public DateTime Created { get; set; }
        public bool IsTemporary { get; set; }
        public string Street { get; set; }
        public string Street2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string PhoneType { get; set; }
        public string Phone2 { get; set; }
        public string Phone3 { get; set; }
        public string Gender { get; set; }
        public DateTime? InactivatedOn { get; set; }
        public string Notes { get; set; }
        public DateTime LastModified { get; set; }
        public string CredentialsId { get; set; }

        public virtual AspNetUsers Credentials { get; set; }
    }
}
