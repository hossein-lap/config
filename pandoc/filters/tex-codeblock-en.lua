-- just for less typing
function raw_tex(t)
	return pandoc.RawBlock('tex', t)
end

-- Wrap code blocks in tcolorbox environments
function CodeBlock(cb)
	local codeblockbox = {
		raw_tex '\\begin{quotation}',
--		raw_tex '\\begin{bbox}',
			cb,
--		raw_tex '\\end{bbox}',
		raw_tex '\\end{quotation}',
	}
	local codeblock = {
		raw_tex '\\begin{quotation}',
			cb,
		raw_tex '\\end{quotation}',
	}

	-- check if has a src_type
	local cbft = cb.classes[1]
	if cbft then
		return codeblockbox
	else
		return codeblock
	end
end
