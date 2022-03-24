# Lib 2019 Eng. Blazor Revealed. Building Web Applications in .NET

Year:          2019
Author:        Peter Himschoot.
Book title:    Blazor Revealed: Building Web Applications in .NET
ISBN-13 (pbk): 978-1-4842-4342-8
ISBN-13 (electronic): 978-1-4842-4343-5

## Blazor Prerequisites.
.NET Core: https://dotnet.microsoft.com/download
Visual Studio workloads: ASP.NET, Node.js.
Visual Studio extension: ASP.NET Core Blazor Language Services
Visual Studio Code extension: Razor+
Dotnet templates:
> dotnet new --list
> dotnet new --help
> dotnet new -i Microsoft.DotNet.Web.ItemTemplates::3.1.9  -- Installs a source or a template pack
> dotnet new -i Microsoft.AspNetCore.Blazor.Templates      -- Installs a source or a template pack

## Dotnet CLI:
> dotnet new blazorhosted -o MyFirstBlazor
> dotnet build

## Blazor hosting model.
Client-side. The Blazor WebAssembly hosting model has the following benefits:
+ Client resources and capabilities are fully leveraged.
+ Work is offloaded from the server to the client.
+ An ASP.NET Core web server isn’t required to host the app. Serverless deployment scenarios are possible (for example, serving the app from a CDN).
The downsides of the Blazor WebAssembly hosting model are:
- Browser capabilities restrict the app.
- Capable client hardware and software (for example, WebAssembly support) is required.
- Download size is larger, and apps take longer to load.
- .NET runtime and tooling support is less mature. For example, there are limitations in .NET Standard support and debugging.
Server-side. The Blazor Server hosting model offers the following benefits:
- Download size is much smaller than a client-side app, and the app loads much faster.
- The app takes full advantage of server capabilities, including use of any .NET Core-compatible APIs.
- .NET Core on the server is used to run the app, so existing .NET tooling, such as debugging, works as expected.
- Thin clients are supported. For example, server-side apps work with browsers that don’t support WebAssembly and on resource-constrained devices.
- The app’s .NET/C# code base, including the app’s component code, isn’t served to clients.
The downsides to the Blazor Server hosting model are:
- Higher UI latency. Every user interaction involves a network hop.
- There’s no offline support. If the client connection fails, the app stops working.
- Scalability is challenging for apps with many users. The server must manage multiple client connections and handle client state.
- An ASP.NET Core server is required to serve the app. Serverless deployment scenarios aren’t possible. For example, you can’t serve the app from a CDN.

## Host and deploy ASP.NET Core Blazor
https://docs.microsoft.com/en-us/aspnet/core/blazor/host-and-deploy/
