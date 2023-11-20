#!/usr/bin/env lua5.4

-- list of fonts {{{
local fonts = {
	WindowStyle = 'Sahel-10:Bold',
	TaskListStyle = 'Sahel-12',
	ClockStyle = 'Ubuntu Mono-14',
	PagerStyle = 'Ubuntu Mono-14',
	MenuStyle = 'Ubuntu Mono-14',
	PopupStyle = 'Ubuntu Mono-14',
}
-- }}}

-- list of themes {{{
local themes = {
	dracula = {
		foreground1  = '#ffffff',
		foreground2  = '#999999',
		background1  = '#1e1f29',
		background2  = '#282a36',
		background3  = '#44475a',
		outline1     = '#000000',
		outline2     = '#ff0000',
		accentcolor1 = '#ff79c6',
		accentcolor2 = '#bd93f9',
		accentcolor3 = '#9082f7',
	},
	onedark = {
		foreground1  = '#fafafa',
		foreground2  = '#abb2bf',
		background1  = '#0e1013',
		background2  = '#1f2329',
		background3  = '#37383d',
		outline1     = '#000000',
		outline2     = '#e55561',
		accentcolor1 = '#4fa6ed',
		accentcolor2 = '#68aee8',
		accentcolor3 = '#8ebd6b',
	},
}
-- }}}

local t = themes.onedark

-- main object {{{
local list = {
	WindowStyle = {
		args = 'decorations="flat"',
		normal = {
			Foreground = t.foreground1,
			Background = t.background3,
			Outline = t.outline1,
			Opacity = 1,
			Font = fonts.WindowStyle,
		},
		active = {
			Foreground = t.foreground1,
			Background = t.background2,
			Outline = t.outline1,
			Opacity = 1,
		},
	},

	ClockStyle = {
		normal = {
			Foreground = t.foreground1,
			Background = t.background1,
			Font = fonts.ClockStyle,
		},
	},

	TrayStyle = {
		args = 'group="true" list="all" decorations="flat"',
		normal = {
			Foreground = t.foreground1,
			Background = t.background1,
			Outline = t.outline1,
			Opacity = 1,
		},
		active = {
			Foreground = t.foreground1,
			Background = t.background2,
			Outline = t.outline2,
			Opacity = 1,
		},
	},

	TaskListStyle = {
		args = 'decorations="flat"',
		normal = {
			Foreground = t.foreground1,
			Background = t.background2,
			Outline = t.outline1,
			Font = fonts.TaskListStyle,
		},
		active = {
			Foreground = t.background2,
			Background = t.accentcolor1,
			Outline = t.outline1,
		},
	},

	TrayButtonStyle = {
		args = 'group="true" list="all" decorations="flat"',
		normal = {
			Foreground = t.foreground1,
			Background = t.background1,
			Outline = t.outline1,
		},
		active = {
			Foreground = t.foreground1,
			Background = t.background2,
			Outline = t.outline2,
		},
	},

	PagerStyle = {
		normal = {
			Foreground = t.accentcolor3,
			Background = t.outline1,
			Outline = t.background1,
			Text = t.foreground1,
			Font = fonts.PagerStyle,
		},
		active = {
			Foreground = t.accentcolor2,
			Background = t.outline1,
		},
	},

	MenuStyle = {
		args = 'decorations="flat"',
		normal = {
			Foreground = t.foreground1,
			Background = t.background1,
			Outline = t.outline1,
			Opacity = 1,
			Font = fonts.MenuStyle,
		},
		active = {
			Foreground = t.foreground1,
			Background = t.background3,
		},
	},

	PopupStyle = {
		args = 'enabled="true" delay="600"',
		normal = {
			Foreground = t.outline1,
			Background = t.foreground2,
			Outline = t.outline1,
			Font = fonts.PopupStyle,
		},
	},

	IconPath = {
		'/usr/share/icons',
		'/usr/share/jwm',
	},
}
-- }}}

local M = {}

function M:IterList(input, file)
	for key, value in pairs(input) do
		if value.args then
			file:write(string.format('<%s %s>\n', key, value.args))
		else
			file:write(string.format('<%s>\n', key))
		end

		if key == 'IconPath' then
			for _,i in ipairs(value) do
				file:write(string.format('</%s>\n', key))
				file:write(i)
				file:write(string.format('<%s>\n', key))
			end
		else
			if type(value) == 'table' then
				for k,v in pairs(value.normal) do
					M:TagPair(k, v, file)
				end
				if value.active then
					file:write(string.format('<%s>\n', "Active"))
					for k,v in pairs(value.active) do
						M:TagPair(k, v, file)
					end
					file:write(string.format('</%s>\n', "Active"))
				end
			end
		end

		file:write(string.format('</%s>\n', key))
	end
end

function M:TagPair(tag, input, file)
	file:write(string.format('<%s>\n', tag))
	if type(input) == 'table' then
		M:IterList(input, file)
	else
		file:write(input, '\n')
		if fonts[tag] then
			M:TagPair("Font", fonts[tag], file)
		end
	end
	file:write(string.format('</%s>\n', tag))
end

local f = io.open('theme.xml', 'w')
f:write('<?xml version="1.0"?>\n')
M:TagPair('JWM', list, f)

