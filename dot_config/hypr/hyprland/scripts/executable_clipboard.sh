MODE="-dmenu -p Clipboard:"

if pgrep -f "rofi $MODE" > /dev/null; then
    pkill -f "rofi $MODE"
    exit 0
else
    ROFI_MODES=(
      "-show drun"
      "-dmenu -p Session:"
      "-dmenu -p Clipboard:"
    )
    for m in "${ROFI_MODES[@]}"; do
        if [[ "$m" != "$MODE" ]]; then
            pkill -f "rofi $m"
        fi
    done

    cliphist list | awk -F'\t' '{print $2}' | rofi -dmenu -p "Clipboard: " -i | while read -r line; do
        cliphist list | grep -F "$line" | head -n1 | cliphist decode | wl-copy
    done
fi

