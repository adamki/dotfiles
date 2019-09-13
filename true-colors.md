Create a file called `xterm-256color-italic.terminfo` in your home dir. Paste the following snippet in the newly created file:
```
# A xterm-256color based TERMINFO that adds the escape sequences for italic.
xterm-256color-italic|xterm with 256 colors and italic,
  sitm=\E[3m, ritm=\E[23m,
  use=xterm-256color,
```
* compile the new color path by running this command: `tic xterm-256color-italic.terminfo`.
* if you using iTerm, enable the new `.terminfo` file by profiles > terminal > Report Terminal Type = xterm-256color-italic
* if you are using Alacritty, enable the new `.terminfo` file by changing the value found at env > TERM

```
awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s s s s s s s s s s s s s s s s;
    for (colnum = 0; colnum<256; colnum++) {
        r = 255-(colnum*255/255);
        g = (colnum*510/255);
        b = (colnum*255/255);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
}'
```

