using Newtonsoft.Json;
using PersonnelMapping.ProcessCoordinates.Models;

namespace PersonnelMapping.ProcessCoordinates.BusinessLogic
{
    public static class ProcessAddress
    {
        public const string NoStateCode = "Please provide a valid state code.";
        public static void UpdateAddressCoordinates(Address address, string response)
        {
            var coordinates = JsonConvert.DeserializeObject<RootObject>(response).Features[0].Geometry.Coordinates;
            address.Coordinates = new Coordinates { Longitude = coordinates[0], Latitude = coordinates[1] };
        }

        public static Address FormatAddress(string streetAddress, string stateCode)
        {
            return new Address { State = stateCode, Street = streetAddress };
        }

        public static bool IsEmptyStateCode(string stateCode)
        {
            if (string.IsNullOrEmpty(stateCode))
            {
                return true;
            }

            return false;
        }
    }
}
