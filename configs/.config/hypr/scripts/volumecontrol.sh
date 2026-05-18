#!/usr/bin/env sh

set -u

print_error() {
    cat << EOF
Usage:
    volumecontrol.sh -o <action> [step]
    volumecontrol.sh -i <action> [step]

Devices:
    -o    output device / speakers
    -i    input device / microphone

Actions:
    i     increase volume
    d     decrease volume
    m     mute / unmute

Examples:
    volumecontrol.sh -o i
    volumecontrol.sh -o d 10
    volumecontrol.sh -i m
EOF
}

device=""
pamixer_target=""
device_icon=""

while getopts "io" opt; do
    case "$opt" in
        i)
            device="input"
            pamixer_target="--default-source"
            device_icon="mic"
            ;;
        o)
            device="output"
            pamixer_target=""
            device_icon="speaker"
            ;;
        *)
            print_error
            exit 1
            ;;
    esac
done

shift $((OPTIND - 1))

action="${1:-}"
step="${2:-5}"

if [ -z "$device" ] || [ -z "$action" ]; then
    print_error
    exit 1
fi

icon_dir="$HOME/.config/dunst/icons/vol"
notify_id=91190

get_device_name() {
    if [ "$device" = "input" ]; then
        pamixer --list-sources 2>/dev/null \
            | grep "_input." \
            | head -1 \
            | awk -F '" "' '{print $NF}' \
            | sed 's/"//'
    else
        pamixer --get-default-sink 2>/dev/null \
            | awk -F '" "' '{print $NF}' \
            | sed 's/"//'
    fi
}

notify_volume() {
    vol="$(pamixer $pamixer_target --get-volume)"
    rounded="$(( ((vol + 2) / 5) * 5 ))"
    icon="$icon_dir/vol-$rounded.svg"
    name="$(get_device_name)"

    [ -f "$icon" ] || icon="$icon_dir/vol-50.svg"

    dunstify \
        "Volume: ${vol}%" \
        "${name:-$device}" \
        -a "volume" \
        -i "$icon" \
        -r "$notify_id" \
        -t 700
}

notify_mute() {
    muted="$(pamixer $pamixer_target --get-mute)"
    name="$(get_device_name)"

    if [ "$muted" = "true" ]; then
        icon="$icon_dir/muted-$device_icon.svg"
        text="Muted"
    else
        icon="$icon_dir/unmuted-$device_icon.svg"
        text="Unmuted"
    fi

    dunstify \
        "$text" \
        "${name:-$device}" \
        -a "volume" \
        -i "$icon" \
        -r "$notify_id" \
        -t 700
}

case "$action" in
    i)
        pamixer $pamixer_target -i "$step"
        notify_volume
        ;;
    d)
        pamixer $pamixer_target -d "$step"
        notify_volume
        ;;
    m)
        pamixer $pamixer_target -t
        notify_mute
        ;;
    *)
        print_error
        exit 1
        ;;
esac
