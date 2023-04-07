# How to test non-public methods in NET

## private -> public

## private -> internal
```
.NET Framework
[InternalsVisibleToAttribute("...")]
[assembly: InternalsVisibleTo("...")]
```

## private -> protected.
In the testing assembly will need to make an heir to the class under test - access to the method is obtained.

## PrivateObject
Use for Visual Studio Unit Testing Framework.

## Reflection
```
var obj = new SomeClass(SomeArgs args);
Type t = typeof(SomeClass);
FieldInfo fi = t.GetField("SomeField", BindingFlags.Instance | BindingFlags.NonPublic | BindingFlags.Public);
fi.SetValue(obj, someValue);
t.InvokeMember("SomeMethod", BindingFlags.InvokeMethod | BindingFlags.NonPublic |
  BindingFlags.Public | BindingFlags.Instance, null, obj, new object[] { SomeMethod });
```

## NET
Edit *.csproj
```
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFramework>net7.0</TargetFramework>
    <ImplicitUsings>enable</ImplicitUsings>
    <Nullable>enable</Nullable>
    <LangVersion>latest</LangVersion>
    <Platforms>AnyCPU;x64;x86</Platforms>
  </PropertyGroup>
  <ItemGroup>
    <AssemblyAttribute Include="System.Runtime.CompilerServices.InternalsVisibleTo">
      <_Parameter1>AppTests</_Parameter1>
    </AssemblyAttribute>
  </ItemGroup>
</Project>
```
