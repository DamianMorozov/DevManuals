# Debug

- [Back to the Home](../../../README.md)
- [Back to the Dev](../../README.md)
- [Back to the section](README.md)

Trace.WriteLine("test trace");
Debug.WriteLine("test debug");
TestContext.WriteLine("test context");
Console.WriteLine("test console");

var stopwatch = new Stopwatch();
stopwatch.Start();
Debug.WriteLine(stopwatch.ElapsedMilliseconds);
