#!/usr/bin/env lua5.4

-- scheme list {{{
local list = {

	dracula = {
		color0 = "#21222c",
		color1 = "#ff5555",
		color2 = "#50fa7b",
		color3 = "#f1fa8c",
		color4 = "#bd93f9",
		color5 = "#ff79c6",
		color6 = "#8be9fd",
		color7 = "#bbbbbb",
		color8 = "#6272a4",
		color9 = "#ff6e6e",
		color10 = "#69ff94",
		color11 = "#ffffa5",
		color12 = "#d6acff",
		color13 = "#ff92df",
		color14 = "#a4ffff",
		color15 = "#ffffff",
	},

	solarized = {
		color0 = "#073642",
		color1 = "#dc322f",
		color2 = "#859900",
		color3 = "#b58900",
		color4 = "#268bd2",
		color5 = "#d33682",
		color6 = "#2aa198",
		color7 = "#eee8d5",
		color8 = "#002b36",
		color9 = "#cb4b16",
		color10 = "#586e75",
		color11 = "#657b83",
		color12 = "#839496",
		color13 = "#6c71c4",
		color14 = "#93a1a1",
		color15 = "#fdf6e3",
	},

	tango = {
		color0 = "#cc0000",
		color1 = "#2e3436",
		color2 = "#4e9a06",
		color3 = "#c4a000",
		color4 = "#3465a4",
		color5 = "#75507b",
		color6 = "#06989a",
		color7 = "#d3d7cf",
		color8 = "#555753",
		color9 = "#ef2929",
		color10 = "#8ae234",
		color11 = "#fce94f",
		color12 = "#729fcf",
		color13 = "#ad7fa8",
		color14 = "#34e2e2",
		color15 = "#eeeeec",
	},

	breeze = {
		color0 = "#232627",
		color1 = "#ed1515",
		color2 = "#11d116",
		color3 = "#f67400",
		color4 = "#1d99f3",
		color5 = "#9b59b6",
		color6 = "#1abc9c",
		color7 = "#fcfcfc",
		color8 = "#7f8c8d",
		color9 = "#c0392b",
		color10 = "#1cdc9a",
		color11 = "#fdbc4b",
		color12 = "#3daee9",
		color13 = "#8e44ad",
		color14 = "#16a085",
		color15 = "#ffffff",
	},

	vscode = {
		color0 = "#000000",
		color1 = "#cd3131",
		color2 = "#0dbc79",
		color3 = "#e5e510",
		color4 = "#2472c8",
		color5 = "#bc3fbc",
		color6 = "#11a8cd",
		color7 = "#e5e5e5",
		color8 = "#666666",
		color9 = "#f14c4c",
		color10 = "#50fa7b",
		color11 = "#f1fa8c",
		color12 = "#3b8eea",
		color13 = "#d670d6",
		color14 = "#29b8db",
		color15 = "#e5e5e5",
	},

	onedark = {
		color0 = "#0e1013",
		color1 = "#e55561",
		color2 = "#8ebd6b",
		color3 = "#e2b86b",
		color4 = "#4fa6ed",
		color5 = "#bf68d9",
		color6 = "#48b0bd",
		color7 = "#abb2bf",
		color8 = "#37383d",
		color9 = "#e16d77",
		color10 = "#99bc80",
		color11 = "#dfbe81",
		color12 = "#68aee8",
		color13 = "#c27fd7",
		color14 = "#5fafb9",
		color15 = "#fafafa",
	},

	ayu = {
		color0 = "#01060e",
		color1 = "#ea6c73",
		color2 = "#c2d94c",
		color3 = "#f9af4f",
		color4 = "#53bdfa",
		color5 = "#fae994",
		color6 = "#90e1c6",
		color7 = "#c7c7c7",
		color8 = "#11121d",
		color9 = "#f07178",
		color10 = "#c2d94c",
		color11 = "#ffb454",
		color12 = "#59c2ff",
		color13 = "#ffee99",
		color14 = "#95e6cb",
		color15 = "#ffffff",
	},

	hybrid = {
		color0 = "#282A2E",
		color1 = "#A54242",
		color2 = "#8C9440",
		color3 = "#DE935F",
		color4 = "#5F819D",
		color5 = "#85678F",
		color6 = "#5E8D87",
		color7 = "#707880",
		color8 = "#373B41",
		color9 = "#CC6666",
		color10 = "#B5BD68",
		color11 = "#F0C674",
		color12 = "#81A2BE",
		color13 = "#B294BB",
		color14 = "#8ABEB7",
		color15 = "#C5C8C6",
	},

	nord = {
		color0 = "#373e4d",
		color1 = "#94545d",
		color2 = "#809575",
		color3 = "#b29e75",
		color4 = "#68809a",
		color5 = "#8c738c",
		color6 = "#6d96a5",
		color7 = "#aeb3bb",
		color8 = "#3b4252",
		color9 = "#bf616a",
		color10 = "#a3be8c",
		color11 = "#ebcb8b",
		color12 = "#81a1c1",
		color13 = "#b48ead",
		color14 = "#88c0d0",
		color15 = "#e5e9f0",
	},

	gruvbox = {
		color0 = "#282828",
		color1 = "#cc241d",
		color2 = "#98971a",
		color3 = "#d79921",
		color4 = "#458588",
		color5 = "#b16286",
		color6 = "#689d6a",
		color7 = "#a89984",
		color8 = "#928374",
		color9 = "#fb4934",
		color10 = "#b8bb26",
		color11 = "#fabd2f",
		color12 = "#83a598",
		color13 = "#d3869b",
		color14 = "#8ec07c",
		color15 = "#ebdbb2",
	},

	termite = {
		color0 = "#232323",
		color1 = "#FF0000",
		color2 = "#76B639",
		color3 = "#E1A126",
		color4 = "#289CD5",
		color5 = "#FF2491",
		color6 = "#0A9B81",
		color7 = "#EBEBEB",
		color8 = "#000000",
		color9 = "#FF0000",
		color10 = "#97D01A",
		color11 = "#FFA800",
		color12 = "#16B1FB",
		color13 = "#FF2491",
		color14 = "#0FDCB6",
		color15 = "#F8F8F8",
	}
}

-- }}}
local apps = {
	"dmenu",
	"dwm",
	"sent",
	"slock",
	"st",
	"tabbed",
}

local with_bg = true

for _, app in ipairs(apps) do
	for name, key in pairs(list) do
		local f = io.open(app..'/'..name, "w")
		f:write('! '..name, '\n')
		for label, value in pairs(key) do
			local color = string.format('%s*%s: %s', app, label, value)
			local dot_color = string.format('%s*.%s: %s', app, label, value)
			f:write(color, '\n')
			f:write(dot_color, '\n')
		end
		if with_bg then
			local custom = {
				string.format('%s*background: %s', app, key.color0),
				string.format('%s*.background: %s', app, key.color0),
				string.format('%s*foreground: %s', app, key.color15),
				string.format('%s*.foreground: %s', app, key.color15),
			}
			for _, value in ipairs(custom) do
				f:write(value, '\n')
			end
		else
			local custom = {
				string.format('%s*background: %s', app, '#000000'),
				string.format('%s*.background: %s', app, '#000000'),
			}
			for _, value in ipairs(custom) do
				f:write(value, '\n')
			end
		end
		f:close()
	end
end


