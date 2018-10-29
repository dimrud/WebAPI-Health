using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAPIHealth.Entities
{
	public class User
	{
		public int Id { get; set; }
		public string FirstName { get; set; }
		public string MiddleName { get; set; }
		public string LastName { get; set; }
		public string Username { get; set; }
		public string Dob { get; set; }
		public DateTime Created { get; set; }
		public bool? IsTemporary { get; set; }
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
		public List<string> Roles { get; set; }
		//public byte[] PasswordHash { get; set; }
		//public byte[] PasswordSalt { get; set; }
		public string Token { get; set; }
	}
}
