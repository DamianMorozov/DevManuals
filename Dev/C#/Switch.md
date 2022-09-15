# Switch

## Switch based on generic argument type
```
public class Foo
{
    public string FooMsg { get; set; }
}

public class Bar
{
    public string BarMsg { get; set; }
}

public class Example
{
    public T Process<T>(T procClass) where T : class
    {
        switch (typeof(T))
        {
            case
                var cls when cls == typeof(Foo):
                {
                    var temp = (Foo)((object)procClass);
                    temp.FooMsg = "This is a Foo!";

                    break;
                }

            case
                var cls when cls == typeof(Bar):
                {
                    var temp = (Bar)((object)procClass);
                    temp.BarMsg = "This is a Bar!";

                    break;
                }
        }

        return
            procClass;
    }

    public void Test(string message)
    {
        Process(new Foo() { FooMsg = message });
        Process(new Bar() { BarMsg = message });
    }
}
```
