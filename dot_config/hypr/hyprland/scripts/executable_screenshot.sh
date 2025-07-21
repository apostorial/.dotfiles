if pgrep -x "hyprshot" > /dev/null || pgrep -x "grim" > /dev/null || pgrep -x "slurp" > /dev/null; then
  killall hyprshot grim slurp 2>/dev/null
fi

SAVE_DIR="$HOME/Pictures/screenshots"
mkdir -p "$SAVE_DIR"

export HYPRSHOT_DIR="$SAVE_DIR"

while true; do
  TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

  if hyprshot -m region -o "$SAVE_DIR" -f "screenshot-$TIMESTAMP.png" 2>/dev/null; then
    notify-send "Screenshot" "Region captured and copied to clipboard"
  else
    break
  fi

  killall hyprshot grim slurp 2>/dev/null || true
  sleep 0.1
done