using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Swashbuckle.AspNetCore.Swagger;
using System.Text;
using WebAPIHealth.Data;
using WebAPIHealth.Factory;
using WebAPIHealth.Models.WebApiModels;
using AutoMapper;
using WebAPIHealth.Services;
using Microsoft.AspNetCore.Mvc;
using WebAPIHealth.Controllers;

namespace WebAPIHealth
{
	public class Startup
	{
		private readonly IConfiguration _configuration;
		//private IDataAccess _dataAccess;

		public Startup(IConfiguration configuration)
		{
			_configuration = configuration;
		}

		public IConfiguration Configuration => _configuration;
		//public IDataAccess DataAccess => _dataAccess;

		// This method gets called by the runtime. Use this method to add services to the container.
		public void ConfigureServices(IServiceCollection services)
		{
			services.AddCors();
			services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
			{
				options.TokenValidationParameters = new TokenValidationParameters
				{
					ValidateIssuer = true,
					ValidateAudience = true,
					ValidateIssuerSigningKey = true,
					ValidIssuer = "Health.com",
					ValidAudience = "Health.com",
					IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration.GetValue<string>("SecretKey:Key:KeyValue")))
				};
			});


			//services.TokenValidationParameters
			//services.AddTraceWebApiConfig(Configuration.GetTraceWebApiConfigSection());
			services.AddSwaggerGen(config =>
			{
				config.DocInclusionPredicate((docName, apiDesc) =>
				{
					if (apiDesc.HttpMethod == null) return false;
					return true;
				});
				config.SwaggerDoc("v1", new Info { Title = "Health App WebApi", Version = "v1" });
			});


			services.AddSingleton<IDataAccess, DataAccess>();
			//services.AddSingleton<IConfiguration, DataAccess>();


			services.AddDbContext<WebAPIContext>(options => options.UseSqlServer(Configuration.GetConnectionString("LocalSQLConnection")));
			//services.AddMvc(options =>
			//{
			//	options.Filters.Add(new AutoValidateAntiforgeryTokenAttribute());
			//});
			services.AddMvc();
			services.AddAutoMapper();

			// configure DI for application services
			//services.AddScoped<IAllergy, AllergiesController>();
			//services.AddScoped(typeof(IRepository<>), typeof(EfRepository<>));
			//services.AddScoped(typeof(IAsyncRepository<>), typeof(EfRepository<>));


			services.AddScoped<IAllergy, AllergieService>();
			services.AddScoped<IUserService, UserService>();
		}

		// This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
		public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
		{
			if (env.IsDevelopment())
			{
				app.UseDeveloperExceptionPage();
			}

			loggerFactory.AddConsole(Configuration.GetSection("Logging"));
			loggerFactory.AddDebug();

			app.UseCors(x => x
			   .AllowAnyOrigin()
			   .AllowAnyMethod()
			   .AllowAnyHeader()
			   .AllowCredentials());

			app.UseAuthentication();
			//SeedDatabase.Initialize(app.ApplicationServices.GetRequiredService<IServiceScopeFactory>().CreateScope().ServiceProvider);
			DataAccess.Initialize(app.ApplicationServices.GetRequiredService<IServiceScopeFactory>().CreateScope().ServiceProvider);
			app.UseMvc();

			app.UseSwagger();
			app.UseSwaggerUI(config =>
			{
				config.SwaggerEndpoint("/swagger/v1/swagger.json", "Health App WebApi");
			});
		}
	}
}
