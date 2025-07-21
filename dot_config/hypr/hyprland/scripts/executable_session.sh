if pgrep -x "rofi" > /dev/null; then
    killall rofi
    exit 0
fi

OPTIONS="Turn Off\nReboot\nSleep\nLock\nSign Out"

CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -p "Session: " -i)

case "$CHOICE" in
  "Turn Off")
    systemctl poweroff
    ;;
  "Reboot")
    systemctl reboot
    ;;
  "Sleep")
    systemctl suspend
    ;;
  "Lock")
    hyprlock
    ;;
  "Sign Out")
    hyprctl dispatch exit
    ;;
  *)
    exit 0
    ;;
esac
