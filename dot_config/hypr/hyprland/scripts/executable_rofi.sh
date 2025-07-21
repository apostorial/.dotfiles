MODE="-show drun"

if pgrep -f "rofi $MODE" > /dev/null; then
    pkill -f "rofi $MODE"
    exit 0
fi

pkill -f "rofi -dmenu -p Session:"
pkill -f "rofi -dmenu -p Clipboard:"

rofi -show drun -show-icons true

