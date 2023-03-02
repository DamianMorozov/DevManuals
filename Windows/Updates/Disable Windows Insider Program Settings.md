# Disable Windows Insider Program Settings

- [Back to the Home page](../../README.md)
- [Back to the Windows page](../README.md)
- [Back to the README page](README.md)

## Method 1.
Command Prompt: `gpedit`
Open the Local Group Policy Editor and browse to: `Computer Configuration -> Administrative Templates -> Windows Components -> Data Collection and Preview Builds`.
On the right pane, find a policy named `Toggle user control over Insider builds` and then double-click it to modify.

## Method 2.
Command Prompt: `regedit`
Open Registry Editor and navigate to: `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows`.
Right-click on the Windows key in the left pane, and select New -> Key.
Name the new key as `PreviewBuilds`, and then right-click it and select New -> DWORD (32-bit) Value.
Name the DWORD as `AllowBuildPreview`. Leave its value data as `0`.

## Method 3.
Go to url: [Leave the Windows Insider Program](https://insider.windows.com/en-us/leave-program).
Go to `Settings > Update & Security > Windows Insider Program > Stop Insider Preview Builds` to see your options.
