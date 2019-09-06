# https://dotnet.microsoft.com/download/dotnet-core
# https://dotnet.microsoft.com/download/linux-package-manager/ubuntu19-04/sdk-current
dotnet --version

# Create new project
mkdir hello-world
cd hello-world
dotnet new console

# Run
dotnet run
dotnet hello-world.dll

# Publish
dotnet publish -c Release -o dist
dotnet publish -c Release -r win-x64 -o dist/win-x64
dotnet publish -c Release -r osx-x64 -o dist/osx-x64
dotnet publish -c Release -r linux-x64 -o dist/linux-x64

# Add package
dotnet add package Microsoft.AspNetCore