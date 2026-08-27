#!/bin/bash
# set-displays.sh — per-output guarded xrandr
#
# Why this exists: plain `xrandr --output DP-4 ... --output HDMI-0 ...` is
# ATOMIC — if any named output is absent (HDMI-0 often unplugged), the whole
# command aborts and even DP-4 never gets its native mode, silently leaving
# everything at 1080p fallback (polybar looks huge).
#
# Here every output is applied independently and skipped safely when absent.

notify_err() {
    # dunst may not be up yet during i3 startup; failure to notify is fine
    notify-send -u critical "xrandr" "$1: failed to set $2 @ ${3}Hz" 2>/dev/null || true
}

apply() {
    local out="$1" mode="$2" rate="$3"
    if xrandr --query | grep -q "^${out} connected"; then
        xrandr --output "$out" --mode "$mode" --rate "$rate" || notify_err "$out" "$mode" "$rate"
    fi
}

apply DP-4   2560x1440  179.88
apply HDMI-0 1920x1080  74.97
