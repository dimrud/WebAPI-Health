using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebAPIHealth.Factory
{
	public interface IDataAccess
	{
		 bool CheckCredentials(string userName, string password);
	}
}
