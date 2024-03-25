# Toolbox reset

- [Back to the Home](../../../README.md)
- [Back to the Dev](../../README.md)
- [Back to the section](README.md)

http://a-kicker-n.blogspot.ru/2010/01/restore-missing-controls-in-visual.html
When I created a Windows forms project, the controls in Toolbox were missing. The usual remedy of right-clicking the Toolbox and then selecting Reset Toolbox did not help.
 C:\Documents and Settings\[User Name]\Local Settings\Application Data\Microsoft\VisualStudio\9.0
 And within this folder are some hidden files. Simply remove the following files:
 "toolbox.tbd", "toolboxIndex.tbd", "toolbox_reset.tbd", "toolboxIndex_reset.tbd"
 Then restart Visual Studio 2008. Your controls should now come back up!

c:\Users\Admin\Local Settings\Application Data\Microsoft\VisualStudio\14.0\

https://social.msdn.microsoft.com/Forums/vstudio/en-US/f8b98421-5d68-4bfa-ab02-5a23b13338fc/visual-studio-2015-toolbox-missing?forum=vssetup
Please open Windows Explorer, and navigate to  <Visual Studio Installation Path>\Common7\IDE (by default is C:\Program Files \Microsoft Visual Studio 14.0\Common7\IDE)
And then run the following commands:
a.devenv.exe /resetskippkgs, it will clear all SkipLoading tags that have been added to VSPackages by users who want to avoid loading problem VSPackages.
b.devenv.exe /resetsettings, it will restore Visual Studio default settings. Optionally resets the settings to the specified .vssettings file.
c.devenv.exe /resetuserdata, it will take a couple of minutes to run as Visual Studio cleans up and sets itself back to its original state. You may open Task Manager at this point to check whether the devenv.exe process is still running. After it has completed running, you can restart Visual Studio.
Besides, if the /uninstall /force doesn't work, please try to use Fix It, it will fix the problems that program cannot be uninstalled, I know VS2015 is not listed there, but someone fixed old VS2015 issue by using this tool so you may give this tool a test. 
If you still cannot remove the RC version totally, I need more information to troubleshoot, please use  http://aka.ms/vscollect  to gather the installation logs. After using it, you will find vslogs.cab from %temp% folder. Please upload the file to https://skydrive.live.com/   and share the link here.
Best Regards, Jiayi Li

Could you press the CTRL+ALT+X key to show the toolbox window?
If you couldn’t open the toolbox window, please try the following steps:
1. Close Visual Studio;
2. Open the “c:\Users\\AppData\Local\Microsoft\VisualStudio\14.0” folder and remove all the .TBD files;
3. Start regedit;
4. Find the “HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\14.0\ToolboxControlsInstaller_AssemblyFoldersExCache” and “HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\14.0\ToolboxControlsInstallerCache” keys;
5. Remove everything from these keys leaving them empty, before you removing it, please remember to back up the keys;
6. Run Visual Studio again and wait until it recreates all items in the toolbox.
If the above doesn’t help, >> The toolbox issue started months ago after I installed the Ajax Control Toolkit and other controls from DevExpress.
Does this issue occur in the RC version?
If it is, to make sure whether it is related to the remained components of RC vesion, please use /uninstall /force to remove the shared components of RC totally.
If the /uninstall /force doesn’t help, To make sure whether it is related to the DevExpress tools, please uninstall them to see whether this issue occur again.
Best Regards, Jiayi Li
