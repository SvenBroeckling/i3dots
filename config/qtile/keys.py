from libqtile.config import Key
from libqtile.lazy import lazy

from variables import home, mod, terminal


def get_keys():
    return [
        # Custom Keybindings
        Key([mod], "p", lazy.spawn("scrot"), desc="Scrot"),
        Key(
            [mod],
            "d",
            lazy.spawn(f"{home}/.config/rofi/bin/launcher_colorful"),
            desc="Rofi Launcher",
        ),
        Key(
            [mod, "shift"],
            "f",
            lazy.spawn("firefox -P"),
            desc="Firefox Profile Manager",
        ),
        Key(
            [mod, "shift"],
            "d",
            lazy.spawn(""),
            desc="Scrot",
        ),
        Key([mod, "shift"], "s", lazy.spawn("flameshot gui"), desc="Flameshot"),
        Key([mod], "o", lazy.spawn("obsidian"), desc="Obsidian"),
        Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
        Key([mod], "t", lazy.spawn(terminal), desc="Launch terminal"),
        # Focus Keybindings
        Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
        Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
        Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
        Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
        Key([mod], "Tab", lazy.group.next_window(), desc="Next Window"),
        Key(["mod1"], "Tab", lazy.group.next_window(), desc="Next Window"),
        # Shuffling Keybindings
        Key(
            [mod, "shift"],
            "h",
            lazy.layout.shuffle_left(),
            desc="Move window to the left",
        ),
        Key(
            [mod, "shift"],
            "l",
            lazy.layout.shuffle_right(),
            desc="Move window to the right",
        ),
        Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
        Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
        # Resizing Keybindings
        Key(
            [mod, "control"],
            "h",
            lazy.layout.grow_left(),
            desc="Grow window to the left",
        ),
        Key(
            [mod, "control"],
            "l",
            lazy.layout.grow_right(),
            desc="Grow window to the right",
        ),
        Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
        Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
        Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
        Key(
            [mod, "shift"],
            "Return",
            lazy.layout.toggle_split(),
            desc="Toggle between split and unsplit sides of stack",
        ),
        # Toggle between different layouts as defined below
        Key([mod], "w", lazy.next_layout(), desc="Toggle between layouts"),
        Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),
        Key(
            [mod],
            "f",
            lazy.window.toggle_fullscreen(),
            desc="Toggle fullscreen on the focused window",
        ),
        Key(
            [mod],
            "Tab",
            lazy.window.toggle_floating(),
            desc="Toggle floating on the focused window",
        ),
        Key([mod, "shift"], "r", lazy.restart(), desc="Reload the config"),
        Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
        Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
        # Focus next screen
        Key([mod, "shift"], "p", lazy.next_screen(), desc="Focus next screen"),
        # Media Keys
        Key(
            [],
            "XF86AudioRaiseVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"),
        ),
        Key(
            [],
            "XF86AudioLowerVolume",
            lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"),
        ),
        Key(
            [], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")
        ),
    ]
