#!/bin/bash

case "$1" in
    --toggle)
        # Get the current default sink
        current_sink=$(pactl get-default-sink)
        # Get list of available sinks
        sinks=($(pactl list short sinks | cut -f2))
        
        # Find current sink index
        for i in "${!sinks[@]}"; do
            if [[ "${sinks[$i]}" = "${current_sink}" ]]; then
                current_index=$i
                break
            fi
        done
        
        # Calculate next sink index
        next_index=$(( (current_index + 1) % ${#sinks[@]} ))
        
        # Set the next sink as default
        pactl set-default-sink "${sinks[$next_index]}"
        ;;
    *)
        # Show current audio output
        current_sink=$(pactl get-default-sink)
        sink_name=$(pactl list sinks | grep -A1 "Name: $current_sink" | grep "Description" | cut -d: -f2- | xargs)
        echo " $sink_name"
        ;;
esac
