func @_PersonnelMapping.ProcessCoordinates.BusinessLogic.ProcessAddress.UpdateAddressCoordinates$PersonnelMapping.ProcessCoordinates.Models.Address.string$(none, none) -> () loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :8 :8) {
^entry (%_address : none, %_response : none):
%0 = cbde.alloca none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :8 :52)
cbde.store %_address, %0 : memref<none> loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :8 :52)
%1 = cbde.alloca none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :8 :69)
cbde.store %_response, %1 : memref<none> loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :8 :69)
br ^0

^0: // SimpleBlock
// Entity from another assembly: JsonConvert
%2 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :10 :72) // Not a variable of known type: response
%3 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :10 :30) // JsonConvert.DeserializeObject<RootObject>(response) (InvocationExpression)
%4 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :10 :30) // JsonConvert.DeserializeObject<RootObject>(response).Features (SimpleMemberAccessExpression)
%5 = constant 0 : i32 loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :10 :91)
%6 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :10 :30) // JsonConvert.DeserializeObject<RootObject>(response).Features[0] (ElementAccessExpression)
%7 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :10 :30) // JsonConvert.DeserializeObject<RootObject>(response).Features[0].Geometry (SimpleMemberAccessExpression)
%8 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :10 :30) // JsonConvert.DeserializeObject<RootObject>(response).Features[0].Geometry.Coordinates (SimpleMemberAccessExpression)
%10 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :11 :12) // Not a variable of known type: address
%11 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :11 :12) // address.Coordinates (SimpleMemberAccessExpression)
%12 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :11 :34) // new Coordinates { Longitude = coordinates[0], Latitude = coordinates[1] } (ObjectCreationExpression)
%13 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :11 :64) // Not a variable of known type: coordinates
%14 = constant 0 : i32 loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :11 :76)
%15 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :11 :64) // coordinates[0] (ElementAccessExpression)
%16 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :11 :91) // Not a variable of known type: coordinates
%17 = constant 1 : i32 loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :11 :103)
%18 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :11 :91) // coordinates[1] (ElementAccessExpression)
br ^1

^1: // ExitBlock
return

}
func @_PersonnelMapping.ProcessCoordinates.BusinessLogic.ProcessAddress.FormatAddress$string.string$(none, none) -> none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :14 :8) {
^entry (%_streetAddress : none, %_stateCode : none):
%0 = cbde.alloca none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :14 :44)
cbde.store %_streetAddress, %0 : memref<none> loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :14 :44)
%1 = cbde.alloca none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :14 :66)
cbde.store %_stateCode, %1 : memref<none> loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :14 :66)
br ^0

^0: // JumpBlock
%2 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :16 :19) // new Address { State = stateCode, Street = streetAddress } (ObjectCreationExpression)
%3 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :16 :41) // Not a variable of known type: stateCode
%4 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :16 :61) // Not a variable of known type: streetAddress
return %2 : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :16 :12)

^1: // ExitBlock
cbde.unreachable

}
func @_PersonnelMapping.ProcessCoordinates.BusinessLogic.ProcessAddress.IsEmptyStateCode$string$(none) -> i1 loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :19 :8) {
^entry (%_stateCode : none):
%0 = cbde.alloca none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :19 :44)
cbde.store %_stateCode, %0 : memref<none> loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :19 :44)
br ^0

^0: // BinaryBranchBlock
%1 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :21 :16) // string (PredefinedType)
%2 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :21 :37) // Not a variable of known type: stateCode
%3 = cbde.unknown : i1 loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :21 :16) // string.IsNullOrEmpty(stateCode) (InvocationExpression)
cond_br %3, ^1, ^2 loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :21 :16)

^1: // JumpBlock
%4 = constant 1 : i1 loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :23 :23) // true
return %4 : i1 loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :23 :16)

^2: // JumpBlock
%5 = constant 0 : i1 loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :26 :19) // false
return %5 : i1 loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\BusinessLogic\\ProcessAddress.cs" :26 :12)

^3: // ExitBlock
cbde.unreachable

}
