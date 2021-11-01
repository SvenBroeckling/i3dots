#! /usr/bin/env python
from pi3bar.app import Pi3Bar
from pi3bar.plugins import *


Pi3Bar(
        #IMAPUnread('example.com', 'mail@example.com', on_click={1: 'claws-mail'}),
        #NetIFace('enp4s0', on_click={1: 'wicd-client -n'}),  # requires netifaces
        NetIFace('wlp0s20f3', on_click={1: 'wicd-client -n'}),  # requires netifaces
        Disk('/', on_click={1: 'thunar'}),
        #Uname(),
        LoadAvg(on_click={1: 'xterm -e htop'}),
        #Uptime(),
        Battery(),
        Clock(),
).run()
