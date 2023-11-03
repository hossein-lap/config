-- Define the `include_files` function
function include_files(elem)
  -- Check if the element is a raw block and contains an include-file tag
    if elem.t == "RawBlock" then
        if elem.format == "markdown" then
            if elem.text:match("<!%-%- include%-file: (.+) %-%->") then
                -- Extract the file path from the tag
                local filepath = elem.text:match("<!%-%- include%-file: (.+) %-%->")
                local f = io.open(filepath, "r") -- Open the included file
                local content = f:read("*a") -- Read the contents of the file
                f:close() -- Close the file handle
                -- Parse the included file as Markdown and return its blocks
                return pandoc.read(content, "markdown").blocks
            end
        end
    else
        -- If the element does not contain an include-file tag,
        -- return nil to indicate no changes were made
        return nil
    end
end

return {
    -- Register the include_files function as a handler for RawBlocks
    { RawBlock = include_files }
}
