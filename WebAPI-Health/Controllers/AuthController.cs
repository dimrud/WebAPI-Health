﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using WebAPIHealth.Data;
using WebAPIHealth.Entities;
using WebAPIHealth.Factory;

namespace WebAPIHealth.Controllers
{

	[Produces("application/json")]
	[Route("api/Auth")]
	public class AuthController : Controller
	{
		private readonly IConfiguration _configuration;
		private readonly IDataAccess _dataAccessClass;

		public AuthController(IConfiguration configuration, IDataAccess dataAccess)
		{
			_configuration = configuration;
			_dataAccessClass = dataAccess;
		}

		[HttpPost("token")]
		public IActionResult Token()
		{
			//try
			//{
			//	//Connect to Azure Example
			//	string connStr = "Server=tcp:dimrud.database.windows.net,1433;Initial Catalog=TestDIMRUD-DB;Persist Security Info=False;User ID=dimrud;Password=Vm3r!010;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";
			//	using (SqlConnection connection = new SqlConnection(connStr))
			//	using (SqlCommand command = new SqlCommand("select * from saleslt.customer", connection))
			//	{
			//		connection.Open();
			//		using (SqlDataReader reader = command.ExecuteReader())
			//		{
			//			while (reader.Read())
			//			{
			//				Console.WriteLine(reader["Username"].ToString());
			//				Console.WriteLine(reader["Item"].ToString());
			//				Console.WriteLine(reader["Amount"].ToString());
			//				Console.WriteLine(reader["Complete"].ToString());
			//			}
			//		}
			//	}
			//}
			//catch (Exception ex)
			//{
			//	string exp = ex.Message;
			//}

			var header = Request.Headers["Authorization"];
			if (!string.IsNullOrWhiteSpace(header) && header.ToString().StartsWith("Basic"))
			{
				var credValue = header.ToString().Substring("Basic ".Length).Trim();
				var usernameAndPassIn = Encoding.UTF8.GetString(Convert.FromBase64String(credValue));
				var usernameAndPass = usernameAndPassIn.Split(':');

				//Check in DB - Call SP to check credentials
				string userId = _dataAccessClass.CheckCredentials(usernameAndPass[0], usernameAndPass[1]);
				if (string.IsNullOrEmpty(userId))
				{
					return BadRequest("Wrong user name and/or password");
				}

				var claims = new List<Claim>();
				User user = _dataAccessClass.GetUserById(userId);
				if (user == null) return BadRequest("Wrong credentials, can't find user");
				//Add user roles
				foreach (var role in user.Roles)
				{
					claims.Add(new Claim(ClaimTypes.Role, role.ToString()));
				}
				//Claim by username (email)
				claims.Add(new Claim(ClaimTypes.Name, usernameAndPass[0]));

				var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration.GetValue<string>("SecretKey:Key:KeyValue")));
				var signInCredentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256Signature);

				var userIdentity = new ClaimsIdentity("SuperSecureLogin");
				userIdentity.AddClaims(claims);
				var userPrincipal = new ClaimsPrincipal(userIdentity);

				var token = new JwtSecurityToken(
					issuer: "Health.com",
					audience: "Health.com",
					expires: DateTime.Now.AddDays(1),
					claims: claims,
					signingCredentials: signInCredentials
					);

				try
				{
					user.Token = new JwtSecurityTokenHandler().WriteToken(token);
				}
				catch (Exception ex)
				{
					string str = ex.Message;
				}

				return Ok(user);
			}
			return BadRequest("Something wrong");
		}
	}
}