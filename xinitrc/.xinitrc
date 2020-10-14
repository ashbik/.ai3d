#!/bin/sh
systemctl --user import-environment DISPLAY
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi



############################
##### automate startx ######
############################

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

############################
# start some nice programs #
############################

# Disable Touchscreen
./.config/scripts/xd.sh &

# Start sxhkd
 sxhkd &

#Disable the beep
 xset -b &


#Megasync for automatic Syncing
# megasync &

#Picom Compositor
 picom --config ~/.config/picom.conf &

#Redshift for bluelight removal
 redshift -c ~/.config/redshift.conf &

#Change long press rate
 xset r rate 300 50 &

#Set the Xresources file
 xrdb ~/.Xresources &

#Cbatt icon for battery
 cbatticon -i symbolic &

#Background 
feh --bg-scale $HOME/.cache/wall.jpg

##############################
### wm/de specific setting ###
##############################
# Start dwmbar
# /home/at/.pkg/dwm-bar/dwm_bar.sh &

#dwm loop
#while true; do
#    dwm >/dev/null 2>&1
#done

# Start WM or DE
exec i3

