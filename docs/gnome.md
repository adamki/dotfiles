### Re-binding Caps_Lock to CTRL / ESC
The following guide should work. You may need to research the dependcies installation command depending on your distro though.

http://nelsonware.com/blog/2019/04/30/how-to-map-caps-lock-to-escape-and-control-on-fedora-via-caps2esc.html

### Gettings Super + N working

By default, GNOME 3 hides their default keybindings. Disable the favorite app switching by:

* Download `dconf-editor`
* Disable `Hot-keys`

```
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
```

* Disable default keybindings

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
