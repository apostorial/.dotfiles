if pgrep -f "rofi -show drun" > /dev/null; then
    pkill -f "rofi -show drun"
else
    rofi -show drun -show-icons true
fi
