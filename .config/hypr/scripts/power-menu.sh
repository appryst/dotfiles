#!/usr/bin/env bash

shutdown=" "
reboot=" "
suspend=""
lock=" "
logout="󰗽 "
uptime="`uptime -p | sed -e 's/up //g'`"

# Get answer from rofi
selected_option=$(echo -e "$shutdown\n$reboot\n$suspend\n$lock\n$logout" | rofi -dmenu -i -p "Uptime: $uptime" -theme ~/.config/rofi/power.rasi)

# Do something based on selected option
case $selected_option in
    "$shutdown")
        systemctl poweroff
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$suspend")
        systemctl suspend
        ;;
    "$lock")
        hyprlock
        ;;
    "$logout")
        hyprctl dispatch exit
        ;;
esac
