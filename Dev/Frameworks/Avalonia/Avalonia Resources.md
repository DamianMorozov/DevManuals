# Avalonia Resources

## Links
- http://avaloniaui.net/docs/quickstart/create-new-project
- https://github.com/AvaloniaUI/avalonia-dotnet-templates

## Clone the repository
```
git clone https://github.com/AvaloniaUI/avalonia-dotnet-templates.git
cd avalonia-dotnet-templates/
dotnet new --install app
dotnet new --install app-mvvm
dotnet new --install usercontrol
dotnet new --install window
dotnet new --list
```
## Creating a new MVVM Application
`dotnet new avalonia.mvvm -o Avalonia.Example.MvvmApp`
## Creating a new Application
`dotnet new avalonia.app -o Avalonia.Example.App`
## Creating a new Window
`dotnet new avalonia.window -na MyApp -n Avalonia.Example.Window`
## Creating a new UserControl
`dotnet new avalonia.window -na MyApp -n Avalonia.Example.UserControl`
