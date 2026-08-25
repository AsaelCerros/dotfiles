#!/usr/bin/env bash
# Polybar launcher for i3 - one bar per connected monitor.
# Uses xrandr state parsing so disconnected outputs never spawn bars.

killall -q polybar
while pgrep -u "$UID" -x polybar >/dev/null; do sleep 0.5; done

# Resolve the AMD k10temp hwmon dynamically so kernel renumbering cannot break temps
CPU_HWMON=""
for d in /sys/class/hwmon/hwmon*; do
    if [ "$(cat "$d/name" 2>/dev/null)" = "k10temp" ]; then
        CPU_HWMON="$d/temp1_input"
        break
    fi
done
export HWMON_PATH="${CPU_HWMON:-/sys/class/hwmon/hwmon2/temp1_input}"

MONS=$(xrandr --query | awk '/ connected primary/ {print $1; exit} / connected/ {print $1}')
if [ -z "$MONS" ]; then
    echo "polybar launch: no connected monitors found" >&2
    exit 1
fi

for MON in $MONS; do
    echo "Starting polybar on monitor: $MON"
    MONITOR=$MON polybar bar --reload &
done
