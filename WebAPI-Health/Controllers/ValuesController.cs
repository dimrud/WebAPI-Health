using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace WebAPIHealth.Controllers
{
    [Authorize]
	//[Route("api/[controller]")]
	[Route("api/[controller]")]
	public class ValuesController : Controller
    {
		[Authorize(Roles = "Doctor,SuperUser")]
		[HttpGet("pingSuperUser")]
		public string PingSupervisor()
		{
			return "PongSuperUser";
		}

		[Authorize(Roles = "Admin")]
		[HttpGet("ping")]
		public string PingAdmin()
		{
			return "PongAdmin";
		}


		[HttpGet("claims")]
		public object Claims()
		{
			return User.Claims.Select(c =>
			new
			{
				Type = c.Type,
				Value = c.Value
			});
		}

		// GET api/values
		[HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
