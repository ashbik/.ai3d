#!/bin/sh
picture=$1
ext="${picture##*.}"
wall="$HOME/.cache/wall.$ext"

# Copying $picture as wall.$ext...
cp $picture $wall

# Ask and set fill type...
ft=$(echo -e "-scale\n-fill\n-center\n-tile\n-max" | dmenu -i -p "Select fill type for $picture")

# Setting $picture as your wallpaper...
 feh --bg$ft $wall &&

# Modifying ~/.xinitrc...
sed -i "s/bg*/bg$ft $wall/g" $HOME/.xinitrc2 &&


# Sending final notification        
notify-send "$picture is now your wallpaper." -t 3000 || 
notify-send "$picture is not a valid filename." -t 3000

