Enable the `no_caps` script:

* Make script executable: `chmod +x ~/dotfiles/no_caps`
* Add `no_caps` script to execute on login in the `Session and Startup > Application Autostart` settings panel

Deactive XFCE's WM:
* Open `Session and Startup > Session`
* For `xfwm4`, click 'Immediately' and change it to the  'Never' option.
* For `xfdesktop`, click 'Immediately' and change it to the 'Never' option.
* Click `Save Session`

Replace XFCE WM for i3:
* Go to `Session and Startup > Application`
* Add an entry with with following:
    ```
    Name: i3 (or whatever you want)
    Description: Tiling Window Manager (or whatever you want)
    Command: i3
    ```

Disable non i3 keyboard shortcuts:
* Go to `Keyboard > Application Shortcuts`
* Disable anything that could conflict with your i3-config

credit to: http://feeblenerd.blogspot.com/2015/11/pretty-i3-with-xfce.html
