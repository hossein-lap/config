#!/usr/bin/env bash

function runit {
  if ! pgrep -f $1 ; then
    $@&
  fi
}

function runin() {
    ${@}
}

runit xcompmgr
runit dwmblocks
runit dunst
runit xrdb ~/.Xresources
runit pipewire
# runit nm-applet --no-agent
# runit sxhkd

runin xrate
runin sxiv-wall ~/.local/share/dwm/background.png
# runin randr.sh 2

