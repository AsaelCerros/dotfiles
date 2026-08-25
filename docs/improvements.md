# Possible Improvements

Status tags: [OK] working  [MISS] missing binary - feature off  [DEAD] no effect

## 1. Fix the three missing binaries  [DONE 2026-08-01]
Installed: dex, picom, xss-lock (sudo pacman -S dex picom xss-lock).

Dedup note applied: because dex now reads /etc/xdg/autostart, it launches
picom and nm-applet itself. The i3 config's explicit `exec ... nm-applet`
and `exec_always ... picom` lines were REMOVED to avoid duplicate
processes (picom in particular would otherwise spawn a new instance on
every reload). dex is now the single source of truth for both.

  dex       -> autostart of .desktop apps (now working)
  picom     -> compositor: transparency, blur, shadows for kitty/polybar
  xss-lock  -> triggers i3lock automatically on suspend/lid-close (now working)

## 2. Remove dead i3status refresh  [DONE 2026-08-01]
Removed `$refresh_i3status` and the `&& $refresh_i3status` from the three
volume binds. You use polybar, not i3status, so the SIGUSR1 signal hit
nothing.

## 3. Scratchpad bindings  [DONE 2026-08-01]
  $mod+Shift+minus  move scratchpad
  $mod+minus        scratchpad show

## 4. Workspace back-and-forth  [DONE 2026-08-01]
  $mod+Tab  workspace back_and_forth

## 5. Screenshot bindings  [DONE 2026-08-01]
Installed maim; screenshots save to ~/Pictures/screenshots/.
  $mod+Print        maim -s  (drag to select a region)
  $mod+Shift+Print  maim     (full screen)

## 6. Auto-place apps on workspaces  [DONE 2026-08-01]
  Spotify -> ws3, firefox -> ws2, Thunderbird -> ws4, discord -> ws5
(Adjust the class/regex to match apps you actually use.)

## 7. Harden the xrandr line (LOW/MEDIUM)  [NOT DONE]
`exec_always xrandr ...` re-applies the exact monitor layout on every
reload/restart. Brittle if you dock/undock or change monitors; can flicker
on each reload. Options: guard it, or use a script that checks connected
outputs first, or make it a one-shot exec.

## 8. Outer / smart gaps  [DONE 2026-08-01]
  gaps outer 5
  smart_gaps on

## 9. Tidy the terminal launcher redundancy (LOW)  [NOT DONE]
Both $mod+Return (alacritty) and $mod+t (kitty) open terminals. Intentional
or drop one. If keeping both, consider making kitty default + alacritty
floating.

## 10. Mouse / focus behavior (LOW)  [NOT DONE - left at defaults]
Optional polish available if you want it:
  focus_follows_mouse no ; mouse_warping none

## 11. Lock-screen theme  [DONE 2026-08-01]
Lock screen uses a themed image lock instead of color flags:
  i3lock -i ~/Pictures/wallpapers/i3lock-batman.png --nofork
(image = batsby.png cover-resized to the display; wired through xss-lock
so suspend/lid-close also locks). Matches the black/neon-red look.

## 12. Polybar Batman Beyond redesign  [DONE 2026-08-25]
Full bar rebuild - see ~/.config/polybar/ (synced to dotfiles repo).
  - JetBrainsMono Nerd Font glyphs throughout (no tofu boxes)
  - Stats right side: RAM used/total, CPU %, CPU temp (k10temp hwmon,
    resolved dynamically in launch.sh), GPU util/temp/VRAM (nvidia-smi),
    root fs free space, volume, active audio output, live net speeds
  - Left: rofi launcher glyph + workspaces (active = red chip)
  - Center: focused window title ("Gotham City" when empty)
  - 2px neon-red top border, pure black background
  - Click actions: RAM/CPU -> btop, volume right -> mixer, left-click
    audio output toggles sink, net module tails real /sys counters

## 13. Install pulsemixer for the volume-module right-click  [DONE 2026-08-25]
Installed pulsemixer 1.5.1 (sudo pacman -S pulsemixer). Verified:
`kitty -e pulsemixer` exits 0 and the binary is on PATH for the running
bar's click-right action (no polybar reload was needed).

---
Applied 2026-08-01: #1, #2, #3, #4, #5, #6, #8, #11
Applied 2026-08-25: #12 (polybar redesign), #13 (pulsemixer)
Still open: #7 (xrandr guard), #9 (launcher tidy), #10 (mouse focus)
