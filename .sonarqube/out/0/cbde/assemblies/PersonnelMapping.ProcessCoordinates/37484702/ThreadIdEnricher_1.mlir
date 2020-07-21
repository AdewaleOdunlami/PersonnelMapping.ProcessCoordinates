func @_PersonnelMapping.ProcessCoordinates.Infrastructure.ThreadIdEnricher.Enrich$Serilog.Events.LogEvent.Serilog.Core.ILogEventPropertyFactory$(none, none) -> () loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Infrastructure\\ThreadIdEnricher.cs" :8 :8) {
^entry (%_logEvent : none, %_propertyFactory : none):
%0 = cbde.alloca none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Infrastructure\\ThreadIdEnricher.cs" :8 :27)
cbde.store %_logEvent, %0 : memref<none> loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Infrastructure\\ThreadIdEnricher.cs" :8 :27)
%1 = cbde.alloca none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Infrastructure\\ThreadIdEnricher.cs" :8 :46)
cbde.store %_propertyFactory, %1 : memref<none> loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Infrastructure\\ThreadIdEnricher.cs" :8 :46)
br ^0

^0: // SimpleBlock
%2 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Infrastructure\\ThreadIdEnricher.cs" :10 :12) // Not a variable of known type: logEvent
%3 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Infrastructure\\ThreadIdEnricher.cs" :10 :41) // Not a variable of known type: propertyFactory
%4 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Infrastructure\\ThreadIdEnricher.cs" :11 :20) // "ThreadId" (StringLiteralExpression)
// Entity from another assembly: Thread
%5 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Infrastructure\\ThreadIdEnricher.cs" :11 :32) // Thread.CurrentThread (SimpleMemberAccessExpression)
%6 = cbde.unknown : i32 loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Infrastructure\\ThreadIdEnricher.cs" :11 :32) // Thread.CurrentThread.ManagedThreadId (SimpleMemberAccessExpression)
%7 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Infrastructure\\ThreadIdEnricher.cs" :10 :41) // propertyFactory.CreateProperty(                      "ThreadId", Thread.CurrentThread.ManagedThreadId) (InvocationExpression)
%8 = cbde.unknown : none loc("C:\\repos\\PersonnelMapping.ProcessCoordinates\\ProcessCoordinates\\Infrastructure\\ThreadIdEnricher.cs" :10 :12) // logEvent.AddPropertyIfAbsent(propertyFactory.CreateProperty(                      "ThreadId", Thread.CurrentThread.ManagedThreadId)) (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
