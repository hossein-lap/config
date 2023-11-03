local spaces = {} -- stores the number of spaces to be added for each nested level

-- Function to recursively add spaces to a block
function addSpaces(block)
  if block.t == 'Para' or block.t == 'Plain' then
    table.insert(block.content, 1, pandoc.Space())
  elseif block.t == 'Header' then
    table.insert(block.content[#block.content], 1, pandoc.Space())
  elseif block.t == 'BlockQuote' or block.t == 'BulletList' or block.t == 'OrderedList' or block.t == 'DefinitionList' then
    for _, item in ipairs(block.content) do
      for _, subblock in ipairs(item.content) do
        addSpaces(subblock)
      end
    end
  elseif block.t == 'CodeBlock' then
    block.text = ' ' .. block.text
  end
  return block
end

-- Function to process each block and add spaces
function processBlocks(doc)
  -- Process each block in the document
  for _, block in ipairs(doc.blocks) do
    block = addSpaces(block)
  end

  return doc
end

-- Apply the Lua filter to process the blocks
return {
  {Pandoc = processBlocks}
}
