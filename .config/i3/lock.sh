#!/bin/sh
img="$HOME/.cache/i3lock.png"

scrot $img
# Pixelate image
convert $img -scale 10% -scale 1000% $img
# Blur image
#convert $img -blur 0x4 500% $img
convert $img -gravity center -composite $img
i3lock -i $img

set -e
# xset s off dpms 0 10 0
i3lock -i $img --ignore-empty-password --show-failed-attempts --nofork
# xset s off -dpms
