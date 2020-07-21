using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace PersonnelMapping.ProcessCoordinates.BusinessLogic.Tests
{
    [TestClass()]
    public class ProcessAddressTests
    {
        [TestMethod()]
        public void UpdateAddressCoordinatesTest()
        {
            Assert.Fail();
        }

        [TestMethod()]
        public void FormatAddressTest()
        {
            string streetAddress = "1 Irving";
            string stateCode = "VA";

            var address = ProcessAddress.FormatAddress(streetAddress, stateCode);

            Assert.AreEqual(address.FullAddress, $"{streetAddress} {stateCode}");
        }

        [TestMethod()]
        public void IsEmptyStateCodeTest_WhenNoStateCode_ReturnsTrue()
        {
            var stateCode = "";
            var result = ProcessAddress.IsEmptyStateCode(stateCode);
            Assert.IsTrue(result);
        }

        [TestMethod()]
        public void IsEmptyStateCodeTest_WhenStateCodeNotEmpty_ReturnsFalse()
        {
            var stateCode = "VA";
            var result = ProcessAddress.IsEmptyStateCode(stateCode);
            Assert.IsFalse(result);
        }
    }
}