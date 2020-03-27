using Microsoft.AspNetCore.Mvc;
using PersonnelMapping.ProcessCoordinates.Models;
using System.Net.Http;
using System.Threading.Tasks;

namespace PersonnelMapping.ProcessCoordinates.BusinessRules
{
    public class ProcessAddressController : ControllerBase
    {
        private readonly string _mapApiKey;
        private readonly HttpClient _client;

        public ProcessAddress(string mapApiKey, HttpClient client)
        {
            _mapApiKey = mapApiKey;
            _client = client;
        }
        public async Task<Address> ProcessAddressManually(string address, string stateCode)
        {
            var convertedAddress = new Address { State = stateCode, Street = address };

            await UpdateAddress(convertedAddress);

            return convertedAddress;
        }

        private async Task UpdateAddress(Address convertedAddress)
        {
            var coordinates = await new LoadCoordinates(_client, convertedAddress, _mapApiKey)
                                .GetCoordinatesFromAddress;

            convertedAddress.Coordinates.Latitude = coordinates.Latitude;
            convertedAddress.Coordinates.Longitude = coordinates.Longitude;
        }

        public async Task<Address> ProcessAddressFromSource(Address address)
        {
            if (address == null)
            {
                address = new Address();
            }

            if (address.Coordinates.Longitude == 0 || address.Coordinates.Latitude == 0)
            {
                await UpdateAddress(address);
            }

            return address;
        }

    }
}
