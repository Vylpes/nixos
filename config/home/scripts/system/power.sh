#!/bin/bash

option=$(printf "sleep\nlogout\nshutdown\nrestart" | rofi -dmenu -theme Arc-Dark -font 'hack 18')

if [ "$option" = "sleep" ];
then
    i3lock-fancy -g -t "System Locked" -f Hack-Regular
    systemctl suspend
elif [ "$option" = "logout" ];
then
    i3-msg exit
elif [ "$option" = "shutdown" ];
then
    poweroff
elif [ "$option" = "restart" ];
then
    reboot
fi
