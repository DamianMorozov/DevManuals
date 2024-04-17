# Dev C# 6 lesser-known features of C# .NET that you should be using

- [Back to the Home](../../../README.md)
- [Back to the Dev](../../README.md)
- [Back to the section](README.md)

https://chrisstclair.co.uk/6-lesser-known-features-of-c-net-that-you-should-be-using/
// 1. Use Stopwatch instead DateTime.
var sleeps = new List<int>();
for (var i = 1; i < 10; i++)
	sleeps.Add(i*50);
Console.WriteLine("Using DateTime.");
foreach(var sleep in sleeps)
{
	var start = DateTime.Now;
	System.Threading.Thread.Sleep(sleep);
	var duration = (int)(DateTime.Now - start).TotalMilliseconds;
	Console.WriteLine($"The operation too {duration} milliseconds.");
}
Console.WriteLine();
Console.WriteLine("Using Stopwatch.");
foreach(var sleep in sleeps)
{
	var sw = System.Diagnostics.Stopwatch.StartNew();
	System.Threading.Thread.Sleep(sleep);
	var duration = sw.ElapsedMilliseconds;
	Console.WriteLine($"The operation too {duration} milliseconds.");
}
----------------------------------------------------------------------------------------------------
// 2. Task Parallel Library (TPL).
// https://chrisstclair.co.uk/multithreading-made-easy-parallel-foreach/
var items = Enumerable.Range(0, 100).ToList();
Console.WriteLine($"Not using TPL.");
var list = new List<int>();
int counter = 0;
var sw = System.Diagnostics.Stopwatch.StartNew();
foreach (var item in items)
{
	counter++;
	list.Add(0);
	System.Threading.Thread.Sleep(50);
}
Console.WriteLine($"counter: {counter}.");
Console.WriteLine($"list.Count: {list.Count}.");
Console.WriteLine($"Took {sw.ElapsedMilliseconds} milliseconds.");
Console.WriteLine();
Console.WriteLine($"Using TPL.");
var locker = new object();
var list1 = new List<int>();
var list2 = new List<int>();
var blockCol = new System.Collections.Concurrent.BlockingCollection<int>();
var concBag = new System.Collections.Concurrent.ConcurrentBag<int>();
int counter1 = 0;
int counter2 = 0;
sw = System.Diagnostics.Stopwatch.StartNew();
System.Threading.Tasks.Parallel.ForEach(items, (item) =>
{
	counter1++;  // this is bug
	Interlocked.Increment(ref counter2);
	list1.Add(0);  // this is bug
	lock (locker)
	{
	    list2.Add(0);
	}
	blockCol.Add(0);
	concBag.Add(0);
	System.Threading.Thread.Sleep(50);
});
Console.WriteLine($"counter1: {counter1}.");
Console.WriteLine($"counter2: {counter2}.");
Console.WriteLine($"list1.Count: {list1.Count}.");
Console.WriteLine($"list2.Count: {list2.Count}.");
Console.WriteLine($"blockCol.Count: {blockCol.Count}.");
Console.WriteLine($"concBag.Count: {concBag.Count}.");
Console.WriteLine($"Took {sw.ElapsedMilliseconds} milliseconds.");
----------------------------------------------------------------------------------------------------
