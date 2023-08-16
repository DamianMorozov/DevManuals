# C# data types

## Links
- [Work with data in C#](https://docs.microsoft.com/en-us/learn/paths/csharp-data/ "docs.microsoft.com")
- [Mapping CLR Parameter Data](https://docs.microsoft.com/en-us/sql/relational-databases/clr-integration-database-objects-types-net-framework/mapping-clr-parameter-data "docs.microsoft.com")
- [SQL Server Data Type Mappings](https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/sql-server-data-type-mappings "docs.microsoft.com")
- 2021 Mark J. Price. C# 10 and NET 6. Modern Cross-Platform Development

## Value data types
1. All numeric types:
  - signed integral:
    - sbyte  : -128 to 127
    - short  : -32768 to 32767
    - int    : -2147483648 to 2147483647
    - long   : -9223372036854775808 to 9223372036854775807
  - unsigned integral
    - byte   : 0 to 255
    - ushort : 0 to 65535
    - uint   : 0 to 4294967295
    - ulong  : 0 to 18446744073709551615
  - real:
    - float  : -3.402823E+38 to 3.402823E+38 (with ~6-9 digits of precision)
    - double : -1.79769313486232E+308 to 1.79769313486232E+308 (with ~15-17 digits of precision)
    - decimal: -79228162514264337593543950335 to 79228162514264337593543950335 (with 28-29 digits of precision)
2. char
3. bool
4. struct
5. enum
The value cannot be assigned a null literal.
The operations ==,! = are compared by value.

## Reference data types
1. string, StringBuilder
2. class, object
3. interface
4. Arrays and collections
5. delegate
6. DateTime, TimeSpan, Stopwatch
The reference can be assigned a null literal.
The operations ==,! = are compared by reference.

## String
It is immutable.
Reference type. But equivalence operations compare values.
Contains escape sequences:    string s = "Tab example:\t";
Literal string literals:      string s = @"\\server\share\folder";
String interpolation:         string s = $"Variable value = {i}";
Literal string interpolation: string s = $@"Variable value = {i}";
String comparison:
   "Bbb".CompareTo("Aaa")  // 1
   "Bbb".CompareTo("Bbb")  // 0
   "Bbb".CompareTo("Ccc")  // -1

## Arrays and collections
System.Collections 				| IEnumerable, IEnumerable<T>
System.Collections.Generic		| List<T>, Dictionary<T>, Queue<T>, Stack<T>
System.Collections.Concurrent	| BlockingCollection, ConcurrentDictionary, ConcurrentQueue
System.Collections.Immutable	| ImmutableArray, ImmutableDictionary, ImmutableList, ImmutableQueue
- Dictionary<T>, HashSet<T>
- List<T>, Queue<T>, Stack<T>
- SortedDictionary<TKey, TValue>
- SortedList<TKey, TValue>
- SortedSet<T>

## ICollection
```
namespace System.Collections
{
  public interface ICollection : IEnumerable
  {
    int Count { get; }
    bool IsSynchronized { get; }
    object SyncRoot { get; }
    void CopyTo(Array array, int index);
  }
} 
```

## IEnumerable
```
namespace System.Collections
{
  public interface IEnumerable
  {
    IEnumerator GetEnumerator();
  }
}
```

## IEnumerator
```
namespace System.Collections
{
  public interface IEnumerator
  {
    object Current { get; }
    bool MoveNext();
    void Reset();
  }
}
```

## ICollection<T>
```
namespace System.Collections.Generic
{
  public interface ICollection<T> : IEnumerable<T>, IEnumerable
  {
    int Count { get; }
    bool IsReadOnly { get; }
    void Add(T item);
    void Clear();
    bool Contains(T item);
    void CopyTo(T[] array, int index);
    bool Remove(T item);
  } 
} 
```

## IList<T>
```
namespace System.Collections.Generic
{
  [DefaultMember("Item")]
  public interface IList<T> : ICollection<T>, IEnumerable<T>, IEnumerable
  {
    T this[int index] { get; set; }
    int IndexOf(T item);
    void Insert(int index, T item);
    void RemoveAt(int index);
  }
}
```
