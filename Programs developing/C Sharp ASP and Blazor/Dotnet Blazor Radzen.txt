----------------------------------------------------------------------------------------------------
https://crm.radzen.com/
https://blazor.radzen.com/
https://blazor.radzen.com/get-started
https://radzen.com/documentation/
----------------------------------------------------------------------------------------------------
1. Install NuGet
  https://www.nuget.org/packages/Radzen.Blazor/
2. Import the namespace => _Imports.razor
  @using Radzen
  @using Radzen.Blazor
3. Include a theme => _Host.cshtml file (server-side Blazor) or wwwroot/index.html (client-side WebAssembly Blazor)
Insert this snippet before <!DOCTYPE html>.
  @*Radzen theme.*@
  <link rel="stylesheet" href="_content/Radzen.Blazor/css/default-base.css">
Include Bootstrap
  <link rel="stylesheet" href="_content/Radzen.Blazor/css/default.css">
4. Include Radzen.Blazor.js => _Host.cshtml file (server-side Blazor) or wwwroot/index.html (client-side WebAssembly Blazor)
Insert this snippet in the end of <body>.
  <script src="_content/Radzen.Blazor/Radzen.Blazor.js"></script>
5. Use a component => Blazor page
  <RadzenButton Click="@ButtonClicked" Text="@text"></RadzenButton>
  @code {
    string text = "Hi";
    void ButtonClicked()
    {
      //
    }
  }
6. Use Dialog, Notification, ContextMenu and Tooltip components => Shared/MainLayout.razor
Insert this snippet after @inherits LayoutComponentBase
  <RadzenDialog />
  <RadzenNotification />
  <RadzenContextMenu />
  <RadzenTooltip />
Startup.cs (server-side Blazor)
  using Radzen;
  ...
  public void ConfigureServices(IServiceCollection services)
  {
      ...
      services.AddScoped<DialogService>();
      services.AddScoped<NotificationService>();
      services.AddScoped<TooltipService>();
      services.AddScoped<ContextMenuService>();
      ...
  }
Program.cs (client-side WebAssembly Blazor)
  using Radzen;
  ...
  public static async Task Main(string[] args)
  {
      var builder = WebAssemblyHostBuilder.CreateDefault(args);
      builder.RootComponents.Add<App>("app");
      builder.Services.AddTransient(sp => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress) });
      ...
      builder.Services.AddScoped<DialogService>();
      builder.Services.AddScoped<NotificationService>();
      builder.Services.AddScoped<TooltipService>();
      builder.Services.AddScoped<ContextMenuService>();
      ...
      await builder.Build().RunAsync();
  }
----------------------------------------------------------------------------------------------------
