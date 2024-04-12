# Dev NuGet Errors and Warnings

## Links
- [NuGet Warnings NU1901, NU1902, NU1903, NU1904](https://learn.microsoft.com/en-us/nuget/reference/errors-and-warnings/nu1901-nu1904)

```
warning NU1902: Package 'NuGet.Protocol' 5.11.2 has a known moderate severity vulnerability, https://github.com/advisories/GHSA-g3q9-xf95-8hp5
```

Warning Code	Severity
NU1901			low
NU1902			moderate
NU1903			high
NU1904			critical

```
<NuGetAuditLevel>low</NuGetAuditLevel>
<NuGetAuditLevel>moderate</NuGetAuditLevel>
<NuGetAuditLevel>high</NuGetAuditLevel>
<NuGetAuditLevel>critical</NuGetAuditLevel>
```

```
<WarningsNotAsErrors>NU1901;NU1902;NU1903;NU1904</WarningsNotAsErrors>
```

Project file or Directory.Build.props file.
```
<PropertyGroup>
	<NuGetAudit>false</NuGetAudit>
</PropertyGroup>
```
