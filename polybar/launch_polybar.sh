
# Terminate already running polybar instances
killall -q polybar

# Wait until the proccesses have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar

polybar status_bar &
#if type "xrandr"; then
#	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#		MONITOR=$m polybar --reload status_bar &
#	done
#else
#	polybar --reload status_bar &
#fi
