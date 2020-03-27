using System.ComponentModel.DataAnnotations;

namespace ProcessCoordinates.Models
{
    public class Address
    {
        public Address()
        {
            Country = "US";
            HouseNumber = "";
            Street = "";
            City = "";
            State = "";
            Zip = "";
            Coordinates = new Coordinates();
        }

        [Required]
        public string HouseNumber { get; set; }
        [Required]
        public string Street { get; set; }
        [Required]
        public string City { get; set; }
        [Required]
        [StringLength(2, MinimumLength = 2, ErrorMessage = "Maximum of 2 characters.")]
        public string State { get; set; }
        public string Country { get; set; }
        [Required]
        [StringLength(10, MinimumLength = 5)]
        public string Zip { get; set; }
        public string FullAddress
        {
            get
            {
                return $"{HouseNumber} {Street} {City} {State}";
            }
        }
        public Coordinates Coordinates { get; set; }
    }
}
