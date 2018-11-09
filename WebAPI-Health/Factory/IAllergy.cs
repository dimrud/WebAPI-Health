using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAPIHealth.Models.WebApiModels;

namespace WebAPIHealth.Factory
{
	public interface IAllergy
	{
		Task CreateAllergyAsync(string allergie);
		Task<List<Allergies>> GetAllAllergyAsync();
	}
}
