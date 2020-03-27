using System;
namespace PersonnelMapping.ProcessCoordinates.Models
{
    public class Coordinates
    {
        public Coordinates()
        {
            Longitude = 0;
            Latitude = 0;
        }

        public double Longitude { get; set; }
        public double Latitude { get; set; }
    }  
}
