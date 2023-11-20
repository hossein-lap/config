#!/bin/sh

# File preview handler for lf.

set -C -f
IFS="$(printf '%b_' '\n')"; IFS="${IFS%_}"

image() {
	if [ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ] && command -V ueberzug >/dev/null 2>&1; then
		if [ ! -p "$FIFO_UEBERZUG" ]; then
			echo "Error: $FIFO_UEBERZUG is not a named pipe." >&2
			return 1
		fi
#		if [ -z $WINDOW_ID ]; then
#			IDENTIFIER="PREVIEW"
#		else
#			IDENTIFIER="$WINDOW_ID"
#		fi
		printf '{"action": "add", "identifier": "%s", "x": "%s", "y": "%s", "width": "%s", "height": "%s", "scaler": "contain", "path": "%s"}\n' \
			"$WINDOW_ID" "$4" "$5" "$(($2-1))" "$(($3-1))" "$1" > "$FIFO_UEBERZUG"
	else
		mediainfo "$1"
	fi
}

ifub() {
	[ -n "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ] && command -V ueberzug >/dev/null 2>&1
}

# Note that the cache file name is a function of file information, meaning if
# an image appears in multiple places across the machine, it will not have to
# be regenerated once seen.

case "$(file --dereference --brief --mime-type -- "$1")" in
#case "$(mimetype -Lb -- "$1")" in
	image/*) image "$1" "$2" "$3" "$4" "$5" ;;
	text/html) lynx -width="$4" -display_charset=utf-8 -dump "$1"  ;;
	troff) man ./ "$1" | col -b ;;
	text/* | */xml) bat -n --wrap never --terminal-width "$4" -f "$1" ;;
	text/markdown) bat -n --wrap never --terminal-width "$4" -f "$1" ;;
	text/troff) bat -n --wrap never -l groff --terminal-width "$4" -f "$1" ;;
	application/zip) atool --list -- "$1" ;;
	audio/* | application/octet-stream) mediainfo "$1" || exit 1;;
	video/* )
		CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/lf/thumb.$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$1")" | sha256sum | awk '{print $1}')"
		[ ! -f "$CACHE" ] && ffmpegthumbnailer -i "$1" -o "$CACHE" -s 0
		image "$CACHE" "$2" "$3" "$4" "$5"
		;;
	*/pdf)
		CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/lf/thumb.$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$1")" | sha256sum | awk '{print $1}')"
		[ ! -f "$CACHE.jpg" ] && pdftoppm -jpeg -f 1 -singlefile "$1" "$CACHE"
		image "$CACHE.jpg" "$2" "$3" "$4" "$5"
		;;
	*opendocument*) odt2txt "$1" ;;
	application/pgp-encrypted) gpg -d -- "$1" ;;
esac
exit 1
