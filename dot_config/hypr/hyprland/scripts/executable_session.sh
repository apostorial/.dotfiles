MODE="-dmenu -p Session:"

if pgrep -f "rofi $MODE" > /dev/null; then
    pkill -f "rofi $MODE"
    exit 0
fi

pkill -f "rofi -show drun"
pkill -f "rofi -dmenu -p Clipboard:"

OPTIONS="Turn Off\nReboot\nSleep\nLock\nSign Out"

CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -p "Session: " -i)

case "$CHOICE" in
  "Turn Off") systemctl poweroff ;;
  "Reboot") systemctl reboot ;;
  "Sleep") systemctl suspend ;;
  "Lock") hyprlock ;;
  "Sign Out") hyprctl dispatch exit ;;
  *) exit 0 ;;
esac

