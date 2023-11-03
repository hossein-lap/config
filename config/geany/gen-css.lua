#!/usr/bin/env lua5.4

local pallete = {
	gruvbox = {
		dark = {
			fg = "#f9f5d7",
			green = "#b8bb26",
			blue = "#83a598",
			cyan = "#8ec07c",
			red = "#fb4934",
			orange = "#fe8019",
			yellow = "#fabd2f",
		},
		-- light = {
		-- 	
		-- }
	}
}

local colors = pallete["gruvbox"].dark

local test = {
	error = colors.red,
	context = colors.yellow,
	message = colors.blue
}

local function wcss()
	for key,value in pairs(test) do
		io.write(string.format("#geany-compiler-%s {\n\tcolor: %s;\n}\n\n", key, value))
	end
	io.write(string.format("#geany-terminal-dirty {\n\tcolor: %s;\n}\n", colors.red))
end

wcss()

