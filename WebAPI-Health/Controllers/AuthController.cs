﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using WebAPIHealth.Data;
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
			var header = Request.Headers["Authorization"];
			if (!string.IsNullOrWhiteSpace(header) && header.ToString().StartsWith("Basic"))
			{
				var credValue = header.ToString().Substring("Basic ".Length).Trim();
				var usernameAndPassIn = Encoding.UTF8.GetString(Convert.FromBase64String(credValue));
				var usernameAndPass = usernameAndPassIn.Split(':');

				//Check in DB - Call SP to check credentials
				if (_dataAccessClass.CheckCredentials(usernameAndPass[0], usernameAndPass[1]))
				{
					return BadRequest("Wrong user name and/or password");
				}

				if (usernameAndPass[0].Equals("Admin", StringComparison.InvariantCultureIgnoreCase) && usernameAndPass[1].Equals("Admin", StringComparison.InvariantCultureIgnoreCase))
				{
					var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration.GetValue<string>("SecretKey:Key:KeyValue")));
					var signInCredentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256Signature);

					//var claimsdata = new[] { new Claim(ClaimTypes.Name, usernameAndPass[0]) };
					var claims = new List<Claim>();
					claims.Add(new Claim(ClaimTypes.Role, "Doctor"));
					claims.Add(new Claim(ClaimTypes.Role, "SuperUser"));
					claims.Add(new Claim(ClaimTypes.Name, usernameAndPass[0]));

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
					string tokenString = string.Empty;

					try
					{
						tokenString = new JwtSecurityTokenHandler().WriteToken(token);
					}
					catch (Exception ex)
					{
						string str = ex.Message;
					}
					return Ok(tokenString);
				}
			}
			return BadRequest("Something wrong");
		}
	}
}