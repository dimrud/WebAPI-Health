using System.Collections.Generic;
using WebAPIHealth.Entities;

namespace WebAPIHealth.Factory
{
	public interface IDataAccess
	{
		string CheckCredentials(string userName, string password);
		User GetUserById(string userId);
	}
}
