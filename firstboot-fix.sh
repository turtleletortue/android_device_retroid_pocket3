#!/system/bin/sh

fileexists=1

[ ! -e /data/vendor/local/media/mmi.audio.ctrl ] && fileexists=0

while [ $fileexists = 0 ]; do
    [ -e /data/vendor/local/media/mmi.audio.ctrl ] && [ $fileexists = 0 ] && reboot
done
