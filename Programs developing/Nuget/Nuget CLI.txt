====================================================================================================
Create a package using the nuget.exe CLI
https://docs.microsoft.com/en-us/nuget/create-packages/creating-a-package
====================================================================================================
1. Sign in at [https://www.nuget.org/].
2. Download available NuGet distribution from [https://www.nuget.org/downloads].
Copy nuget.exe to [C:\Windows\system32].
3. Create a class dll.
4. Fill assembly info.
5. Execute [nuget spec "...\Ptoject.csproj"]. Fill fields.
6. Edit license info in nuspec-file.
7. Rebuild the project.
8. Create the nupkg-file.
[nuget pack] - debug mode
[nuget pack -Prop Configuration=Debug] - debug mode
[nuget pack -Prop Configuration=Release] - release mode
9. Upload the nupkg-file to [https://www.nuget.org/].
---------------------------------------------------------------------------------------------------- 
