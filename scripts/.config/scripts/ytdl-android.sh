#!/bin/sh
url=$1
DES="~/storage/downloads/YouTube/%(title)s.%(ext)s"
echo -e "Please select your quality/format of video/audio.\n============================\n1)Best_Quality\n2)Mid_Quality\n3)Low_Quality\n4)Audio\n============================\n"
read qu

case "$qu" in
        1) youtube-dl -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio --merge-output-format mp4 "$url" -o "$DES";;

        2) youtube-dl -f 22 "$url" -o "$DES";;

        3) youtube-dl -f 135+140 "$url" -o "$DES";;

        4) youtube-dl -x --audio-format mp3 "$url" -o "$DES";;
        
        5) am start -a android.intent.action.VIEW -t video/mpeg -d $(youtube-dl -f best -g $url)
esac
