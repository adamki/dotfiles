### Bind Caps_Lock to CTRL/ESC
  * Install [Karabiner-Elements](https://karabiner-elements.pqrs.org/)
  * Add `Complex Modification` as shown below:


    ```
       Change caps_lock to control if pressed with other keys, to escape if pressed alone.
    ```


### Setup Misson Control/Spaces switching
1. Disable MacOS auto app/space re-arranging

    System Preferences > Mission Control > Automatically reaarange Spaced Based on most recent use > disable

2. Setup hotkeys to switch between spaces

    System Preferences > Keyboard > Shortcuts > Mission Control

    ```
      Switch to Desktop 1 > option + 1
      Switch to Desktop 2 > option + 2
      ...
      Switch to Desktop 9 > option + 9
    ```

### Allow Yabai WM and SKHD to do their thing
1. Configure `brew services` to auto start.

  ```
    brew services start koekeishiya/formulae/yabai
    brew services start skhd
  ```
