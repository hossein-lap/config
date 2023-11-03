#!/bin/sh

sed \
	-e 's/color_but_left_bg/COLOR_BUT_LEFT_BG/g' \
	-e 's/color_but_right_bg/COLOR_BUT_RIGHT_BG/g' \
	-e 's/color_but_left_fg/COLOR_BUT_LEFT_FG/g' \
	-e 's/color_but_right_fg/COLOR_BUT_RIGHT_FG/g' \
	en-manjaro.sty

sed \
	-e 's/COLOR_BUT_LEFT_BG/color_but_right_bg/g' \
	-e 's/COLOR_BUT_RIGHT_BG/color_but_left_bg/g' \
	-e 's/COLOR_BUT_LEFT_FG/color_but_right_fg/g' \
	-e 's/COLOR_BUT_RIGHT_FG/color_but_left_fg/g' \
	en-manjaro.sty
