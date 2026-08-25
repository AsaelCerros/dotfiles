#!/usr/bin/env bash
# toggle-idle.sh — alterna el bloqueo automático (modo agentes)
# OFF = los agentes pueden correr horas sin que i3lock salte.
# El bloqueo manual ($mod+l -> lock) sigue funcionando siempre.

FLAG="/tmp/.idle-autolock-off"

if [ -f "$FLAG" ]; then
    rm -f "$FLAG"
    xset s 7200 600
    msg="Autolock: ON (2h)"
else
    touch "$FLAG"
    xset s off
    msg="Autolock: OFF (modo agentes)"
fi

# Notificación: usa el demonio si hay uno; si no, i3-nagbar (siempre presente en i3)
if pgrep -x dunst >/dev/null 2>&1 || pgrep -x mako >/dev/null 2>&1 \
   || pgrep -x xfce4-notifyd >/dev/null 2>&1; then
    notify-send -u low "i3 idle" "$msg"
else
    i3-nagbar -t warning -m "$msg" &
fi
