### Re-binding Caps_Lock to CTRL / ESC
The following guide should work. You may need to research the dependcies installation command depending on your distro though.

http://nelsonware.com/blog/2019/04/30/how-to-map-caps-lock-to-escape-and-control-on-fedora-via-caps2esc.html

### Set up SSH

Generate SSH keys: https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

During the steps to add the keys to your ssh-agent, I find that downloading linux `Seahorse` adding the following snippet as an autostart program (EX: `.profile` on HNOME 3.x) works best:
 ```
case "$DESKTOP_SESSION" in
  i3)
    export $(gnome-keyring-daemon --start)
    ;;
  sway)
    export $(gnome-keyring-daemon --start)
    ;;
esac
 ```
