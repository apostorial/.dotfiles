MIN=10

current=$(brightnessctl get)
max=$(brightnessctl max)
percent=$(( 100 * current / max ))

if [ "$percent" -gt "$MIN" ]; then
    brightnessctl set 5%-
fi

