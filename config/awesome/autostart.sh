#!/bin/sh

checkit() {
	if [ -z "$(pidof ${1})" ]; then
		"${@}" &
		# sleep 0.015
	fi
}

# if [ -z "$(pidof dunst)" ]; then
# 	dunst -conf ~/.config/dunst/dunstrc.dwm &
# fi


# xwallpaper --zoom ~/.local/share/dwm/background &
xwallpaper --zoom /home/hos/pictures/wall/pixel/wp9252452-spring-pixel-art-wallpapers.png &
xrate &
xrdb ~/.Xresources &

status=$(acpi -b | awk '{print $3}' | sed 's/[%,]//g')

if [ $status != 'Discharging' ]; then
	checkit nm-applet
	checkit mpd
	# checkit emacs --daemon
	# checkit steam -silent
	# export __NV_PRIME_RENDER_OFFLOAD=1
	# export __GLX_VENDOR_LIBRARY_NAME=nvidia
fi

checkit dunst
checkit xcompmgr
checkit dwmblocks
# checkit slstatus
checkit sxhkd
checkit pipewire
checkit pipewire-pulse
checkit wireplumber

unset -f checkit
