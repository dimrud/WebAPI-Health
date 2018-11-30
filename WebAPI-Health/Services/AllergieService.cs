using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAPIHealth.Entities;
using WebAPIHealth.Factory;
using WebAPIHealth.Models.WebApiModels;

namespace WebAPIHealth.Services
{
	public class AllergieService : IAllergy
	{
		private WebAPIContext _context;

		public AllergieService(WebAPIContext context)
		{
			_context = context;
		}

		public Task CreateAllergyAsync(string allergie)
		{
			return null;
		}

		public async Task<List<Allergies>>  GetAllAllergyAsync()
		{
			//var result = await (from e in _context.PatientAllergies
			//					select e).ToListAsync();

			var allergies = await _context.Allergies.ToListAsync();
			return allergies;
		}
	}
}
