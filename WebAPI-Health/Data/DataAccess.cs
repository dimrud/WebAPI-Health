using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAPIHealth.Factory;
using WebAPIHealth.Models.WebApiModels;
using WebAPIHealth.Entities;

namespace WebAPIHealth.Data
{
	public class DataAccess : IDataAccess
	{
		private static WebAPIContext _context;
		private static IServiceProvider _serviceProvider;



		public static void Initialize(IServiceProvider serviceProvider)
		{
			_serviceProvider = serviceProvider;
			_context = serviceProvider.GetRequiredService<WebAPIContext>();


		}
		public string CheckCredentials(string userName, string password)
		{
			//var userManager = _serviceProvider.GetRequiredService<UserManager<ApplicationUser>>();
			if (_context.AspNetUsers.Any(c => c.Email == userName && c.PasswordHash == password))
			{
				AspNetUsers user = _context.AspNetUsers.FirstOrDefault(c => c.Email == userName && c.PasswordHash == password);
				return user.Id;
			}
			else
			{
				return "";
			}
			//var user = await UserManager.FindAsync(User.Identity.Name, VerifyViewModel.Password);
			//User user = userManager.GetUserAsync(. .Validate("Email", "admin@example.com", "admin");
			//return true;
		}
		public Entities.User GetUserById(string userId)
		{
			Entities.User user = new Entities.User();

			var userInfo = (from p in _context.AspNetUserRoles
							join e in _context.AspNetRoles on p.RoleId equals e.Id
							join u in _context.User on p.UserId equals u.CredentialsId
							where p.UserId == userId
							select new
							{
								u.UserId,
								RoleName = e.Name,
								u.FirstName,
								u.MiddleName,
								u.LastName,
								u.Dob,
								u.Created,
								u.IsTemporary,
								u.Street,
								u.Street2,
								u.City,
								u.State,
								u.Zip,
								u.Email,
								u.Phone,
								u.PhoneType,
								u.Phone2,
								u.Phone3,
								u.Gender

							}).ToList();

			if (userInfo != null)
			{
				user.Roles = new List<string>();

				foreach (var p in userInfo)
				{
					user.Roles.Add(p.RoleName);
				}

				user.Id = userInfo[0].UserId;
				user.FirstName = userInfo[0].FirstName;
				user.MiddleName = userInfo[0].MiddleName;
				user.LastName = userInfo[0].LastName;
				user.Dob = userInfo[0].Dob;
				user.Created = userInfo[0].Created;
				user.IsTemporary = userInfo[0].IsTemporary;
				user.Street = userInfo[0].Street;
				user.Street2 = userInfo[0].Street2;
				user.City = userInfo[0].City;
				user.State = userInfo[0].State;
				user.Zip = userInfo[0].Zip;
				user.Email = userInfo[0].Email;
				user.Phone = userInfo[0].Phone;
				user.PhoneType = userInfo[0].PhoneType;
				user.Phone2 = userInfo[0].Phone2;
				user.Phone3 = userInfo[0].Phone3;
				user.Gender = userInfo[0].Gender;
				return user;
			}
			return null;
		}
	}
}
