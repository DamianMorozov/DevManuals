----------------------------------------------------------------------------------------------------
ASP.NET Core Blazor hosting models
https://docs.microsoft.com/en-us/aspnet/core/blazor/hosting-models
----------------------------------------------------------------------------------------------------
--- Blazor WebAssembly. ---
| Browser - UI thread - Blazor |
The blazor.webassembly.js script is provided by the framework and handles:
- Downloading the .NET runtime, the app, and the app's dependencies.
- Initialization of the runtime to run the app.
The Blazor WebAssembly hosting model offers several benefits:
- There's no .NET server-side dependency. The app is fully functioning after it's downloaded to the client.
- Client resources and capabilities are fully leveraged.
- Work is offloaded from the server to the client.
- An ASP.NET Core web server isn't required to host the app. Serverless deployment scenarios are possible (for example, serving the app from a CDN).
There are downsides to Blazor WebAssembly hosting:
- The app is restricted to the capabilities of the browser.
- Capable client hardware and software (for example, WebAssembly support) is required.
- Download size is larger, and apps take longer to load.
- .NET runtime and tooling support is less mature. For example, limitations exist in .NET Standard support and debugging.
--- Blazor Server. ---
| Browser | <- SignalR -> | dotnet.exe - ASP.NET Core - Blazor |
> dotnet new blazorserver
The ASP.NET Core app references the app's Startup class to add:
- Server-side services.
- The app to the request handling pipeline.
The Blazor Server hosting model offers several benefits:
- Download size is significantly smaller than a Blazor WebAssembly app, and the app loads much faster.
- The app takes full advantage of server capabilities, including use of any .NET Core compatible APIs.
- .NET Core on the server is used to run the app, so existing .NET tooling, such as debugging, works as expected.
- Thin clients are supported. For example, Blazor Server apps work with browsers that don't support WebAssembly and on resource-constrained devices.
- The app's .NET/C# code base, including the app's component code, isn't served to clients.
There are downsides to Blazor Server hosting:
- Higher latency usually exists. Every user interaction involves a network hop.
- There's no offline support. If the client connection fails, the app stops working.
- Scalability is challenging for apps with many users. The server must manage multiple client connections and handle client state.
- An ASP.NET Core server is required to serve the app. Serverless deployment scenarios aren't possible (for example, serving the app from a CDN).
----------------------------------------------------------------------------------------------------
