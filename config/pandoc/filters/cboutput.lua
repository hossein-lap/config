--local system = require 'pandoc.system'
local dirname = os.getenv("PWD")

-- just for less typing
function raw_tex(t)
	return pandoc.RawBlock('tex', t)
end

-- helper: store output of a command into a varaible
function os.capture(cmd, raw)
	local f = assert(io.popen(cmd, 'r'))
	local s = assert(f:read('*a'))
	f:close()
	if raw then return s end
	s = string.gsub(s, '^%s+', '')
	s = string.gsub(s, '%s+$', '')
	-- s = string.gsub(s, '[\n\r]+', ' ')
	return s
end

-- esacpe characters
local function escape(s)
	s = string.gsub(s, '\n', '; ')
	s = string.gsub(s, '"', '\\"')
	-- s = string.gsub(s, "'", "\\'")

	return s
end

local i = 1
local function output(str, lang, symb)
	if symb == nil then
		symb = ''
		-- symb = '##\t'
	end

	local exec = {
		python = string.format([[python -c "%s"]], str),
		lua = string.format([[lua -e "%s"]], str),
		bash = string.format([[bash -c "%s"]], str),
		sh = string.format([[sh -c "%s"]], str),
	}

	local command = ''
	if exec[lang] ~= nil then
		command = string.format([[%s]], exec[lang])
		command = string.format("%s", symb..os.capture(command))
		command = string.gsub(command, '\n', '\n'..symb)
		-- print(command)
	end

	if os.execute(exec[lang]) then
		return command
	else
		return ''
	end

	-- return exec[lang]

	-- return os.capture(string.format([[%s]], exec[lang]))
	---- print(exec[lang], os.execute([[lua -e "print(\"H\")"]]))
end

function CodeBlock(cb)
	local body = cb.text
	local codetype = cb.classes[1]

	if codetype then
		local result = output(escape(body), codetype)
		-- result = string.gsub(result, '\n.', '\n----')
		if result ~= nil then
			return {
				raw_tex '\\begin{quote}',
				cb,
				-- raw_tex '\\end{quote}',
				-- raw_tex '\\begin{quote}',
				raw_tex(string.format('\\begin{lstlisting}\n%s\t', result)),
				-- raw_tex(result),
				raw_tex '\\end{lstlisting}',
				raw_tex '\\end{quote}',
			}
		end
	else
		return {
			raw_tex '\\begin{quote}',
			cb,
			raw_tex '\\end{quote}',
		}
	end
end
