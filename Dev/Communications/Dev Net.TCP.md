# Net.TCP

## Links
- [Net.TCP Port Sharing Sample](https://learn.microsoft.com/en-us/dotnet/framework/wcf/samples/net-tcp-port-sharing-sample)
- [Test-NetConnection](https://learn.microsoft.com/en-us/powershell/module/nettcpip/test-netconnection)

## PowerShell
```
Test-NetConnection
    [[-ComputerName] <String>]
    [-TraceRoute]
    [-Hops <Int32>]
    [-InformationLevel <String>]
    [<CommonParameters>]
Test-NetConnection -ComputerName "localhost" -Port "9000"
```

## C# Client
```
class client
{
   static void Main(string[] args)
   {
      Console.Write("Enter the service number to test: ");
      ushort salt = ushort.Parse(Console.ReadLine());
      string address = $"net.tcp://localhost:9000/calculator/{salt}";
      ChannelFactory<ICalculator> factory = new ChannelFactory<ICalculator>(new NetTcpBinding());
      ICalculator proxy = factory.CreateChannel(new EndpointAddress(address));

      // Call the Add service operation.
      double value1 = 100.00D;
      double value2 = 15.99D;
      double result = proxy.Add(value1, value2);
      Console.WriteLine("Add({0},{1}) = {2}", value1, value2, result);

      // Call the Subtract service operation.
      value1 = 145.00D;
      value2 = 76.54D;
      result = proxy.Subtract(value1, value2);
      Console.WriteLine("Subtract({0},{1}) = {2}", value1, value2, result);

      // Call the Multiply service operation.
      value1 = 9.00D;
      value2 = 81.25D;
      result = proxy.Multiply(value1, value2);
      Console.WriteLine("Multiply({0},{1}) = {2}", value1, value2, result);

      // Call the Divide service operation.
      value1 = 22.00D;
      value2 = 7.00D;
      result = proxy.Divide(value1, value2);
      Console.WriteLine("Divide({0},{1}) = {2}", value1, value2, result);

      Console.WriteLine();
      Console.WriteLine("Press <ENTER> to terminate client.");
      Console.ReadLine();

      factory.Close();
   }
}
```
