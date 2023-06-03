#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

##############################################################################
# Start all of our bars here, typically one for each monitor
##############################################################################
#(sleep 2; polybar bar) &
(sleep 2; polybar -c /home/andym/.config/bspwm/polybar/config.ini primary) &
#(sleep 2; polybar -c /home/andym/.config/bspwm/polybar/config.ini secondary) &

# see if we have our second monitor connected, if so launch secondary bar
#if xrandr -q | grep -w connected | grep -q HDMI-1
#then
#	(sleep 2; polybar -c /home/andym/.config/bspwm/polybar/config.ini secondary) &
#fi
