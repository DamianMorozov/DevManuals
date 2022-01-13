# Authentication & Authorization

[How to enable Windows authentication with server side Blazor](https://stackoverflow.com/questions/59400039/how-to-enable-windows-authentication-with-server-side-blazor "stackoverflow.com")

[TestingBlazor](https://github.com/akovac35/TestingBlazor "github.com")


## Step 1. Add NuGet packages
- Microsoft.AspNetCore.Authentication.Negotiate
- Microsoft.AspNetCore.Components.Authorization


## Step 2. Update Startup.cs

```csharp
public void ConfigureServices(IServiceCollection services)
{
	...
	// Authentication & Authorization.
	services.AddAuthentication(NegotiateDefaults.AuthenticationScheme).AddNegotiate();
	// Windows authentication may not be applied with Kestrel without this line
	services.AddAuthorization(options => options.FallbackPolicy = options.DefaultPolicy);
	services.AddAuthentication();
	services.AddAuthorization();
	services.AddHttpContextAccessor();
	...
}

public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
{
	...
	app.UseRouting();
	// Authentication & Authorization after app.UseRouting().
	app.UseAuthentication();
	app.UseAuthorization();
	...
}
```


## Step 3. Add and change Login.razor

```csharp
@page "/system/login"
@using Microsoft.AspNetCore.Components.Authorization
@using Microsoft.AspNetCore.Components.WebAssembly.Authentication
@inherits RazorDisposable
@inject NavigationManager Navigation

<AuthorizeView>
    <Authorizing>
        <div>Authorizing ...</div>
    </Authorizing>
    <Authorized>
        @if (context.User.Identity != null)
        {
            Authentication = context;
            <div>@context.User.Identity.Name</div>
        } else
        {
            <div>User detect error!</div>
        }
    </Authorized>
    <NotAuthorized>
        <div>Not authorized!</div>
        <a href="system/login">Log in</a>
        <a href="system/register">Register</a>
    </NotAuthorized>
</AuthorizeView>
```

## Step 4. Add and change Login.razor.cs

```csharp
using Microsoft.AspNetCore.Components.Authorization;

namespace BlazorDeviceControl.Shared.Sys
{
    public partial class Login
    {
        public AuthenticationState Authentication { get; set; }
    }
}
```
