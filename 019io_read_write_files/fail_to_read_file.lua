-- https://stopsopa.github.io/lua/ebook.pdf page 53
function inspc(data, i)
    i = i or 0;
    local t = type(data);
    if t == 'table' then
        local buff = '{'
        for k, v in pairs(data) do
            buff = buff .. '\n' .. string.rep('  ', i + 1) .. '[' .. inspc(k) .. '] : ' .. inspc(v, i + 1)
        end
        return buff .. '\n' .. string.rep('  ', i) .. '}'
    end
    return t .. ' >' .. tostring(data) .. '<'
end

function open(filename, mode)
    mode = mode or 'r'
    local f = io.open(filename, mode)
    if f == nil then
        io.stderr:write("Can't open file >" .. filename .. "<")
        os.exit(5)
    end
    return f
end

local filename = 'non_existing'
local f = open(filename)
print(inspc(f))
local t = f:read("a")
f:close()
