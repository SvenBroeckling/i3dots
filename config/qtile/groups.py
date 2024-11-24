from libqtile.config import Group, Key
from libqtile.lazy import lazy


def go_to_group(name: str):
    def _inner(qtile):
        qtile.current_screen.set_group(qtile.groups_map[name])

    return _inner


def get_groups(keys, mod):
    groups = [Group(i) for i in "123456789"]

    for i in groups:
        keys.extend(
            [
                Key(
                    [mod],
                    i.name,
                    lazy.function(go_to_group(i.name)),
                    desc="Switch to group {}".format(i.name),
                ),
                Key(
                    [mod, "shift"],
                    i.name,
                    lazy.window.togroup(i.name),
                    desc="move focused window to group {}".format(i.name),
                ),
            ]
        )
    return groups
