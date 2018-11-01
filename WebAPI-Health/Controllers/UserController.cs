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
	[Produces("application/json")]
	[Route("api/[controller]")]
    public class UserController : Controller
	{
		private readonly IUserService _userService;

		public UserController(IUserService userService)
		{
			_userService = userService;
		}

		[HttpGet("UsersGetAll")]
		public async Task<IActionResult> UsersGetAllAsync()
		{
			try
			{
				var result = await _userService.GetAllUsersAsync();
				return Ok(result);
			}
			catch (Exception ex)
			{
				return BadRequest(string.Format("Can't return list : {0}", ex.Message));
			}
		}

		[HttpPut("UpdateUser/{id}")]
		public async Task<IActionResult> UpdateUserAsync([FromBody] Models.WebApiModels.User user)
		{
			try
			{
				bool result = await _userService.UpdateUserAsync(user);
				return Ok(result);
			}
			catch (Exception ex)
			{
				return BadRequest(string.Format("Can't return list : {0}", ex.Message));
			}
		}

	}
}