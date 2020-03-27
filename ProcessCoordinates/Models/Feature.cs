using System;
using System.Collections.Generic;

namespace PersonnelMapping.ProcessCoordinates.Models
{
    public class Feature
    {
        public string Id { get; set; }
        public string Type { get; set; }
        public List<string> Place_Type { get; set; }
        public double Relevance { get; set; }
        public Properties Properties { get; set; }
        public string Text { get; set; }
        public string Place_Name { get; set; }
        public List<double> Center { get; set; }
        public Geometry Geometry { get; set; }
        public string Address { get; set; }
        public List<Context> Context { get; set; }
        public List<double?> Bbox { get; set; }
    }
}
