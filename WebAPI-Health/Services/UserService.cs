using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Extensions.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Transactions;
using WebAPIHealth.Data;
//using WebAPIHealth.Entities;
using WebAPIHealth.Factory;
using WebAPIHealth.Helpers;
using WebAPIHealth.Models.WebApiModels;

namespace WebAPIHealth.Services
{
	public class UserService : IUserService
	{
		private WebAPIContext _context;

		public UserService(WebAPIContext context)
		{
			_context = context;
		}

		//public User Authenticate(string username, string password)
		//{
		//	if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
		//		return null;

		//	var user = _context.AspNetUsers.SingleOrDefault(x => x.UserName == username);

		//	// check if username exists
		//	if (user == null)
		//		return null;

		//	// check if password is correct
		//	//if (!VerifyPasswordHash(password, user.PasswordHash, user.PasswordSalt))
		//	//	return null;

		//	User userMapped = new User
		//	{
		//		Id = Convert.ToInt32(user.Id),
		//		FirstName = "MAMA"
		//	};
		//	// authentication successful
		//	return userMapped;
		//}

		public async Task<List<Models.WebApiModels.User>> GetAllUsersAsync()
		{

			return await _context.User.ToListAsync();
			//return _context.Users;
		}

		public async Task<bool> UpdateUserAsync(User user)
		{
			try
			{
				User exist = await _context.Set<User>().FindAsync(user.UserId);
				if (exist != null)
				{
					_context.Entry(exist).CurrentValues.SetValues(user);
					await _context.SaveChangesAsync();
					return true;
				}
				return false;
			}
			catch(Exception ex)
			{
				string exception = ex.Message;
				return false;
			}
			//_context.User = user;
			//try
			//{
			//	if (user == null)
			//		return false;
			//	T exist = _context.Set<T>().Find(key);
			//	if (exist != null)
			//	{
			//		_context.Entry(exist).CurrentValues.SetValues(t);
			//		_context.SaveChanges();
			//	}

			//	await _context.SaveChangesAsync();
			//	return true;
			//}
			//catch
			//{
			//	return false;
			//}

			//return _context.Users;
		}

		public async Task<string> DeleteUserAsync(User user)
		{
			try
			{
				using (var scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
				{
					User userToDelete = await _context.Set<User>().FindAsync(user.UserId);

					if (userToDelete != null)
					{
						//3 ways to ask EF for results 
						//1 
						//var local = _context.Set<User>()
						//	 .Local
						//	 .FirstOrDefault(f => f.UserId == user.UserId);
						//2
						//User newUser = _context.User.AsNoTracking().Where(t => t.UserId == user.UserId).FirstOrDefault();
						//3
						//User exist = await _context.Set<User>().FindAsync(user.UserId);

						AspNetUsers userCredentials = await _context.Set<AspNetUsers>().FindAsync(userToDelete.CredentialsId);

						_context.Entry(userToDelete).State = EntityState.Detached;
						_context.Entry(userCredentials).State = EntityState.Detached;

						_context.Set<User>().Remove(userToDelete);
						_context.Set<AspNetUsers>().Remove(userCredentials);

						await _context.SaveChangesAsync();
						scope.Complete();
						return "User was deleted";
					}
					return "Can't find user";
				}
			}
			catch (Exception ex)
			{
				string exception = ex.Message;
				return ex.Message;
			}
		}

		//public User GetById(int id)
		//{
		//	return null;
		//	//return _context.Users.Find(id);
		//}

		//public User Create(User user, string password)
		//{
		//	return null;
		//	//// validation
		//	//if (string.IsNullOrWhiteSpace(password))
		//	//	throw new AppException("Password is required");

		//	//if (_context.Users.Any(x => x.Username == user.Username))
		//	//	throw new AppException("Username \"" + user.Username + "\" is already taken");

		//	//byte[] passwordHash, passwordSalt;
		//	//CreatePasswordHash(password, out passwordHash, out passwordSalt);

		//	//user.PasswordHash = passwordHash;
		//	//user.PasswordSalt = passwordSalt;

		//	//_context.Users.Add(user);
		//	//_context.SaveChanges();

		//	//return user;
		//}

		//public void Update(User userParam, string password = null)
		//{

		//	//var user = _context.Users.Find(userParam.Id);

		//	//if (user == null)
		//	//	throw new AppException("User not found");

		//	//if (userParam.Username != user.Username)
		//	//{
		//	//	// username has changed so check if the new username is already taken
		//	//	if (_context.Users.Any(x => x.Username == userParam.Username))
		//	//		throw new AppException("Username " + userParam.Username + " is already taken");
		//	//}

		//	//// update user properties
		//	//user.FirstName = userParam.FirstName;
		//	//user.LastName = userParam.LastName;
		//	//user.Username = userParam.Username;

		//	//// update password if it was entered
		//	//if (!string.IsNullOrWhiteSpace(password))
		//	//{
		//	//	byte[] passwordHash, passwordSalt;
		//	//	CreatePasswordHash(password, out passwordHash, out passwordSalt);

		//	//	user.PasswordHash = passwordHash;
		//	//	user.PasswordSalt = passwordSalt;
		//	//}

		//	//_context.Users.Update(user);
		//	//_context.SaveChanges();
		//}

		//public void Delete(int id)
		//{

		//	//var user = _context.Users.Find(id);
		//	//if (user != null)
		//	//{
		//	//	_context.Users.Remove(user);
		//	//	_context.SaveChanges();
		//	//}
		//}

		// private helper methods

		//private static void CreatePasswordHash(string password, out byte[] passwordHash, out byte[] passwordSalt)
		//{
		//	if (password == null) throw new ArgumentNullException("password");
		//	if (string.IsNullOrWhiteSpace(password)) throw new ArgumentException("Value cannot be empty or whitespace only string.", "password");

		//	using (var hmac = new System.Security.Cryptography.HMACSHA512())
		//	{
		//		passwordSalt = hmac.Key;
		//		passwordHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
		//	}
		//}

		//private static bool VerifyPasswordHash(string password, byte[] storedHash, byte[] storedSalt)
		//{
		//	if (password == null) throw new ArgumentNullException("password");
		//	if (string.IsNullOrWhiteSpace(password)) throw new ArgumentException("Value cannot be empty or whitespace only string.", "password");
		//	if (storedHash.Length != 64) throw new ArgumentException("Invalid length of password hash (64 bytes expected).", "passwordHash");
		//	if (storedSalt.Length != 128) throw new ArgumentException("Invalid length of password salt (128 bytes expected).", "passwordHash");

		//	using (var hmac = new System.Security.Cryptography.HMACSHA512(storedSalt))
		//	{
		//		var computedHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
		//		for (int i = 0; i < computedHash.Length; i++)
		//		{
		//			if (computedHash[i] != storedHash[i]) return false;
		//		}
		//	}

		//	return true;
		//}
	}
}
