if pgrep -x "rofi" > /dev/null; then
    killall rofi
    exit 0
fi

cliphist list | awk -F'\t' '{print $2}' | rofi -dmenu -p "Clipboard: " -i | while read -r line; do
    cliphist list | grep -F "$line" | head -n1 | cliphist decode | wl-copy
done