# i3 Config Documentation

Source config: /home/machinegod/.config/i3/config
i3 version detected: 4.25.1 (i3-gaps features built in)
Theme: "Batman Beyond" — black base with neon-red accents

This folder documents what your i3 setup can do, the keybindings, the
color scheme, and a prioritized list of possible improvements.

Files:
  README.md        - you are here (overview + quick reference)
  keybindings.md   - full table of every keybinding
  color-scheme.md  - the Batman Beyond palette and where it is used
  improvements.md  - gaps, bugs, and recommended changes (prioritized)

## Quick reference

  Mod key  = Super (Windows key)  [$mod = Mod4]

  $mod+Return   open terminal (alacritty)
  $mod+t        open floating kitty
  $mod+d        app launcher (rofi)
  $mod+l        power menu (rofi)
  $mod+q        close focused window
  $mod+1..0     switch to workspace 1..10
  $mod+Shift+1  move window to workspace (and follow)
  $mod+r        enter resize mode (arrows / hjkl, Enter/Esc exits)
  $mod+Shift+c  reload config
  $mod+Shift+r  restart i3
  $mod+Shift+e  exit i3 (with confirm)
  $mod+space    toggle tiling / floating focus
  $mod+f        fullscreen

  Media keys: XF86 volume up/down/mute, XF86 brightness up/down

## What is configured

  - Inner gaps of 20px
  - Dual-monitor layout (DP-4 2560x1440 @180Hz, HDMI-0 1920x1080 @75Hz)
  - Floating drag with $mod held, tiling drag by titlebar
  - 10 named workspaces with switch + move bindings
  - Resize mode for fine window sizing
  - Autostart via dex, network applet, lock-on-suspend via xss-lock+i3lock
  - Wallpaper via feh, compositor via picom, themed notifications via dunst
  - Panel: polybar "Batman Beyond" redesign (Aug 2026) - live CPU/RAM/
    temps/GPU/disk/net-speed stats, Nerd Font icons; see
    ~/.config/polybar/config.ini and improvements.md #12
  - Full Batman Beyond window/border color theme

## Idle / lock policy (updated Aug 2026)

  - Auto-lock: xss-lock fires i3lock after 2h of real input inactivity
    (config lines: `xset s 7200 600`).
  - DPMS is disabled (`xset -dpms`): monitors never blank or power off on idle.
  - Agents mode ($mod+Ctrl+l): toggles auto-lock ON(2h) <-> OFF via
    ~/.config/i3/scripts/toggle-idle.sh. Manual lock via powermenu ($mod+l)
    always works regardless.
  - Locking does NOT stop processes - agents keep running behind i3lock.
    logind has no idle suspend configured; this machine never suspends on its own.

Status legend used in the docs:
  [OK]    working
  [MISS]  referenced binary missing - feature disabled
  [DEAD]  config present but has no effect
