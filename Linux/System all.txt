# --------------------------------------------------------------------------------------------------
# System
sudo apt --fix-broken install
# --------------------------------------------------------------------------------------------------
# Gedit Restore Tabs
# https://github.com/raelgc/gedit-restore-tabs
mkdir -p ~/.local/share/gedit/plugins
cp restoretabs.* ~/.local/share/gedit/plugins/
sudo cp org.gnome.gedit.plugins.restoretabs.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
# Restart Gedit.
# Activate the plugin: go to Edit > Preferences, select Plugins tab and check Restore Tabs entry.
# --------------------------------------------------------------------------------------------------

