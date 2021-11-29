# How to run GWMI?

--------

Step 1. Install the Windows Terminal from Microsoft Store.

Step 2. Run the Windows Terminal from Start menu.

Step 3. Switch to PowerShell tab.

Step 4. Type the folowing commands:

- View memory info:
`gwmi -query "select FreeVirtualMemory, FreePhysicalMemory, TotalVirtualMemorySize, TotalVisibleMemorySize from Win32_OperatingSystem"`

- View printers info:	
`gwmi -query "select DriverName, PortName, Status, PrinterState, PrinterStatus from Win32_Printer"`

--------

# Screenshots

![](Step_1_Install.png?raw=true)
![](Step_2_Run.png?raw=true)
![](Step_3_Switch_to_PowerShell.png?raw=true)
![](Step_4_Type_the_commands.png?raw=true)
