using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAPIHealth.Factory;
using WebAPIHealth.Models.WebApiModels;

namespace WebAPIHealth.Data
{
	public class DataAccess : IDataAccess
	{
		private static WebApiModels _context;
		private static IServiceProvider _serviceProvider;

		

		public static void Initialize(IServiceProvider serviceProvider)
		{
			_serviceProvider = serviceProvider;
			_context = serviceProvider.GetRequiredService<WebApiModels>();

		}
		public bool CheckCredentials(string userName, string password)
		{
			//var userManager = _serviceProvider.GetRequiredService<UserManager<ApplicationUser>>();
			if (_context.AspNetUsers.Any(c => c.UserName == userName && c.PasswordHash == password))
			{
				return true;
			}
			else
			{
				return false;
			}
			//var user = await UserManager.FindAsync(User.Identity.Name, VerifyViewModel.Password);
			//User user = userManager.GetUserAsync(. .Validate("Email", "admin@example.com", "admin");
			//return true;
		}
	}

}
