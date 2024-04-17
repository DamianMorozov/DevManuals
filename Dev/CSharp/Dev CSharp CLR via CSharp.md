# Dev C# CLR via C#

- [Back to the Home](../../../README.md)
- [Back to the Dev](../../README.md)
- [Back to the section](README.md)

## PowerShell for VS
```
clrver				# Displays CLR versions
clrver -all			# Displays all processes on the machine using the CLR
DumpBin.exe
CorFlags.exe
```

## Compile options
```
JITCompiler
/platform | /platform:x86 | /platform:x64 | /platform:anycpu | /platform:ARM
/optimize
/debug | /debug:pdbonly | /debug:full
/unsafe
CSC.exe - compiler C#
VBC.exe - compiler Visual Basic
AL.exe - assembly linker
DumpBin.exe
CorFlags.exe
NGen.exe
PEVerify.exe
```

## Terms
```
CLR - Common Language Runtime
AD DS - Active Directory Domain Services
IL - Intermediate Language
IL-code = Managed Code
PE - Portable Executable
DEP - Data Execution Prevention
ASLR - Address Space Layout Optimization
JIT - Just In Time
FCL - Framework Class Library
CTS - Common Type System
```

## FCL - Framework Class Library
```
System
System.Data
System.IO
System.Net
System.Runtim.InteropServices
System.Security
System.Text
System.Threading
System.Xml
```
