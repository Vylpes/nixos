#!/usr/bin/env bash

SINK=$(pactl get-default-sink)

if [ $SINK = "alsa_output.pci-0000_1f_00.3.analog-stereo" ]; then
	echo "Speakers"
elif [ $SINK = "alsa_output.usb-C-Media_Electronics_Inc._USB_Audio_Device-00.analog-stereo" ]; then
	echo "Headphones"
else
	echo "-"
fi

