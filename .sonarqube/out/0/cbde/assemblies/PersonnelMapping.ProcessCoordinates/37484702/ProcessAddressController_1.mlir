// Skipping function Get(none, none), it contains poisonous unsupported syntaxes

func @_PersonnelMapping.ProcessCoordinates.Controllers.ProcessAddressController.GetMapApiKey$$() -> none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Controllers\\ProcessAddressController.cs" :37 :8) {
^entry :
br ^0

^0: // JumpBlock
%0 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Controllers\\ProcessAddressController.cs" :40 :19) // Not a variable of known type: _mapsApiKey
return %0 : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Controllers\\ProcessAddressController.cs" :40 :12)

^1: // ExitBlock
cbde.unreachable

}
// Skipping function ProcessAddress(none, none), it contains poisonous unsupported syntaxes

// Skipping function UpdateAddressCoordinates(none), it contains poisonous unsupported syntaxes

func @_PersonnelMapping.ProcessCoordinates.Controllers.ProcessAddressController.GetUrl$string$(none) -> none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Controllers\\ProcessAddressController.cs" :72 :8) {
^entry (%_fullAddress : none):
%0 = cbde.alloca none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Controllers\\ProcessAddressController.cs" :72 :30)
cbde.store %_fullAddress, %0 : memref<none> loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Controllers\\ProcessAddressController.cs" :72 :30)
br ^0

^0: // JumpBlock
%1 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Controllers\\ProcessAddressController.cs" :74 :22) // $"https://api.mapbox.com/geocoding/v5/mapbox.places/" (InterpolatedStringExpression)
%2 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Controllers\\ProcessAddressController.cs" :75 :27) // Not a variable of known type: fullAddress
%3 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Controllers\\ProcessAddressController.cs" :75 :59) // Not a variable of known type: _mapsApiKey
%4 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Controllers\\ProcessAddressController.cs" :75 :24) // $"{fullAddress}.json?access_token={_mapsApiKey}" (InterpolatedStringExpression)
%5 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Controllers\\ProcessAddressController.cs" :74 :22) // Binary expression on unsupported types $"https://api.mapbox.com/geocoding/v5/mapbox.places/" +                          $"{fullAddress}.json?access_token={_mapsApiKey}"
%7 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Controllers\\ProcessAddressController.cs" :76 :19) // Not a variable of known type: url
return %7 : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Controllers\\ProcessAddressController.cs" :76 :12)

^1: // ExitBlock
cbde.unreachable

}
