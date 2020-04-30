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
