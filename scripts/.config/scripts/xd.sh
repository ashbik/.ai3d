xinput | awk '/ELAN0732:00 04F3:2B28/ {print $5}' | awk '{split($0,a,"="); print a[2]}' | xargs xinput disable
