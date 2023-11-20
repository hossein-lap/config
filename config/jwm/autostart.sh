#!/bin/sh

status=$(acpi -b | awk '{print $3}' | sed 's/[%,]//g')

checkit() {
	if [ -z "$(pidof ${1})" ]; then
		"${@}" &
		sleep 0.05
	fi
}

if [ $status != 'Discharging' ]; then
	checkit nm-applet
	checkit emacs --daemon
	checkit mpd
fi

checkit xcompmgr
checkit dunst
checkit xwallpaper --zoom ${HOME}/.local/share/dwm/background
# checkit dwmblocks
checkit xrate
checkit sxhkd
checkit pipewire
checkit xrdb ~/.Xresources

unset -f checkit
