#!/bin/sh

xrandr --output "DP-1" --mode "2560x1440"
xrandr --output "HDMI-0" --mode "2560x1440"
xrandr --output "HDMI-0" --auto --output "DP-1" --same-as "HDMI-0"
