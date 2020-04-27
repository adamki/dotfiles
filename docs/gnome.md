### Enable the `no_caps` script	

Reference the `no_caps` script in the GNOME autostart dir(~/.config/autostart/)


In `.config/autostart/nocaps.desktop` add the following snippet

```
[Desktop Entry]
Type=Application
Exec=/path/to/no_caps
Hidden=false
X-GNOME-Autostart-enabled=true
Name=nocaps
Comment=custom script

```

### Gettings Super + N working
* By default, GNOME 3 hides their default keybindings. Disable the favorite app switching by:

1. Download `dconf-editor`
2. Disable `Hot-keys`

```
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
```

3.Disable default keybindings

```
gsettings set org.gnome.shell.keybindings switch-to-application-1 []
gsettings set org.gnome.shell.keybindings switch-to-application-2 []
gsettings set org.gnome.shell.keybindings switch-to-application-3 []
gsettings set org.gnome.shell.keybindings switch-to-application-4 []
gsettings set org.gnome.shell.keybindings switch-to-application-5 []
gsettings set org.gnome.shell.keybindings switch-to-application-6 []
gsettings set org.gnome.shell.keybindings switch-to-application-7 []
gsettings set org.gnome.shell.keybindings switch-to-application-8 []
gsettings set org.gnome.shell.keybindings switch-to-application-9 []
```



