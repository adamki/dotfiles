### Setup Misson Control/Spaces switching
1. Disable MacOS auto app/space re-arranging

    System Preferences > Mission Control > Automatically reaarange Spaced Based on most recent use > disable

2. Setup hotkeys to switch between spaces

    System Preferences > Keyboard > Shortcuts > Mission Control

    ```
    Switch to Desktop 1 > option + 1
    Switch to Desktop 2 > option + 2
    Switch to Desktop 3 > option + 3
    Switch to Desktop 4 > option + 4
    ```

### Allow Yabai WM and SKHD to do their thing
1. Configure `brew services` to auto start.

    `brew services start koekeishiya/formulae/yabai`

    `brew services start skhd`