# Blazor appsettings.json

# Add appsettings
```
appsettings.json
appsettings.Debug.json
appsettings.Release.json
```

# Edit BlazorApp.csproj
```xml
  <ItemGroup>
    <None Include="appsettings.json" />
    <None Include="appsettings.Debug.json">
      <DependentUpon>appsettings.json</DependentUpon>
    </None>
    <None Include="appsettings.Release.json">
      <DependentUpon>appsettings.json</DependentUpon>
    </None>
  </ItemGroup>
```

# Edit Program.cs
```csharp
  public static IHostBuilder CreateHostBuilder(string[] args) => Host.CreateDefaultBuilder(args)
  .ConfigureWebHostDefaults(webBuilder =>
  {
      webBuilder.UseStartup<Startup>();
  })
  .ConfigureAppConfiguration((hostingContext, config) =>
  {
      config.SetBasePath(Directory.GetCurrentDirectory());
#if DEBUG
      config.AddJsonFile("appsettings.Debug.json", optional: true, reloadOnChange: true);
#else
      config.AddJsonFile("appsettings.Release.json", optional: true, reloadOnChange: true);
#endif
  })
  ;
```
