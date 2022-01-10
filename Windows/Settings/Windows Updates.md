# Windows Updates

[Stop Windows 11 Automatic Updates](https://www.minitool.com/data-recovery/how-to-stop-windows-11-update.html "minitool.com")


## Way 1. How to Stop Windows 11 Update Temporarily.
Microsoft lets you temporarily pause Windows 11 update for 7 days. You can do this by going to Windows Update screen.
This way can stop Windows 11 update for 7 ways, but after 7 days, Windows will automatically download and install all the pending updates to your computer. If you want to disable updates on Windows 11 forever, you can try other ways below.

1. Press Windows + I or click Start -> Settings to open Windows Settings screen.
2. Click Windows Update in the left panel to access the Windows Update screen. In this screen, you can check updates for Windows 11, view update history, pause updates, join Windows Insider Program, adjust other update settings, etc.
3. You can click the Pause for 1 week button next to the Pause updates option.


## Way 2. How to Stop Windows 11 Auto Update with Windows Services.
To stop automatic updates on Windows 11, you can do it by stopping Windows update services. Check how to do it below.
If you want to turn on Windows 11 automatic updates again, you can go to Windows Services again to enable the Windows update service.

1. Press Windows + R, type services.msc in Run dialog, and press Enter to open Windows Services.
2. Scroll down in the services list and find Windows Update service. Double-click Windows Update service to open its properties window.
3. Under General tab, next to Startup type option, you can click the drop-down icon to select Disabled option.
4. Click Apply and click OK to apply the changes. In this way, it will permanently disable Windows 11 automatic updates.


## Way 3. Turn Off Windows 11 Updates with Registry Editor.
You can also edit the Windows Registry to disable automatic updates on Windows 11. You can check the steps below. But editing a registry can be risky, it’s advised you back up Windows registry first. In case something goes wrong, you can easily restore the registry settings on your computer.

1. Press Windows + R, type regedit.exe in the Run dialog to open Registry Editor on Windows 11.
2. Next, you can navigate to the path in the left panel: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU.
3. Right-click the blank space in the right window and click New -> DWORD (32-bit) Value to create a new value named NoAutoUpdate. Double-click the new value and set its value to 1.
4. Save the change and restart your computer to execute the changes.


## Way 4. Disable Automatic Updates in Windows 11 with Group Policy Editor.
As for how to stop Windows 11 update, you can also use Windows Group Policy Editor to do that.

1. To quickly open Group Policy Editor, you can press Windows + R, type gpedit.msc, and press Enter.
2. Next, you can click as the following: Local Computer Policy > Computer Configuration > Administrative Templates > Windows Components > Windows Update > Manage end user experience.
3. Double-click Configure Automatic Updates in the right window and select the Disabled option to disable Windows 11 updates.


## Way 5. Stop Windows 11 Update by Setting up Metered Connection.
Windows 11 will not automatically download updates under metered connections. You can set up a metered connection on Windows 11 that helps limit the automatic updates of Windows 11. Follow the steps below.

1. Click Start -> Settings to open Windows 11 Settings.
2. Click Network & Internet in the left panel.
3. Click Properties in the right window.
4. Turn the switch on of Metered connection option.
4. Still, click Windows Update in the left panel and click Advanced options in the right window. Also turn off the option “Download updates over metered”.
