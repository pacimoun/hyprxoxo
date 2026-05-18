#!/usr/bin/env sh

roconf="$HOME/.config/rofi/powermenu.rasi"

choice="$(
    printf "󰌾  Lock\n󰍃  Logout\n󰜉  Reboot\n󰐥  Poweroff" |
        rofi \
            -dmenu \
            -i \
            -no-custom \
            -config "$roconf"
)"

case "$choice" in
    *Lock)
        hyprlock
        ;;
    *Logout)
        hyprctl dispatch exit
        ;;
    *Reboot)
        systemctl reboot
        ;;
    *Poweroff)
        systemctl poweroff
        ;;
esac
