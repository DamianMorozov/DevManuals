# 📘 C# Типы данных — расширенный справочник

## Оглавление
- [Значимые типы данных (Value Types)](#значимые-типы-данных-value-types)  
- [Nullable Value Types](#nullable-value-types)  
- [Ссылочные типы данных (Reference Types)](#ссылочные-типы-данных-reference-types)  
- [Строки](#строки)  
- [Коллекции](#коллекции)  
- [Интерфейсы коллекций](#интерфейсы-коллекций)  
- [Generics, covariance, contravariance](#generics-covariance-contravariance)  
- [Современные типы C#](#современные-типы-c)  
- [Специальные типы .NET 7+](#специальные-типы-net-7)  
- [Соответствие типов C# → PostgreSQL](#соответствие-типов-c--postgresql)  
- [EF Core Nullability](#ef-core-nullability)  
- [Соответствие типов C# → JSON](#соответствие-типов-c--json)  

---

## Значимые типы данных (Value Types)

Value types **всегда содержат значение**, не могут быть `null`, если не объявлены как nullable (`int?`).

### Signed integral
| Тип | Диапазон |
|-----|----------|
| `sbyte` | -128 … 127 |
| `short` | -32768 … 32767 |
| `int` | -2147483648 … 2147483647 |
| `long` | -9223372036854775808 … 9223372036854775807 |

### Unsigned integral
| Тип | Диапазон |
|-----|----------|
| `byte` | 0 … 255 |
| `ushort` | 0 … 65535 |
| `uint` | 0 … 4294967295 |
| `ulong` | 0 … 18446744073709551615 |

### Floating point
| Тип | Диапазон | Точность |
|-----|----------|----------|
| `float` | ±3.4E38 | ~6–9 цифр |
| `double` | ±1.7E308 | ~15–17 цифр |
| `decimal` | ±7.9E28 | 28–29 цифр |

### Прочие value types
- `bool`
- `char`
- `DateTime`
- `TimeSpan`
- `Guid`
- `enum`
- `struct`
- `readonly struct`

---

## Nullable Value Types

```csharp
int? x = null;
bool? flag = null;
DateTime? dt = null;
```

EF Core → создаёт `NULL` в БД.

---

## Ссылочные типы данных (Reference Types)

Reference types **хранят ссылку**, могут быть `null`.

- `string`
- `StringBuilder`
- `class`
- `object`
- `interface`
- массивы
- коллекции
- `delegate`
- `record class`

---

## Строки

- Immutable  
- Reference type  
- Сравнение по значению  
- Интерполяция: `$"{value}"`  
- Вербатим‑строки: `@"C:\path\file"`  

---

## Коллекции

### Пространства имён
- `System.Collections`
- `System.Collections.Generic`
- `System.Collections.Concurrent`
- `System.Collections.Immutable`

### Основные типы
- `List<T>`, `Dictionary<T>`, `HashSet<T>`
- `Queue<T>`, `Stack<T>`
- `SortedDictionary<TKey,TValue>`
- `SortedList<TKey,TValue>`
- `SortedSet<T>`

---

## Интерфейсы коллекций

### `ICollection`
```csharp
public interface ICollection : IEnumerable
{
    int Count { get; }
    bool IsSynchronized { get; }
    object SyncRoot { get; }
    void CopyTo(Array array, int index);
}
```

### `IEnumerable`
```csharp
public interface IEnumerable
{
    IEnumerator GetEnumerator();
}
```

### `IEnumerator`
```csharp
public interface IEnumerator
{
    object Current { get; }
    bool MoveNext();
    void Reset();
}
```

### `ICollection<T>`
```csharp
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
```

### `IList<T>`
```csharp
public interface IList<T> : ICollection<T>, IEnumerable<T>, IEnumerable
{
    T this[int index] { get; set; }
    int IndexOf(T item);
    void Insert(int index, T item);
    void RemoveAt(int index);
}
```

---

## Generics, covariance, contravariance

### Invariance (обычное поведение)
```csharp
List<string> → нельзя присвоить List<object>
```

### Covariance (`out`)
Позволяет использовать **более конкретный тип** там, где ожидается базовый.

Работает для:
- `IEnumerable<out T>`
- `IReadOnlyList<out T>`

Пример:

```csharp
IEnumerable<string> s = new List<string>();
IEnumerable<object> o = s; // OK
```

### Contravariance (`in`)
Позволяет использовать **более общий тип** там, где ожидается конкретный.

Работает для:
- `IComparer<in T>`
- `IEqualityComparer<in T>`

Пример:

```csharp
IComparer<object> c1 = ...
IComparer<string> c2 = c1; // OK
```

---

## Современные типы C#

### `record`
- Reference type  
- Value‑based equality  
- Отлично подходит для DTO, immutable‑моделей  

### `record struct`
- Value type  
- Value‑based equality  

### `readonly struct`
- Все поля неизменяемые  
- Оптимально для маленьких value‑объектов  

### `Span<T>` / `ReadOnlySpan<T>`
- Стековый тип  
- Zero‑allocation slicing  
- Нельзя хранить в полях классов  
- Используется для высокопроизводительной обработки данных  

---

## Специальные типы .NET 7+

### `nint`, `nuint`
- Целые числа платформенной разрядности  
- 32‑бит на x86, 64‑бит на x64  

### `Half`
- 16‑битный float  
- Используется в ML и графике  

### `Int128`, `UInt128`
- 128‑битные целые  
- Полезны в криптографии и больших числах  

---

## Соответствие типов C# → PostgreSQL

| C# тип | PostgreSQL тип | Nullable? |
|--------|----------------|-----------|
| `bool` | `boolean` | `bool?` |
| `byte` | `smallint` | `byte?` |
| `short` | `smallint` | `short?` |
| `int` | `integer` | `int?` |
| `long` | `bigint` | `long?` |
| `float` | `real` | `float?` |
| `double` | `double precision` | `double?` |
| `decimal` | `numeric` | `decimal?` |
| `string` | `text` / `varchar(n)` | nullable по умолчанию |
| `DateTime` | `timestamp without time zone` | `DateTime?` |
| `Guid` | `uuid` | `Guid?` |
| `byte[]` | `bytea` | nullable |

---

## EF Core Nullability

| C# тип | EF Core колонка | NULL в БД? |
|--------|-----------------|------------|
| `int` | `integer` | ❌ (NOT NULL) |
| `int?` | `integer` | ✔ |
| `bool` | `boolean` | ❌ |
| `bool?` | `boolean` | ✔ |
| `DateTime` | `timestamp` | ❌ |
| `DateTime?` | `timestamp` | ✔ |
| `string` | `text` | ✔ (если нет `[Required]`) |
| `[Required] string` | `text` | ❌ |
| `byte[]` | `bytea` | ✔ |
| `[Required] byte[]` | `bytea` | ❌ |

### Правило EF Core:

> **Value types → всегда NOT NULL**  
> **Reference types → NULL, если нет `[Required]`**  

---

## Соответствие типов C# → JSON

| C# тип | JSON тип | Пример |
|--------|----------|---------|
| `int`, `long`, `float`, `double`, `decimal` | number | `42`, `3.14` |
| `bool` | boolean | `true` |
| `string` | string | `"hello"` |
| `Guid` | string | `"d3e1...c9"` |
| `DateTime` | string (ISO 8601) | `"2023-01-01T12:00:00Z"` |
| `byte[]` | string (Base64) | `"AQIDBA=="` |
| `object` | object | `{ "a": 1 }` |
| `List<T>` | array | `[1,2,3]` |
| `Dictionary<string,T>` | object | `{ "key": value }` |

