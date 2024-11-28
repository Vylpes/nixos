#!/bin/bash

option=$(printf "Sleep\nLogout\nShutdown\nRestart" | rofi -dmenu -theme Arc-Dark -font 'hack 18')

if [ "$option" = "Sleep" ];
then
    i3lock-fancy -g -t "System Locked" -f Hack-Regular
    systemctl sleep
elif [ "$option" = "Logout" ];
then
    i3-msg exit
elif [ "$option" = "Shutdown" ];
then
    poweroff
elif [ "$option" = "Restart" ];
then
    reboot
fi
