-- just for less typing
function raw_tex(t)
	return pandoc.RawBlock('tex', t)
end

-- Wrap code blocks in tcolorbox environments
function CodeBlock(cb)
	local codeblock = {
		raw_tex '\\begin{quotation}',
		raw_tex '\\begin{quotation}',
			cb,
		raw_tex '\\end{quotation}',
		raw_tex '\\end{quotation}',
	}

	return codeblock
end
