from libqtile import layout, qtile, hook
from libqtile.config import Click, Drag, Match
from libqtile.lazy import lazy

from variables import colors, home, mod
from keys import get_keys
from groups import get_groups
from screens import get_screens


@hook.subscribe.startup_once
def autostart_once():
    qtile.cmd_spawn("nm-applet")
    qtile.cmd_spawn("nextcloud")


@hook.subscribe.startup
def autostart():
    qtile.cmd_spawn("dunst")
    qtile.cmd_spawn(f"wal -i {home}/.wallsplash")
    qtile.cmd_spawn(f"xmodmap {home}/.Xmodmap")


keys = get_keys()
groups = get_groups(keys, mod)
screens = get_screens()

layouts = [
    layout.Bsp(
        border_focus=colors[1],
        border_normal=colors[0],
        border_width=1,
        margin=5,
        margin_on_single=5,
    ),
    layout.Max(border_focus=colors[1], border_normal=colors[0], margin=5),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = False
auto_minimize = True
wl_input_rules = None
wl_xcursor_theme = None
wl_xcursor_size = 24
wmname = "LG3D"
