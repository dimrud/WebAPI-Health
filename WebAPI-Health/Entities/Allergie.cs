using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace WebAPIHealth.Entities
{
	public class Allergie
	{
		public Guid Id { get; set; }
		public int Pid { get; set; }
		public int Eid { get; set; }
		[StringLength(1000)]
		public string Note { get; set; }
	}
}
