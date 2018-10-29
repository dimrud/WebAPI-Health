using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Threading;
using WebAPIHealth.Models.WebApiModels;

namespace WebAPIHealth.Controllers
{
    [AllowAnonymous]
    [Route("api/HC")]
    public class HealthCheckController : Controller
    {
        private readonly WebAPIContext _context;

        public HealthCheckController(WebAPIContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var websiteAssembly = typeof(HealthCheckController).AssemblyQualifiedName;
            var eventData = new
            {
                Assembly = websiteAssembly,
                Url = Request.HttpContext.Request.Path,
                Server = Environment.MachineName,
                Environment = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT"),
                Time = DateTime.Now.ToString("u")
            };

            return Ok(eventData);
        }

        [HttpPost]
        public IActionResult CheckDBConnection()
        {
            try
            {
                //CancellationToken token = new CancellationToken();
                //var count = _context.Table1.CountAsync(token);
                //if (count.Result > 0)
                //{
                //    return Ok("Message : Count = " + count.Result);
                //}

                DbSet<Table1> table1 = _context.Table1;
                var author = _context.Table1.Find(Guid.Parse("6954E597-C908-4139-A95D-22FB87D278B3"));
                Dictionary<Guid,string> values = new Dictionary<Guid, string>();
                foreach (var row in table1) // query executed and data obtained from database
                {
                    values.Add(row.Id,row.Name);
                }

                //if ((DbContext)_context).Table_1.Any())
                //{
                //    return;   // DB has been seeded
                //}

                int lines = ((DbContext)_context).Database.ExecuteSqlCommand("SELECT 1");
                return Ok("Message : Could connect and select from DB");
            }
            catch (Exception ex)
            {
                return BadRequest("Message : " + ex.Message);
            }
        }
    }
}