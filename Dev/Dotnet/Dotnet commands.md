# Dotnet commands

https://docs.microsoft.com/ru-ru/dotnet/core/tools/dotnet
----------------------------------------------------------------------------------------------------
dotnet --help                 --- Display help.
dotnet --info                 --- Display .NET Core information.
dotnet --list-sdks            --- Display the installed SDKs.
dotnet --list-runtimes        --- Display the installed runtimes.
----------------------------------------------------------------------------------------------------
// Builds a project and all of its dependencies.
dotnet build
dotnet build [<PROJECT>|<SOLUTION>] [-c|--configuration] [-f|--framework] [--force] [--no-dependencies] [--no-incremental]
  [--no-restore] [-o|--output] [-r|--runtime] [-v|--verbosity] [--version-suffix]
dotnet build [-h|--help]
----------------------------------------------------------------------------------------------------
// Interacts with servers started by a build.
dotnet build-server
dotnet build-server shutdown [--msbuild] [--razor] [--vbcscompiler]
dotnet build-server shutdown [-h|--help]
dotnet build-server [-h|--help]
----------------------------------------------------------------------------------------------------
// Cleans the output of a project.
dotnet clean
dotnet clean [<PROJECT>] [-c|--configuration] [-f|--framework] [-o|--output] [-r|--runtime] [-v|--verbosity]
dotnet clean [-h|--help]
----------------------------------------------------------------------------------------------------
// Shows more detailed documentation online for the specified command.
dotnet help
dotnet help <COMMAND_NAME> [-h|--help]
----------------------------------------------------------------------------------------------------
// Migrates a Preview 2 .NET Core project to a .NET Core SDK 1.0 project.
dotnet migrate
dotnet migrate [<SOLUTION_FILE|PROJECT_DIR>] [--format-report-file-json] [-r|--report-file] [-s|--skip-project-references] 
  [--skip-backup] [-t|--template-file] [-v|--sdk-package-version] [-x|--xproj-file]
dotnet migrate [-h|--help]
----------------------------------------------------------------------------------------------------
// Builds a project and all of its dependencies.
dotnet msbuild
dotnet msbuild <msbuild_arguments> [-h]
----------------------------------------------------------------------------------------------------
// Creates a new project, configuration file, or solution based on the specified template.
dotnet new
dotnet new <TEMPLATE> [--force] [-i|--install] [-lang|--language] [-n|--name] [--nuget-source] [-o|--output]
  [-u|--uninstall] [Template options]
dotnet new <TEMPLATE> [-l|--list] [--type]
dotnet new [-h|--help]
dotnet new --list        
----------------------------------------------------------------------------------------------------
dotnet new --help
dotnet new -i Microsoft.DotNet.Web.ItemTemplates::3.1.9  -- Installs a source or a template pack
----------------------------------------------------------------------------------------------------
// Deletes or unlists a package from the server.
dotnet nuget delete
dotnet nuget delete [<PACKAGE_NAME> <PACKAGE_VERSION>] [--force-english-output] [--interactive] [-k|--api-key] [--no-service-endpoint]
  [--non-interactive] [-s|--source]
dotnet nuget delete [-h|--help]
dotnet nuget locals           --- Clears or lists local NuGet resources.
dotnet nuget locals <CACHE_LOCATION> [(-c|--clear)|(-l|--list)] [--force-english-output]
dotnet nuget locals [-h|--help]
dotnet nuget push             --- Pushes a package to the server and publishes it.
dotnet nuget push [<ROOT>] [-d|--disable-buffering] [--force-english-output] [--interactive] [-k|--api-key] [-n|--no-symbols]
  [--no-service-endpoint] [-s|--source] [-sk|--symbol-api-key] [-ss|--symbol-source] [-t|--timeout]
dotnet nuget push [-h|--help]
----------------------------------------------------------------------------------------------------
// Packs the code into a NuGet package.
dotnet pack
dotnet pack [<PROJECT>] [-c|--configuration] [--force] [--include-source] [--include-symbols] [--no-build] [--no-dependencies]
  [--no-restore] [-o|--output] [--runtime] [-s|--serviceable] [-v|--verbosity] [--version-suffix]
dotnet pack [-h|--help]
----------------------------------------------------------------------------------------------------
// Packs the application and its dependencies into a folder for deployment to a hosting system.
dotnet publish
dotnet publish [<PROJECT>] [-c|--configuration] [-f|--framework] [--force] [--manifest] [--no-build] [--no-dependencies]
  [--no-restore] [-o|--output] [-r|--runtime] [--self-contained] [-v|--verbosity] [--version-suffix]
dotnet publish [-h|--help]
dotnet publish --runtime win7-x64
dotnet publish --runtime win10-x64
dotnet publish --runtime win-x64
dotnet publish --runtime osx.11-x64
dotnet publish --runtime osx-x64
dotnet publish --runtime ubuntu.16.04-x64
dotnet publish --runtime ubuntu-x64
----------------------------------------------------------------------------------------------------
// Restores the dependencies and tools of a project.
dotnet restore
dotnet restore [<ROOT>] [--configfile] [--disable-parallel] [--force] [--ignore-failed-sources] [--no-cache]
  [--no-dependencies] [--packages] [-r|--runtime] [-s|--source] [-v|--verbosity] [--interactive]
dotnet restore [-h|--help]
----------------------------------------------------------------------------------------------------
// Runs source code without any explicit compile or launch commands.
dotnet run
dotnet run [-c|--configuration] [-f|--framework] [--force] [--launch-profile] [--no-build] [--no-dependencies]
  [--no-launch-profile] [--no-restore] [-p|--project] [--runtime] [-v|--verbosity] [[--] [application arguments]]
