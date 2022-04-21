# Debug

- [Back to the Home page](../../README.md)
- [Back to the Dev page](../README.md)
- [Back to the Readme page](README.md)

Trace.WriteLine("test trace");
Debug.WriteLine("test debug");
TestContext.WriteLine("test context");
Console.WriteLine("test console");

var stopwatch = new Stopwatch();
stopwatch.Start();
Debug.WriteLine(stopwatch.ElapsedMilliseconds);
