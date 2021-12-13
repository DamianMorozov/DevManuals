# IDisposable

RAII — Resource Acquisition Is Initialization
Dispose - deterministic method
Finalizator - non-deterministic method

## Managed resources
CLR: int, string, double, Array, List<T>

## Unmanaged resources
IntPtr / Memory
Net / Socket
FileSystem
DllImport / WinAPI
GDI / VideoCard
Db
Driver

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