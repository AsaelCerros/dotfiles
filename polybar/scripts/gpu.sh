#!/usr/bin/env bash
# GPU util/temp/VRAM via nvidia-smi -> single polybar line (icons are NF glyphs)
out=$(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu,memory.used \
      --format=csv,noheader,nounits 2>/dev/null) || exit 0
IFS=', ' read -r util temp mem <<<"$out"
echo " ${util}% ${temp}°C  ${mem}MiB"
