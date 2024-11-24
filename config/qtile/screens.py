from libqtile import bar, qtile, widget
from libqtile.config import Screen

import datetime

from variables import colors


def get_screens():
    screens = [
        Screen(
            top=bar.Bar(
                [
                    widget.GroupBox(
                        highlight_method="text",
                        this_current_screen_border=colors[7],
                        hide_unused=True,
                        active=colors[4],
                    ),
                    widget.Prompt(),
                    widget.Spacer(),
                    widget.Countdown(
                        date=datetime.datetime(2024, 12, 21, 0, 0, 0),
                        format="{D} days 🚀",
                    ),
                    widget.Spacer(),
                    widget.Volume(),
                    widget.Sep(foreground=colors[2], padding=4, linewidth=2),
                    widget.Systray(),
                    widget.Clock(format="%H:%M"),
                ],
                24,
            ),
        ),
    ]

    if hasattr(qtile, "screens") and len(qtile.screens) > 1:
        for _ in range(len(qtile.screens) - 1):
            screens.append(
                Screen(
                    top=bar.Bar(
                        [
                            widget.GroupBox(
                                highlight_method="text",
                                this_current_screen_border=colors[7],
                                active=colors[4],
                            ),
                            widget.Prompt(),
                            widget.Spacer(),
                            widget.Countdown(
                                date=datetime.datetime(2024, 12, 21, 0, 0, 0),
                                format="{D} days 🚀",
                            ),
                            widget.Spacer(),
                            widget.Volume(),
                            widget.Sep(foreground=colors[2], padding=4, linewidth=2),
                            widget.Clock(format="%H:%M"),
                        ],
                        24,
                    ),
                )
            )
    return screens
