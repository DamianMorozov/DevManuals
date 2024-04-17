# ICloneable example

- [Back to the Home](../../../README.md)
- [Back to the Dev](../../README.md)
- [Back to the section](README.md)

```
using System;

public class Person : ICloneable
{
    public string Name { get; set; }
    public int Age { get; set; }

    public object Clone()
    {
        return new Person { Name = this.Name, Age = this.Age };
    }
}

class Program
{
    static void Main(string[] args)
    {
        Person person1 = new Person { Name = "John", Age = 25 };
        Person person2 = (Person)person1.Clone();

        Console.WriteLine("Person 1: Name = " + person1.Name + ", Age = " + person1.Age);
        Console.WriteLine("Person 2: Name = " + person2.Name + ", Age = " + person2.Age);

        person2.Name = "Jane";
        person2.Age = 30;

        Console.WriteLine("Person 1: Name = " + person1.Name + ", Age = " + person1.Age);
        Console.WriteLine("Person 2: Name = " + person2.Name + ", Age = " + person2.Age);
    }
}
```
