local lines = {}
local count = 0

-- helper: store output of a command into a varaible
function os.capture(cmd, raw)
	local f = assert(io.popen(cmd, 'r'))
	local s = assert(f:read('*a'))
	f:close()
	if raw then return s end
	s = string.gsub(s, '^%s+', '')
	s = string.gsub(s, '%s+$', '')
	s = string.gsub(s, '[\n\r]+', ' ')
	return s
end

-- just for less typing
function raw_tex(t)
	return pandoc.RawBlock('tex', t)
end

function src_run(code, type)
	local execmd = ''
	local ftexec = {
		python = 'python -c',
		lua = 'lua -e'
	}

--	if ftexec[type] ~= nil then
		execmd = string.format('%s "%s"\n\n', ftexec[type], code)
		lines[count] = execmd
--	end
end

-- Wrap code blocks in tcolorbox environments
function CodeBlock(cb)
	local cbft = cb.classes[1]

	count = count + 1
	print(count, cb.text)
    src_run(cb.text, cbft)

	local codeblockbox = {
--		raw_tex '\\begin{quotation}',
		raw_tex '\\begin{bbox}',
			cb,
		raw_tex '\\end{bbox}',
--		raw_tex '\\end{quotation}',
		raw_tex '\\begin{verbatim}',
            lines[count],
		raw_tex '\\end{verbatim}',
	}
	local codeblock = {
		raw_tex '\\begin{quotation}',
			cb,
		raw_tex '\\end{quotation}',
	}

	-- check if has a src_type
	if cbft then
		return codeblockbox
	else
		return codeblock
	end
end
