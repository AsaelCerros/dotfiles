# Batman Beyond Color Scheme

Defined as variables at the top of the config and applied to window
borders/titlebars. Black base, neon-red accent.

## Palette
| Variable      | Hex       | Purpose            |
|---------------|-----------|--------------------|
| $base         | #000000   | black base / bg    |
| $surface      | #1a1a1a   | dark gray          |
| $overlay      | #262626   | lighter gray       |
| $muted        | #404040   | mid gray           |
| $subtle       | #666666   | light gray         |
| $text         | #ffffff   | text (white)       |
| $love         | #ff0000   | neon red accent    |
| $highlightlow | #0f0f0f   | near black         |
| $highlightmed | #ff3333   | soft red           |
| $highlighthigh| #ff4d4d   | bright red         |

## Window class application
| State             | border  | bg     | text  | indicator | child-border |
|-------------------|---------|--------|-------|-----------|--------------|
| focused           | $love   | $base  | $text | $love     | $love        |
| focused_inactive  | $subtle | $base  | $text | $muted    | $surface     |
| unfocused         | $subtle | $base  | $text | $overlay  | $overlay     |
| urgent            | $love   | $base  | $text | $highlightmed | $love     |
| placeholder       | $base   | $base  | $text | $overlay  | $overlay     |

## Other themed elements
- All windows get a 4px pixel border:  for_window [class=".*"] border pixel 4
- Wallpaper: ~/Pictures/wallpapers/pandemonium.jpg (feh --bg-fill);
  lock screen image: ~/Pictures/wallpapers/i3lock-batman.png
- picom compositor is installed and running (transparency/shadows).
- polybar continues the theme - see next section.

## Polybar application (Aug 2026 redesign)

| Key             | Hex     | Used for                                    |
|-----------------|---------|---------------------------------------------|
| background      | #000000 | bar background                              |
| background-alt  | #1a1a1a | occupied workspace chips                    |
| foreground      | #ffffff | text                                        |
| primary         | #ff003c | accents: icons, active ws chip, top border  |
| secondary       | #ff3333 | window-title icon                           |
| alert           | #ff4d4d | urgent ws chip, temp-warn text              |
| warm            | #ff8c00 | mid temperature ramp icon                   |
| disabled        | #555555 | empty workspaces, muted audio               |

The palette mirrors the i3 $love/$highlightmed/$highlighthigh reds on the
same black base, so window borders, bar and notifications read as one
theme across the desktop.

## Ideas to extend the theme
- Apply the same reds to rofi via its own config/theme files.
- Red-tinted shadow / blur in picom for floating windows.
- Match dunst frames to $love (dunstrc already themed black/red, Aug 2026).
