using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using PersonnelMapping.ProcessCoordinates.Models;
using PersonnelMapping.ProcessCoordinates.Options;
using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace PersonnelMapping.ProcessCoordinates.Controllers
{
    [ApiController]
    [Route("[controller]/[action]")]
    public class ProcessAddressController : ControllerBase
    {
        private readonly string _mapsApiKey;
        private readonly ILogger<ProcessAddressController> _logger;
        private readonly HttpClient _client;
        private Address _address = new Address();

        public ProcessAddressController(ILogger<ProcessAddressController> logger,
            IOptions<MapsApiKeyOptions> options,
            IOptions<HttpClientOptions> clientOptions)
        {
            _logger = logger;
            _mapsApiKey = options.Value.Key;
            _client = new HttpClient { BaseAddress = new Uri(clientOptions.Value.BaseAddress) };
        }

        [HttpGet]
        public async Task<Coordinates> Get(string streetAddress, string stateCode)
        {
            await ProcessAddress(streetAddress, stateCode);
            return _address.Coordinates;
        }

        [HttpGet]
        public string GetMapApiKey()
        {
            return _mapsApiKey;
        }

        private async Task ProcessAddress(string address, string stateCode)
        {
            if (string.IsNullOrEmpty(stateCode))
            {
                _logger.LogInformation("No state code was provided.");
            }
            else
            {
                var convertedAddress = new Address { State = stateCode, Street = address };
                await UpdateAddressCoordinates(convertedAddress);
            }
        }

        private async Task UpdateAddressCoordinates(Address address)
        {
            _logger.LogInformation($"Loading coordinates for {address.FullAddress}");
            var result = await _client.GetAsync(GetUrl(address.FullAddress));

            if (!result.IsSuccessStatusCode)
            {
                _address.Coordinates = new Coordinates();
            }
            var response = await result.Content.ReadAsStringAsync();
            var coordinates = JsonConvert.DeserializeObject<RootObject>(response).Features[0].Geometry.Coordinates;
            address.Coordinates = new Coordinates { Longitude = coordinates[0], Latitude = coordinates[1] };

            _address = address;
        }

        private string GetUrl(string fullAddress)
        {
            var url = $"https://api.mapbox.com/geocoding/v5/mapbox.places/" +
                        $"{fullAddress}.json?access_token={_mapsApiKey}";
            return url;
        }

    }
}
