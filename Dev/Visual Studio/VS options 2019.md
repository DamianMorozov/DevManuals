# Options Visual Studio 2019

- [Back to the Home](../../../README.md)
- [Back to the Dev](../../README.md)
- [Back to the section](README.md)

https://habr.com/ru/company/microsoft/blog/447124/

## Clean Solution
Projects and Solutions > General
✓ Reopen documents on solution load
✓ Restore Solution Explorer project hierarchy on solution load

## Code Cleanup
Configure Code Cleanup - Ctrl+K, Ctrl+Q
Available fixers move to Included fixers.
Run Code Cleanup - Ctrl+K, Ctrl+E

## IntelliCode
https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.VSIntelliCode

## Clipboard Ring
Ctrl+Shift+V

## Refactoring C#
https://devblogs.microsoft.com/dotnet/visual-studio-2019-net-productivity/
Regex Language Support.
Export editor settings to Editorconfig.
Text Editor > C# > Code Style
  Generate .editorconfig file from settings
Code Fixes and Refactorings.
  Ctrl+.
  Alt+Enter
Foreach loop to LINQ query.
Add missing usings.
Convert anonymous type to class.
Convert local function to method.
More new code fixes and refactorings:
  - Convert tuple to a named-struct.
  - Dead code analysis for unused private members with an optional code fix to remove unused member declaration.
  - Generate a deconstruct method.
  - Add “await” where it is implied, but there is no compiler warning.
Document health indicator.
  Go To Next Issue in File - Alt+PgDn
  Go To Previous Issue in File - Alt+PgUp
Find All References and CodeLens Razor support.
  Shift+F12.
Run tests from Solution Explorer.

## Git pull
Environment > Keyboard
Team.Git.Pull - Ctrl+Shift+P
https://marketplace.visualstudio.com/items?itemName=MadsKristensen.GitPull
Git pull for Solution - Ctrl+K, Ctrl+Z

## Git stash
Team Explorer - Ctrl+\, Ct+M
Changes - Stash
