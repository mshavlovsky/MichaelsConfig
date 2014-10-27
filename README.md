MichaelsConfig
==============

Configuration files for Linux

	
To export and load gnome terminal color scheme.
1. To export:
    gconftool-2 --dump '/apps/gnome-terminal' > gnome-terminal-conf.xml
2. To load:
    gconftool-2 --load gnome-terminal-conf.xml

Note that this method overwrites all settings. Try running
    gconftool-2 -R '/apps/gnome-terminal'
to see all the settings that will be affected.
