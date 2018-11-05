using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
//using WebAPIHealth.Entities;
using WebAPIHealth.Models.WebApiModels;

namespace WebAPIHealth.Factory
{
	public interface IUserService
	{
		//User Authenticate(string username, string password);
		Task<List<Models.WebApiModels.User>> GetAllUsersAsync();
		Task<bool> UpdateUserAsync(User user);
		Task<string> DeleteUserAsync(User user);
		//User GetById(int id);
		//User Create(User user, string password);
		//void Update(User user, string password = null);
		//void Delete(int id);
	}
}
