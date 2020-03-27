
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using PersonnelMapping.ProcessCoordinates.Models;
using PersonnelMapping.ProcessCoordinates.Options;
using System.Net.Http;
using System.Threading.Tasks;

namespace PersonnelMapping.ProcessCoordinates.Controllers
{
    public class LoadCoordinatesController : ControllerBase
    {
        private readonly string _mapsApiKey;
        private readonly HttpClient _client;
        private readonly ILogger<LoadCoordinatesController> _logger;
        private readonly IOptions<HttpClientOptions> _clientOptions;

        public LoadCoordinatesController(ILogger<LoadCoordinatesController> logger, IOptions<MapsApiKeyOptions> options, IOptions<HttpClientOptions> clientOptions)
        {
            _logger = logger;
            _clientOptions = clientOptions;
            _mapsApiKey = options.Value.Key;
            //_client = new HttpClient
        }

        public string GetMapApiKey()
        {
            return _mapsApiKey;
        }

        private async Task<Coordinates> FromAddress(Address address)
        {
            var result = await _client.GetAsync(GetUrl(address.FullAddress));

            if (!result.IsSuccessStatusCode)
            {
                return new Coordinates();
            }
            var response = await result.Content.ReadAsStringAsync();
            var coordinates = JsonConvert.DeserializeObject<RootObject>(response).Features[0].Geometry.Coordinates;
            return new Coordinates { Longitude = coordinates[0], Latitude = coordinates[1] };
        }

        private string GetUrl(string fullAddress)
        {
            var url = $"https://api.mapbox.com/geocoding/v5/mapbox.places/" +
                        $"{fullAddress}.json?access_token={_mapsApiKey}";
            return url;
        }
    }
}
