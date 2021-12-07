# Pin the application to the launcher as normal.
# Locate the applications .desktop file which will be in either:
cd /usr/share/applications/
gksudo gedit /usr/share/applications/APPNAME.desktop
# Then change the line
# Exec=APP_COMMAND -> Exec=gksudo -k -u root APP_COMMAND
# Save

