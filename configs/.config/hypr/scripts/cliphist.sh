#!/usr/bin/env sh

roconf="$HOME/.config/rofi/clipboard.rasi"

case "${1:-}" in
    c)
        cliphist list \
            | rofi -dmenu -p "Copy" -config "$roconf" \
            | cliphist decode \
            | wl-copy
        ;;
    d)
        cliphist list \
            | rofi -dmenu -p "Delete" -config "$roconf" \
            | cliphist delete
        ;;
    w)
        answer="$(printf "Yes\nNo" | rofi -dmenu -p "Clear clipboard?" -config "$roconf")"

        if [ "$answer" = "Yes" ]; then
            cliphist wipe
        fi
        ;;
    *)
        echo "Usage: cliphist.sh c|d|w"
        exit 1
        ;;
esac
