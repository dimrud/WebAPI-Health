using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebAPIHealth.Models.WebApiModels;

namespace WebAPIHealth.Data
{
    public class SeedDatabase
    {
        public static void Initialize(IServiceProvider serviceProvider)
        {
            try
            {
                var context = serviceProvider.GetRequiredService<WebAPIContext>();
                var userManager = serviceProvider.GetRequiredService<UserManager<ApplicationUser>>();
                context.Database.EnsureCreated();

                if (!context.AspNetUsers.Any())
                {
                    AspNetUsers user = new AspNetUsers()
                    {
                        Id = "1",
                        Email = "someemail@email.com",
                        SecurityStamp = Guid.NewGuid().ToString(),
                        UserName = "admin",
                        PasswordHash = "admin"
                        
                    };

                    //userManager.CreateAsync(user, "password");
                    context.AspNetUsers.Add(user);
                }
                
                //Table1 t1 = new Table1();
                //t1.Id = new Guid();
                //t1.Name = "test3";

                //context.Table1.Add(t1);
                context.SaveChanges();

            }
            catch (Exception ex)
            {
                string error = ex.Message;
            }
        }
    }
}
