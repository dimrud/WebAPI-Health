using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Threading.Tasks;
using WebAPIHealth.Entities;
using WebAPIHealth.Factory;
using WebAPIHealth.Services;

namespace WebAPIHealth.Controllers
{
	[Authorize]
	//[Route("api/[controller]")]
	[Route("api/[controller]")]
	public class AllergiesController : Controller
	{
		private readonly IAllergy _allergieService;

		public AllergiesController(IAllergy allergieService)
		{
			_allergieService = allergieService;
		}

		[HttpGet("AllergiesGetAll")]
		public async Task<IActionResult> AllergiesGetAllAsync()
		{
			try
			{
				var result = await _allergieService.GetAllAllergyAsync();
				return Ok(result);
			}
			catch (Exception ex)
			{
				return BadRequest(string.Format("Can't return list : {0}", ex.Message));
			}
		}
	}
}
