# Dotnet Blazor Radzen

https://crm.radzen.com/
https://blazor.radzen.com/
https://blazor.radzen.com/get-started
https://radzen.com/documentation/


## Step 1. Install NuGet
- [Radzen.Blazor package](https://www.nuget.org/packages/Radzen.Blazor/)

## Step 2. Import the namespace
Write this in **_Imports.razor**:
```
@using Radzen
@using Radzen.Blazor
```

## Step 3. Include a theme
Write this in **_Host.cshtml** (server-side Blazor) or **wwwroot/index.html** (client-side WebAssembly Blazor) before <!DOCTYPE html>:
```
<!--Radzen theme-->
<link rel="stylesheet" href="_content/Radzen.Blazor/css/default-base.css">
<!--Include Bootstrap-->
<link rel="stylesheet" href="_content/Radzen.Blazor/css/default.css">
```

## Step 4. Include Radzen.Blazor.js
Write this in **_Host.cshtml** (server-side Blazor) or **wwwroot/index.html** (client-side WebAssembly Blazor) at the end of <body>:
```
<script src="_content/Radzen.Blazor/Radzen.Blazor.js"></script>
```

## Step 5. Use a component
Write this in **SomePage.razor**:
```
<RadzenButton Click=@ButtonClicked Text=@ButtonText></RadzenButton>
```
Write this in **SomePage.razor.cs**:
```
private string ButtonText { get; set; } = "Hello World!";
private void ButtonClicked()
{
  //
}
```

## Step 6. Use Dialog, Notification, ContextMenu and Tooltip components
Write this in **Shared/MainLayout.razor** after @inherits:
```
<RadzenDialog />
<RadzenNotification />
<RadzenContextMenu />
<RadzenTooltip />
```
Write this in **Startup.cs** (server-side Blazor):
```
using Radzen;
public void ConfigureServices(IServiceCollection services)
{
	services.AddScoped<DialogService>();
	services.AddScoped<NotificationService>();
	services.AddScoped<TooltipService>();
	services.AddScoped<ContextMenuService>();
}
```
Write this in **Program.cs** (client-side WebAssembly Blazor)
```
using Radzen;
public static async Task Main(string[] args)
{
	var builder = WebAssemblyHostBuilder.CreateDefault(args);
	builder.RootComponents.Add<App>("app");
	builder.Services.AddTransient(sp => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress) });
	//
	builder.Services.AddScoped<DialogService>();
	builder.Services.AddScoped<NotificationService>();
	builder.Services.AddScoped<TooltipService>();
	builder.Services.AddScoped<ContextMenuService>();
	//
	await builder.Build().RunAsync();
}
```
