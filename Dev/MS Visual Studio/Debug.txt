Trace.WriteLine("test trace");
Debug.WriteLine("test debug");
TestContext.WriteLine("test context");
Console.WriteLine("test console");

var stopwatch = new Stopwatch();
stopwatch.Start();
Debug.WriteLine(stopwatch.ElapsedMilliseconds);
