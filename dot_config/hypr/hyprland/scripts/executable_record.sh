VIDEOS_DIR="$HOME/Videos/recordings"
mkdir -p "$VIDEOS_DIR"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
OUTPUT_FILE="$VIDEOS_DIR/recording_audio_$TIMESTAMP.mp4"

if pgrep -x "wf-recorder" > /dev/null; then
	notify-send "Recording stopped"
	pkill -INT -x wf-recorder
	exit 0
fi

if pgrep -x "slurp" > /dev/null; then
	exit 1
fi

REGION=$(slurp)
[ -z "$REGION" ] && exit 1

notify-send "Recording started"
wf-recorder -a -g "$REGION" -f "$OUTPUT_FILE" &>/dev/null
