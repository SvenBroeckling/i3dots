#!/bin/sh

killall -q polybar

polybar sven 2>&1 | tee -a /tmp/polybar.log & disown

