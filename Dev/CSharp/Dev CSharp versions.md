# Dev CSharp versions

- [Back to the Home](../../../README.md)
- [Back to the Dev](../../README.md)
- [Back to the section](README.md)

## Links
- [C# language versioning](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/configure-language-version)
- [The history of C#](https://learn.microsoft.com/en-US/dotnet/csharp/whats-new/csharp-version-history)
- [C# Version History](https://www.tutorialsteacher.com/csharp/csharp-version-history)

## Defaults
Target				Version		C# language version default
.NET				8.x			C# 12
.NET				7.x			C# 11
.NET				6.x			C# 10
.NET				5.x			C# 9.0
.NET Core			3.x			C# 8.0
.NET Core			2.x			C# 7.3
.NET Standard		2.1			C# 8.0
.NET Standard		2.0			C# 7.3
.NET Standard		1.x			C# 7.3
.NET Framework		all			C# 7.3

## Using preview version at project file
```
<PropertyGroup>
   <LangVersion>preview</LangVersion>
</PropertyGroup>
```

## Using latest version at project file
```
<PropertyGroup>
   <LangVersion>latest</LangVersion>
</PropertyGroup>
```
