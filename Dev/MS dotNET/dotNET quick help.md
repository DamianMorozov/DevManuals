# dotNET quick help

- [dotNET Link](https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet)

```
dotnet --help				## Display help
dotnet --info				## Display .NET Core information
dotnet --list-runtimes		## Display the installed runtimes
dotnet --list-sdks			## Display the installed SDKs
dotnet add package			## Adds a package reference to a project file
dotnet add reference		## Adds project-to-project (P2P) references
dotnet build				## Builds a project and all of its dependencies
dotnet build-server
dotnet build-server shutdown [--msbuild] [--razor] [--vbcscompiler]
dotnet build-server shutdown [-h|--help]
dotnet build-server [-h|--help]
dotnet clean				## Cleans the output of a project
dotnet help					## Shows more detailed documentation online for the specified command
dotnet list package			## Lists the package references for a project or solution
dotnet list reference		## Lists project-to-project references
dotnet migrate				## Migrates a Preview 2 .NET Core project to a .NET Core SDK 1.0 project
dotnet msbuild				## Builds a project and all of its dependencies
dotnet new					## Creates a new project, configuration file, or solution based on the specified template
dotnet new --help
dotnet new --list        
dotnet new -i Microsoft.DotNet.Web.ItemTemplates::3.1.9  -- Installs a source or a template pack
dotnet new <TEMPLATE>
dotnet nuget delete			## Deletes or unlists a package from the server
dotnet nuget locals			## Clears or lists local NuGet resources
dotnet nuget push			## Pushes a package to the server and publishes it
dotnet pack					## Packs the code into a NuGet package
dotnet publish				## Packs the application and its dependencies into a folder for deployment to a hosting system
dotnet publish --runtime osx-x64
dotnet publish --runtime osx.11-x64
dotnet publish --runtime ubuntu-x64
dotnet publish --runtime ubuntu.16.04-x64
dotnet publish --runtime win-x64
dotnet publish --runtime win10-x64
dotnet publish --runtime win7-x64
dotnet remove package		## Removes package reference from a project file
dotnet remove reference		## Removes project-to-project references
dotnet restore				## Restore using the dotnet CLI
dotnet restore				## Restores the dependencies and tools of a project
dotnet run					## Runs source code without any explicit compile or launch commands
dotnet run --configuration Debug
dotnet run --configuration Release
dotnet sln					## Modifies a .NET Core solution file
dotnet store				## Stores the specified assemblies in the runtime package store
dotnet test					## .NET test driver used to execute unit tests
dotnet tool install			## Installs the specified .NET Core Global Tool on your machine
dotnet tool list			## Lists all .NET Core Global Tools currently installed in the default directory on your machine or in the specified path
dotnet tool uninstall		## Uninstalls the specified .NET Core Global Tool from your machine
dotnet tool update			## Updates the specified .NET Core Global Tool on your machine
dotnet watch run			## Enable hot reloading during development so the app automatically restarts when a file is changed
dotnet workload restore		## Installs workloads needed for a project or a solution
dotnet-vstest				## Runs tests from the specified files
```
