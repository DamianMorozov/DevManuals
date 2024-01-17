# SSMS Dark Theme

## Steps
open as admin cmd
// notepad "C:\Program Files (x86)\Microsoft SQL Server\130\Tools\Binn\ManagementStudio\ssms.pkgundef"
// notepad "C:\Program Files (x86)\Microsoft SQL Server\140\Tools\Binn\ManagementStudio\ssms.pkgundef"
// notepad "C:\Program Files (x86)\Microsoft SQL Server Management Studio 18\Common7\IDE\ssms.pkgundef"
notepad "c:\Program Files (x86)\Microsoft SQL Server Management Studio 19\Common7\IDE\ssms.pkgundef"
Find the string "// Remove Dark theme".
Comment next line.
Run "ssms.exe".
Tools > Options > Environment > General > Color theme > Dark

# SSMS Object Explorer font size
Tools → Options → Environment → Fonts and Colors
Show settings for: Environment
Font: Cascadia Code Extra Light 12
