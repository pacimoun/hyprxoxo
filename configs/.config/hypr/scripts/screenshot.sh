#!/usr/bin/env sh

set -eu

XDG_PICTURES_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}"

save_dir="${2:-$XDG_PICTURES_DIR/Screenshots}"
save_file="$(date +'%y%m%d_%Hh%Mm%Ss_screenshot.png')"
temp_screenshot="$(mktemp --suffix=.png)"
swpy_dir="$HOME/.config/swappy"
swpy_config="$swpy_dir/config"

trap cleanup EXIT

print_error() {
    cat << EOF
Usage:
    screenshot.sh <action> [save_dir]

Actions:
    p   screenshot all screens
    s   select area
    m   screenshot focused monitor
EOF
}

prepare_swappy() {
    mkdir -p "$save_dir" "$swpy_dir"

    cat > "$swpy_config" << EOF
[Default]
save_dir=$save_dir
save_filename_format=$save_file
EOF
}

notify_saved() {
    final_file="$save_dir/$save_file"

    if [ -f "$final_file" ]; then
        dunstify \
            "Screenshot saved" \
            "$final_file" \
            -a "screenshot" \
            -i "$final_file" \
            -r 91190 \
            -t 2200
    fi
}

copy_to_clipboard() {
    wl-copy < "$temp_screenshot"
}

open_in_swappy() {
    swappy -f "$temp_screenshot"
}

screenshot_all() {
    grim "$temp_screenshot"
}

screenshot_area() {
    geometry="$(slurp)"

    [ -n "$geometry" ] || exit 0

    grim -g "$geometry" "$temp_screenshot"
}

screenshot_focused_monitor() {
    geometry="$(
        hyprctl monitors -j \
            | jq -r '.[] | select(.focused == true) | "\(.x),\(.y) \(.width)x\(.height)"'
    )"

    [ -n "$geometry" ] || {
        dunstify "Screenshot failed" "Could not detect focused monitor" -a "screenshot" -r 91190 -t 2200
        exit 1
    }

    grim -g "$geometry" "$temp_screenshot"
}

prepare_swappy

case "${1:-}" in
    p)
        screenshot_all
        ;;
    s)
        screenshot_area
        ;;
    m)
        screenshot_focused_monitor
        ;;
    *)
        print_error
        exit 1
        ;;
esac

copy_to_clipboard
open_in_swappy
notify_saved
