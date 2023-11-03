--local system = require 'pandoc.system'
local tt = ''
local dirname = os.getenv("PWD")
local outfile = dirname .. '/tangle'

local function file_exists(name)
	local f = io.open(name, 'r')
	if f == nil then
		return false
	else
		io.close(f)
		return true
	end
end

if file_exists(outfile) then
	local file = io.open(outfile, 'w')
		file:close()
end

local i = 0
function CodeBlock(cb)
	local codetype = cb.classes[1]
	if codetype then
		local sep = '\n'
		i = i + 1
--		if i == 1 then
--			sep = '\n\n'
--		end
		tt = tt .. cb.text .. sep

--		print(tt)

		local f = io.open(outfile, 'w')
			f:write(tt)
		f:close()

	end
end
