# Fix errors

## There is no registered service of type 'System.Net.Http.IHttpClientFactory'
Program.cs
```
builder.Services.AddHttpClient();
```

## How do I access HttpContext in Server-side Blazor?
Program.cs
```
services.AddHttpContextAccessor();
```
*.razor / *.cshtml
```
@using Microsoft.AspNetCore.Http
@inject IHttpContextAccessor httpContextAccessor
```
*.razor.cs
```
using Microsoft.AspNetCore.Http;
[Inject] IHttpContextAccessor? HttpContextAccessor { get; set; }
```
