using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAPIHealth.Entities
{
	public class Allergie
	{
		public Guid Id { get; set; }
		public int Pid { get; set; }
		public int Eid { get; set; }
	}
}
