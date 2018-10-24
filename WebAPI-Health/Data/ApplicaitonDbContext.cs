using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAPIHealth.Models.WebApiModels;

namespace WebAPIHealth.Data
{
    public class ApplicaitonDbContext : DbContext //IdentityDbContext<ApplicationUser> 
	{
        public ApplicaitonDbContext(DbContextOptions<WebApiModels> options) : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }
    }
}
