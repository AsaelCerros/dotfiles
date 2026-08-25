#!/usr/bin/env bash
# Live up/down speed from /sys counters (polybar tail=true)
IFACE="${1:-enp42s0}"
RX_FILE="/sys/class/net/$IFACE/statistics/rx_bytes"
TX_FILE="/sys/class/net/$IFACE/statistics/tx_bytes"
[ -r "$RX_FILE" ] || exit 0

RX1=$(cat "$RX_FILE"); TX1=$(cat "$TX_FILE")
sleep 1
RX2=$(cat "$RX_FILE"); TX2=$(cat "$TX_FILE")

fmt() {
  local bps=$(( $2 - $1 ))
  if   (( bps >= 1048576 )); then awk -v b="$bps" 'BEGIN{printf "%.1fMB", b/1048576}'
  elif (( bps >= 1024 ));    then awk -v b="$bps" 'BEGIN{printf "%.0fKB", b/1024}'
  else                            printf '%dB' "$bps"
  fi
}

echo " $(fmt "$RX1" "$RX2")  $(fmt "$TX1" "$TX2")"
