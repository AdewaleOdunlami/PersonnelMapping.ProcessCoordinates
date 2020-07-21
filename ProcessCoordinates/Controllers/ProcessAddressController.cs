using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using PersonnelMapping.ProcessCoordinates.BusinessLogic;
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
        public async Task<Coordinates> GetCoordinates(string streetAddress, string stateCode)
        {
            if (ProcessAddress.IsEmptyStateCode(stateCode))
            {
                _logger.LogInformation(ProcessAddress.NoStateCode);
                return new Coordinates();
            }

            Address address = ProcessAddress.FormatAddress(streetAddress, stateCode);

            _logger.LogInformation($"Loading coordinates for {address.FullAddress}");

            var responseMessage = await _client.GetAsync(GetUrl(address.FullAddress));

            if (!responseMessage.IsSuccessStatusCode)
            {
                _address.Coordinates = new Coordinates();
            }

            var response = await responseMessage.Content.ReadAsStringAsync();

            ProcessAddress.UpdateAddressCoordinates(address, response);

            _address = address;

            return _address.Coordinates;
        }



        [HttpGet]
        public string GetMapApiKey()
        {
            return _mapsApiKey;
        }

        private string GetUrl(string fullAddress)
        {
            var url = $"https://api.mapbox.com/geocoding/v5/mapbox.places/" +
                        $"{fullAddress}.json?access_token={_mapsApiKey}";
            return url;
        }

    }
}
