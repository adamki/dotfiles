### Re-binding Caps_Lock to CTRL / ESC
The following guide should work. You may need to research the dependcies installation command depending on your distro though.

http://nelsonware.com/blog/2019/04/30/how-to-map-caps-lock-to-escape-and-control-on-fedora-via-caps2esc.html

### Replacing xfwm4 for i3-wm

1. Deactivate default wm(xfwm4):

    * Open `Session and Startup > Current Session`
    * Set `xfwm4`, click `Immediately` and change it to the  `Never` option.
    * For `xfdesktop`, click `Immediately` and change it to the `Never` option.
    * Click `Save Session`

2. Replace XFCE WM for i3:

    * Go to `Session and Startup > Application Autostart`
    * Add an entry with with following:

    ```
    Name: i3 (or whatever you want)
    Description: Tiling Window Manager (or whatever you want)
    Command: i3
    ```

3. Disable non i3 keyboard shortcuts:

* Go to `Keyboard > Application Shortcuts`
* Disable anything that could conflict with your i3-config


---
credit to: http://feeblenerd.blogspot.com/2015/11/pretty-i3-with-xfce.html
