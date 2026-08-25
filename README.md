# dotfiles

Personal Arch Linux + i3wm setup — "Batman Beyond" theme (black base,
neon-red accents).

## Layout

    i3/
      config                  i3 config (gaps, binds, autostart, idle policy)
      scripts/
        improve_tilling.py    tiling helper
        toggle-idle.sh        agents mode: auto-lock ON(2h) <-> OFF
    polybar/
      config.ini              Batman Beyond bar (stats + Nerd Font icons)
      launch.sh               per-monitor launcher, resolves k10temp hwmon
      scripts/
        gpu.sh                nvidia-smi util/temp/VRAM line
        net-speed.sh          live rx/tx speeds from /sys counters
        audio-output-switcher.sh  show / cycle default PulseAudio sink
    docs/
      README.md               overview + quick reference
      keybindings.md          every binding, table form
      color-scheme.md         palette + where each color is applied
      improvements.md         status-tagged improvement log ([DONE]/[NOT DONE])

## What you get

- i3 4.25 (gaps built in): 20px inner gaps, smart gaps, scratchpad,
  back-and-forth workspaces, maim screenshot binds, dual-monitor layout.
- Idle policy: auto-lock via xss-lock -> i3lock (themed image) after 2h;
  DPMS disabled so monitors never blank; $mod+Ctrl+l toggles agents mode.
- polybar: CPU/RAM/temps/GPU/disk/net-speed stats with click actions,
  workspace chips, focused-window title, per-monitor launch.
- dex autostart (single source of truth for picom + nm-applet), dunst
  notifications themed to match.

## Install

Symlink or copy into your home:

    ln -sf "$PWD/i3/config"            ~/.config/i3/config
    mkdir -p ~/.config/i3/scripts && cp i3/scripts/*.sh ~/.config/i3/scripts/
    ln -sf "$PWD/polybar/config.ini"   ~/.config/polybar/config.ini
    ln -sf "$PWD/polybar/launch.sh"    ~/.config/polybar/launch.sh
    mkdir -p ~/.config/polybar/scripts && cp polybar/scripts/*.sh \
        ~/.config/polybar/scripts/

Dependencies: i3, polybar, picom, dex, xss-lock, i3lock, dunst, rofi,
feh, maim, kitty, btop, JetBrainsMono Nerd Font. Optional: nvidia-smi
(GPU module), pulsemixer (volume-module right-click mixer).

From https://github.com/AsaelCerros/dotfiles
