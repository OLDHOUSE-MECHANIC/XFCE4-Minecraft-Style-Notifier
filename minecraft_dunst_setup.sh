#!/bin/bash
# Minecraft-style dunst notifications — accurate setup
# Run once from the folder containing minecraft_font.ttf

set -e

# ── 1. Install font ──────────────────────────────────────────────
echo "==> Installing Minecraft font..."
mkdir -p ~/.fonts

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
if [ -f "$SCRIPT_DIR/minecraft_font.ttf" ]; then
    cp "$SCRIPT_DIR/minecraft_font.ttf" ~/.fonts/Minecraft.ttf
    echo "    Copied from script directory."
else
    echo "    ERROR: minecraft_font.ttf not found next to this script!"
    echo "    Put the font file in the same folder as this script and re-run."
    exit 1
fi

fc-cache -f ~/.fonts
echo "    Font registered: $(fc-list | grep -i minecraft | head -1)"

# ── 2. Write dunst config ────────────────────────────────────────
echo "==> Writing dunst config..."
mkdir -p ~/.config/dunst
cat > ~/.config/dunst/dunstrc << 'EOF'
[global]
    ### Display ###
    monitor = 0
    follow = none

    ### Geometry ###
    width = 460
    height = 200
    origin = top-right
    offset = 20, 20
    notification_limit = 5
    gap_size = 8

    ### Padding — tight like Minecraft ###
    padding = 14
    horizontal_padding = 14
    text_icon_padding = 16

    ### Double border = pixel stair corners ###
    frame_width = 3
    frame_color = "#888888"

    ### ZERO corner radius = hard pixel corners ###
    corner_radius = 0

    ### Font ###
    font = Minecraft 11

    ### Text formatting ###
    markup = full
    format = <span size='large'>%s</span>\n<span size='large'>%b</span>
    alignment = left
    vertical_alignment = center
    word_wrap = yes
    ignore_newline = no

    ### Icons — big, left side ###
    icon_position = left
    min_icon_size = 52
    max_icon_size = 52

    ### Misc ###
    show_indicators = no
    mouse_left_click = close_current
    mouse_right_click = close_all
    separator_height = 0

[urgency_low]
    # Advancement Made! — subtle grey border
    background = "#1a1a1a"
    foreground = "#ffffff"
    highlight = "#ffaa00"
    frame_color = "#666666"
    timeout = 5

[urgency_normal]
    # Achievement get! — bright grey border
    background = "#1a1a1a"
    foreground = "#ffffff"
    highlight = "#ffaa00"
    frame_color = "#999999"
    timeout = 7

[urgency_critical]
    # Goal Reached! — red border for urgent
    background = "#1a1a1a"
    foreground = "#ffffff"
    highlight = "#ffdd00"
    frame_color = "#cc2200"
    timeout = 0

EOF

echo "==> Config written."

# ── 3. Restart dunst ─────────────────────────────────────────────
echo "==> Restarting dunst..."
pkill dunst 2>/dev/null || true
sleep 0.5
dunst &
sleep 1

# ── 4. Fire test notifications ───────────────────────────────────
echo "==> Sending test notifications..."
notify-send -u low      "Advancement Made!" "The End?"
sleep 1.5
notify-send -u normal   "Achievement get!"  "Getting Wood"
sleep 1.5
notify-send -u critical "Goal Reached!"     "Zombie Doctor"

echo ""
echo "All done! Three test notifications sent."
echo ""
echo "Usage:"
echo "  notify-send -u low      'Advancement Made!' 'your message'"
echo "  notify-send -u normal   'Achievement get!'  'your message'"
echo "  notify-send -u critical 'Goal Reached!'     'your message'"
