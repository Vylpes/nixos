#!/bin/bash

option=$(printf "Sleep\nLogout\nShutdown\nRestart" | rofi -dmenu -theme Arc-Dark -font 'hack 18')

if [ "$option" = "Sleep" ];
then
    i3lock-fancy -g -t "System Locked" -f Hack-Regular
    systemctl sleep
elif [ "$option" = "Logout" ];
    i3-msg exit
then
elif [ "$option" = "Shutdown" ];
    poweroff
then
elif [ "$option" = "Restart" ];
    reboot
then
fi
