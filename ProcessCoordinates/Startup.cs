using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.OpenApi.Models;
using PersonnelMapping.ProcessCoordinates.Options;
using System;

namespace PersonnelMapping.ProcessCoordinates
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.Configure<MapsApiKeyOptions>(Configuration.GetSection("MapBoxApiKey"));
            services.Configure<HttpClientOptions>(Configuration.GetSection("HttpClientInfo"));
            services.Configure<UrlOptions>(Configuration.GetSection("CustomURLs"));
            services.AddControllers();

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo
                {
                    Version = "v1",
                    Title = "Process Coordinates",
                    Description = "This will return the coordinates for an address.",
                    Contact = new OpenApiContact
                    {
                        Name = "Aridfount",
                        Email = string.Empty,
                        Url = new Uri(Configuration.GetSection("CustomURLs:Company").Value)
                    },
                    License = new OpenApiLicense
                    {
                        Name = "Proprietary",
                        Url = new Uri(Configuration.GetSection("CustomURLs:License").Value)
                    }
                });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseSwagger();

            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Process Coordinates");
                c.RoutePrefix = string.Empty;
            });

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
