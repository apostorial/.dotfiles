if pgrep -x "rofi" > /dev/null; then
    killall rofi
    exit 0
fi

OPTIONS="Turn Off\nReboot\nSleep\nLock\nSign Out\nUptime"

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
  "Uptime")
    uptime | awk '{print $1,$2,$3,$4,$5}' | tr -d ',' | wl-copy
    notify-send "Uptime" "$(wl-paste)"
    ;;
  *)
    exit 0
    ;;
esac