#!/usr/bin/env sh

roconf="$HOME/.config/rofi/config.rasi"

case "${1:-d}" in
    d)
        rofi -show drun -config "$roconf"
        ;;
    w)
        rofi -show window -config "$roconf"
        ;;
    f)
        rofi -show filebrowser -config "$roconf"
        ;;
    h|--help|-h)
        echo "Usage: rofilaunch.sh d|w|f"
        echo "d : drun mode"
        echo "w : window mode"
        echo "f : filebrowser mode"
        ;;
    *)
        rofi -show drun -config "$roconf"
        ;;
esac
