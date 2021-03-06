#!/bin/bash
input=$(echo -e  "typing.com\nmessenger.com\ngmail.com\nyoutube.com\nreddit.com\nquora.com\nhangouts.google.com\nmail.live.com\n192.168.0.1\n" | dmenu -i)
site=$(echo $input | awk '{print $1}')
term=$(echo $input| cut -d" " -f2-)
case $site in
        a) surf  "https://wiki.archlinux.org/index.php?search=$(echo $term)";;
        d) surf  "https://duckduckgo.com/?q=$(echo $term)";;
        g) surf  "https://google.com/search?q=$(echo $term)";;
        y) firefox --private-window  "https://www.youtube.com/results?search_query=$(echo $term)";;
        *) surf  "$input";;
esac
