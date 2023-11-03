local section_headers = {}
local subsection_headers = {}
local subsubsection_headers = {}

function Header(elem)
	if FORMAT ~= "beamer" then
		print(pandoc.utils.stringify(elem.content))
		if elem.level == 1 then
			local section_text = pandoc.utils.stringify(elem.content)
			if section_headers[section_text] then
				return {}
			else
				section_headers[section_text] = true
			end
		elseif elem.level == 2 then
			local subsection_text = pandoc.utils.stringify(elem.content)
			if subsection_headers[subsection_text] then
				return {}
			else
				subsection_headers[subsection_text] = true
			end
		elseif elem.level == 3 then
			local subsubsection_text = pandoc.utils.stringify(elem.content)
			if subsubsection_headers[subsubsection_text] then
				return {}
			else
				subsubsection_headers[subsubsection_text] = true
			end
		end
	end
end

return {
	{ Header = Header }
}
