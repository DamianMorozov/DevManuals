----------------------------------------------------------------------------------------------------
Use ASP.NET Core SignalR with Blazor WebAssembly
https://docs.microsoft.com/en-us/aspnet/core/tutorials/signalr-blazor-webassembly
----------------------------------------------------------------------------------------------------
1. Create a hosted Blazor WebAssembly app project.
Note: Visual Studio 16.6 or later and .NET Core SDK 3.1.300 or later are required.
File -> New -> Project -> Blazor App -> "BlazorSignalRApp" -> Choose location -> Create -> Blazor WebAssembly App template -> select the ASP.NET Core hosted -> Create.
----------------------------------------------------------------------------------------------------
2. Add the SignalR client library.
BlazorSignalRApp.Client project -> Manage NuGet Packages -> nuget.org -> Microsoft.AspNetCore.SignalR.Client
----------------------------------------------------------------------------------------------------
3. Add a SignalR hub.
BlazorSignalRApp.Server project -> create a "Hubs" folder and add the following ChatHub class (Hubs/ChatHub.cs):
  using Microsoft.AspNetCore.SignalR;
  using System.Threading.Tasks;
  namespace BlazorSignalRApp.Server.Hubs
  {
      public class ChatHub : Hub
      {
          public async Task SendMessage(string user, string message)
          {
              await Clients.All.SendAsync("ReceiveMessage", user, message);
          }
      }
  }
----------------------------------------------------------------------------------------------------
4. Add services and an endpoint for the SignalR hub.
BlazorSignalRApp.Server project -> open the Startup.cs.
Add the namespace:
  using BlazorSignalRApp.Server.Hubs;
Add SignalR and Response Compression Middleware services to Startup.ConfigureServices:
  public void ConfigureServices(IServiceCollection services)
  {
      services.AddSignalR();
      services.AddControllersWithViews();
      services.AddResponseCompression(opts =>
      {
          opts.MimeTypes = ResponseCompressionDefaults.MimeTypes.Concat(
              new[] { "application/octet-stream" });
      });
      services.AddRazorPages();
  }
In Startup.Configure:
Use Response Compression Middleware at the top of the processing pipeline's configuration.
Between the endpoints for controllers and the client-side fallback, add an endpoint for the hub.
  public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
  {
      app.UseResponseCompression();
      if (env.IsDevelopment())
      {
          app.UseDeveloperExceptionPage();
          app.UseWebAssemblyDebugging();
      }
      else
      {
          app.UseExceptionHandler("/Error");
          // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
          app.UseHsts();
      }
      app.UseHttpsRedirection();
      app.UseBlazorFrameworkFiles();
      app.UseStaticFiles();
      app.UseRouting();
      app.UseEndpoints(endpoints =>
      {
          endpoints.MapRazorPages();
          endpoints.MapControllers();
          endpoints.MapHub<ChatHub>("/chathub");
          endpoints.MapFallbackToFile("index.html");
      });
  }
----------------------------------------------------------------------------------------------------
5. Add Razor component code for chat.
BlazorSignalRApp.Client project -> open the Pages/Index.razor.
Replace the markup with the following code:
  @page "/"
  @using Microsoft.AspNetCore.SignalR.Client
  @inject NavigationManager NavigationManager
  @implements IDisposable

  <div class="form-group">
      <label>
          User:
          <input @bind="_userInput" size="50" />
      </label>
  </div>
  <div class="form-group">
      <label>
          Message:
          <input @bind="_messageInput" size="50" />
      </label>
  </div>
  <button class="btn btn-dark" @onclick="Send" disabled="@(!IsConnected)">Send</button>

  <hr>

  <ul id="messagesList">
      @foreach (var message in _messages)
      {
          <li>@message</li>
      }
  </ul>

  @code {
      private HubConnection _hubConnection;
      private readonly List<string> _messages = new List<string>();
      private string _userInput;
      private string _messageInput;

      protected override async Task OnInitializedAsync()
      {
          _hubConnection = new HubConnectionBuilder()
              .WithUrl(NavigationManager.ToAbsoluteUri("/chathub"))
              .Build();

          _hubConnection.On<string, string>("ReceiveMessage", (user, message) =>
          {
              var encodedMsg = $"{user}: {message}";
              _messages.Add(encodedMsg);
              StateHasChanged();
          });

          await _hubConnection.StartAsync();
      }

      private Task Send()
      {
          var user = _userInput;
          var message = _messageInput;
          _messageInput = string.Empty;
          return _hubConnection.SendAsync("SendMessage", user, message);
      }

      public bool IsConnected =>
          _hubConnection.State == HubConnectionState.Connected;

      public void Dispose()
      {
          _ = _hubConnection.DisposeAsync();
      }
  }
----------------------------------------------------------------------------------------------------
6. Run the app.
----------------------------------------------------------------------------------------------------
