MichaelsConfig
==============

# Configuration files for Linux

	
##Exporting and loading gnome terminal color scheme.
Exporting
```
gconftool-2 --dump '/apps/gnome-terminal' > gnome-terminal-conf.xml
```
Loading
```
gconftool-2 --load gnome-terminal-conf.xml
```

Note that this method overwrites all settings. To see what will be affected run
```
gconftool-2 -R '/apps/gnome-terminal'
```
