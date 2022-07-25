# Radzen components

## Links
- [CRM Radzen](https://crm.radzen.com/)
- [Radzen Blazor Components](https://blazor.radzen.com/)
- [Get started](https://blazor.radzen.com/get-started)
- [Documentation](https://radzen.com/documentation/)


## Step 1. Install NuGet
- [Radzen.Blazor package](https://www.nuget.org/packages/Radzen.Blazor/)

## Step 2. Import the namespace
Write this in **_Imports.razor**:
```
@using Radzen
@using Radzen.Blazor
```

## Step 3. Include a theme
Server-side Blazor before .NET 6: edit **_Host.cshtml**
Server-side Blazor .NET 6: edit **_Layout.cshtml**
Client-side WebAssembly Blazor: edit **wwwroot/index.html**  before <!DOCTYPE html>:
```
<!-- Radzen theme -->
<link rel="stylesheet" href="_content/Radzen.Blazor/css/default-base.css">
<!-- Include Bootstrap -->
<link rel="stylesheet" href="_content/Radzen.Blazor/css/default.css">
```

## Step 4. Include Radzen.Blazor.js
Server-side Blazor before .NET 6: edit **_Host.cshtml**
Server-side Blazor .NET 6: edit **_Layout.cshtml**
Client-side WebAssembly Blazor: edit **wwwroot/index.html** at the end of <body>:
```
<!-- Java scripts -->
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
Open the **Shared\MainLayout.razor** file and include:
```
<RadzenDialog />
<RadzenNotification />
<RadzenContextMenu />
<RadzenTooltip />
```
Open **Startup.cs** file (Blazor Server before .NET 6) or **Program.cs** (Blazor WebAssembly or Blazor Server after .NET 6) and add:
```
public void ConfigureServices(IServiceCollection services)
{
	services.AddScoped<Radzen.DialogService>();
	services.AddScoped<Radzen.NotificationService>();
	services.AddScoped<Radzen.TooltipService>();
	services.AddScoped<Radzen.ContextMenuService>();
}
```
Write this in **Program.cs** (client-side WebAssembly Blazor):
```
WebAssemblyHostBuilder builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");
builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress) });
builder.Services.AddScoped<Radzen.DialogService>();
builder.Services.AddScoped<Radzen.NotificationService>();
builder.Services.AddScoped<Radzen.TooltipService>();
builder.Services.AddScoped<Radzen.ContextMenuService>();
await builder.Build().RunAsync();
```
