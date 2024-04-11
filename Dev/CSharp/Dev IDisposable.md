# IDisposable

## Links
- [What is "managed code"?](https://learn.microsoft.com/en-us/dotnet/standard/managed-code)
- [Cleaning up unmanaged resources](https://learn.microsoft.com/en-us/dotnet/standard/garbage-collection/unmanaged)

RAII — Resource Acquisition Is Initialization
Dispose - deterministic method
Finalizator - non-deterministic method

## Managed resources / CLR
- int
- string
- double
- arrays / lists

## Unmanaged resources
- IntPtr / Memory
- Net / Socket
- FileSystem
- DllImport / WinAPI
- GDI / VideoCard
- DB / SQL
- Drivers

## Equivalent compiler destructor
```csharp
protected override void Finalize()
{
    try
    {
        // destructor methods
    }
    finally
    {
        base.Finalize();
    }
}

```
