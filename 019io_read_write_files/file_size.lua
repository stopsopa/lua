function fsize(file)
    local current = file:seek() -- save current position
    local size = file:seek("end") -- get file size
    file:seek("set", current) -- restore position
    return size
end
function open(filename, mode)
    mode = mode or 'r'
    local f = io.open(filename, mode)
    if f == nil then
        io.stderr:write("Can't open file >" .. filename .. "<")
        os.exit(1)
    end
    return f
end

local filename = 'input.txt'
local f = open(filename)
local size = fsize(f);
print('size: ', size)
