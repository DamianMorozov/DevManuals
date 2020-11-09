----------------------------------------------------------------------------------------------------
Blazor Tutorial - Build your first Blazor app
https://dotnet.microsoft.com/learn/aspnet/blazor-tutorial/install
> dotnet new blazorserver -o BlazorApp --no-https
> cd BlazorApp
> dotnet run
----------------------------------------------------------------------------------------------------
Build a Blazor todo list app
https://docs.microsoft.com/en-us/aspnet/core/tutorials/build-a-blazor-app
> dotnet new blazorserver -o TodoList
> cd TodoList
> dotnet new razorcomponent -n Todo -o Pages
> edit Shared\NavMenu.razor
> add Data\TodoItem.cs
> edit Pages\Todo.razor
----------------------------------------------------------------------------------------------------
Dotnet Blazor commands:
> dotnet new -i Microsoft.DotNet.Web.ItemTemplates::3.1.9
> dotnet new -i Microsoft.MobileBlazorBindings.Templates::0.5.50-preview
> dotnet new blazorserver -o BlazorApp
> dotnet new blazorserver -o BlazorApp --no-https
> dotnet new razorcomponent -n Todo -o Pages
> dotnet new blazorwasm
> dotnet new blazorwasm --hosted
> dotnet new blazorwasm --hosted --output BlazorSignalRApp
> dotnet new blazorhybrid -o MyHybridApp
> dotnet run --configuration Debug
> dotnet run --configuration Release
----------------------------------------------------------------------------------------------------
