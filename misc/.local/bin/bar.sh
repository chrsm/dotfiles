#!/bin/bash

# Terminate already running bad instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# need one polybar per monitor, qq
MONITOR=HDMI-0 polybar -r main_bar &
MONITOR=DP-2 polybar -r main_bar &
