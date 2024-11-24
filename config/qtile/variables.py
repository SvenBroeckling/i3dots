from pathlib import Path
from libqtile.lazy import lazy

mod = "mod4"
home = Path("~").expanduser()
terminal = "kitty"

colors = []

with open(f"{home}/.cache/wal/colors", "r") as file:
    for _ in range(8):
        colors.append(file.readline().strip())
colors.append("#ffffff")
lazy.reload()
