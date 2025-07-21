if pgrep -x "hyprpicker" > /dev/null; then
  killall hyprpicker
  exit 0
fi

hyprpicker --autocopy