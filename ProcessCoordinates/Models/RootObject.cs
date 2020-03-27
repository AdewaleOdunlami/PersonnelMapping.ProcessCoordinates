using System;
using System.Collections.Generic;

namespace PersonnelMapping.ProcessCoordinates.Models
{
    public class RootObject
    {
        public string Type { get; set; }
        public List<string> Query { get; set; }
        public List<Feature> Features { get; set; }
        public string Attribution { get; set; }
    }
}

/*
 * http://json2csharp.com/#
 */
