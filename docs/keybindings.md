# Keybindings Reference

Mod key = Super / Windows key ($mod = Mod4)

## Windows & launching
| Binding            | Action                                  | Notes |
|--------------------|-----------------------------------------|-------|
| $mod+Return        | exec alacritty                          | terminal |
| $mod+t             | exec kitty --class "kitty-floating"     | floating kitty |
| $mod+q             | kill                                    | close window |
| $mod+d             | rofi launcher (type-7)                  | app launcher |
| $mod+l             | rofi powermenu (type-6)                 | power menu |
| $mod+Ctrl+l        | toggle-idle.sh                          | agents mode: autolock ON(2h)/OFF |
| $mod+n             | dunstctl history-pop                    | show last notification |
| $mod+Shift+n       | dunstctl close-all                      | dismiss all notifications |

## Focus & movement
| Binding            | Action                                  | Notes |
|--------------------|-----------------------------------------|-------|
| $mod+Left/Down/Up/Right | focus left/down/up/right          | arrow keys |
| $mod+Shift+Left..  | move container left/down/up/right       | relocate window |
| $mod+space         | focus mode_toggle                       | tiling <-> floating |
| $mod+Shift+space   | floating toggle                         | toggle float |

## Layout
| Binding            | Action                                  | Notes |
|--------------------|-----------------------------------------|-------|
| $mod+h             | split h                                 | horizontal split |
| $mod+v             | split v                                 | vertical split |
| $mod+f             | fullscreen toggle                       | |
| $mod+s             | layout stacking                         | |
| $mod+w             | layout tabbed                           | |
| $mod+e             | layout toggle split                     | toggle split dir |

## Workspaces
| Binding            | Action                                  | Notes |
|--------------------|-----------------------------------------|-------|
| $mod+1 .. $mod+0   | workspace 1 .. 10                       | switch |
| $mod+Shift+1 .. 0  | move container to workspace 1..10       | move + follow |

## Resize mode ($mod+r to enter)
| Key (in mode)      | Action                                  | Notes |
|--------------------|-----------------------------------------|-------|
| Left / h           | shrink width 10px or 10ppt              | |
| Right / l          | grow width 10px or 10ppt                | |
| Down / j           | grow height 10px or 10ppt               | |
| Up / k             | shrink height 10px or 10ppt             | |
| Return / Escape / $mod+r | exit resize mode                | |

## Config control
| Binding            | Action                                  | Notes |
|--------------------|-----------------------------------------|-------|
| $mod+Shift+c       | reload                                  | re-read config |
| $mod+Shift+r       | restart                                 | restart i3 |
| $mod+Shift+e       | exit i3 (confirm via nagbar)            | |

## System / media keys (no $mod)
| Key                | Action                                  | Status |
|--------------------|-----------------------------------------|-------|
| XF86AudioRaiseVolume | pactl +5% (sink volume)               | [OK] |
| XF86AudioLowerVolume | pactl -5%                            | [OK] |
| XF86AudioMute      | pactl mute toggle                      | [OK] |
| XF86MonBrightnessDown | brightnessctl set 10%-              | [OK] |
| XF86MonBrightnessUp   | brightnessctl set +10%              | [OK] |

Note: the volume binds also send SIGUSR1 to i3status ($refresh_i3status),
but i3status is not running (you use polybar) - see improvements.md [DEAD].