dotnet run [-h|--help]
dotnet run --configuration Debug
dotnet run --configuration Release
// Enable hot reloading during development so the app automatically restarts when a file is changed
dotnet watch run
----------------------------------------------------------------------------------------------------
// Modifies a .NET Core solution file.
dotnet sln
dotnet sln [<SOLUTION_NAME>] add <PROJECT> <PROJECT> ...
dotnet sln [<SOLUTION_NAME>] add <GLOBBING_PATTERN>
dotnet sln [<SOLUTION_NAME>] remove <PROJECT> <PROJECT> ...
dotnet sln [<SOLUTION_NAME>] remove <GLOBBING_PATTERN>
dotnet sln [<SOLUTION_NAME>] list
dotnet sln [-h|--help]
----------------------------------------------------------------------------------------------------
// Stores the specified assemblies in the runtime package store.
dotnet store
dotnet store -m|--manifest -f|--framework -r|--runtime [--framework-version] [-h|--help] [--output] [--skip-optimization] 
  [--skip-symbols] [-v|--verbosity] [--working-dir]
----------------------------------------------------------------------------------------------------
// .NET test driver used to execute unit tests.
dotnet test
dotnet test [<PROJECT>] [-a|--test-adapter-path] [--blame] [-c|--configuration] [--collect] [-d|--diag] [-f|--framework] [--filter]
  [-l|--logger] [--no-build] [--no-restore] [-o|--output] [-r|--results-directory] [-s|--settings] [-t|--list-tests] 
  [-v|--verbosity] [-- <RunSettings arguments>]
dotnet test [-h|--help]
----------------------------------------------------------------------------------------------------
// Installs the specified .NET Core Global Tool on your machine.
dotnet tool install
dotnet tool install <PACKAGE_NAME> <-g|--global> [--add-source] [--configfile] [--framework] [-v|--verbosity] [--version]
dotnet tool install <PACKAGE_NAME> <--tool-path> [--add-source] [--configfile] [--framework] [-v|--verbosity] [--version]
dotnet tool install <-h|--help>
// Lists all .NET Core Global Tools currently installed in the default 
dotnet tool list
  directory on your machine or in the specified path.
dotnet tool list <-g|--global>
dotnet tool list <--tool-path>
dotnet tool list <-h|--help>
// Uninstalls the specified .NET Core Global Tool from your machine.
dotnet tool uninstall
dotnet tool uninstall <PACKAGE_NAME> <-g|--global>
dotnet tool uninstall <PACKAGE_NAME> <--tool-path>
dotnet tool uninstall <-h|--help>
// Updates the specified .NET Core Global Tool on your machine.
dotnet tool update
dotnet tool update <PACKAGE_NAME> <-g|--global> [--configfile] [--framework] [-v|--verbosity]
dotnet tool update <PACKAGE_NAME> <--tool-path> [--configfile] [--framework] [-v|--verbosity]
dotnet tool update <-h|--help>
----------------------------------------------------------------------------------------------------
// Runs tests from the specified files.
dotnet-vstest
dotnet vstest [<TEST_FILE_NAMES>] [--Settings|/Settings] [--Tests|/Tests] [--TestAdapterPath|/TestAdapterPath]
    [--Platform|/Platform] [--Framework|/Framework] [--Parallel|/Parallel] [--TestCaseFilter|/TestCaseFilter] [--logger|/logger]
    [-lt|--ListTests|/lt|/ListTests] [--ParentProcessId|/ParentProcessId] [--Port|/Port] [--Diag|/Diag] [--Blame|/Blame] [--InIsolation|/InIsolation]
    [[--] <args>...]] [-?|--Help|/?|/Help]
----------------------------------------------------------------------------------------------------
// Script used to install the .NET Core CLI tools and the shared runtime.
dotnet-install.ps1 | dotnet-install.sh
Windows
dotnet-install.ps1 [-Channel] [-Version] [-InstallDir] [-Architecture] [-SharedRuntime] [-Runtime] [-DryRun] 
  [-NoPath] [-Verbose] [-AzureFeed] [-UncachedFeed] [-NoCdn] [-FeedCredential] [-ProxyAddress] 
  [-ProxyUseDefaultCredentials] [-SkipNonVersionedFiles] [-Help]
macOS/Linux
dotnet-install.sh [--channel] [--version] [--install-dir] [--architecture] [--runtime] [--dry-run] [--no-path] 
  [--verbose] [--azure-feed] [--uncached-feed] [--no-cdn] [--feed-credential] [--runtime-id] [--skip-non-versioned-files] [--help]
----------------------------------------------------------------------------------------------------
// Adds project-to-project (P2P) references.
dotnet add reference
dotnet add [<PROJECT>] reference [-f|--framework] <PROJECT_REFERENCES> [-h|--help]
// Lists project-to-project references.
dotnet list reference
dotnet list [<PROJECT>] reference [-h|--help]
// Removes project-to-project references.
dotnet remove reference
dotnet remove [<PROJECT>] reference [-f|--framework] <PROJECT_REFERENCES> [-h|--help]
----------------------------------------------------------------------------------------------------
// Adds a package reference to a project file.
dotnet add package
dotnet add [<PROJECT>] package <PACKAGE_NAME> [-h|--help] [-f|--framework] [--interactive] [-n|--no-restore] 
  [--package-directory] [-s|--source] [-v|--version]
// Lists the package references for a project or solution.
dotnet list package
dotnet list [<PROJECT | SOLUTION>] package [--config] [--framework] [--highest-minor] [--highest-patch] 
   [--include-prerelease] [--include-transitive] [--outdated] [--source]
dotnet list package [-h|--help]
// Removes package reference from a project file.
dotnet remove package
dotnet remove [<PROJECT>] package <PACKAGE_NAME> [-h|--help]
----------------------------------------------------------------------------------------------------
