-- https://stopsopa.github.io/lua/ebook.pdf page 53
function inspc(data, i, refCounter, visited)
    refCounter = refCounter or 1
    i = i or 0
    visited = visited or {}  -- keep track of visited tables

    local t = type(data)
    if t == 'table' then
        -- Check if the current table has been visited before
        if visited[data] then
            return '■■■ ■■■ ■■■ CIRCULAR REFERENCE ■■■ '..visited[data]..' ■■■ ■■■ ■■■'
        end

        visited[data] = refCounter  -- Mark the current table as visited
        refCounter = refCounter + 1;

        local buff = '{'
        for k, v in pairs(data) do
            buff = buff .. '\n' .. string.rep('  ', i + 1) .. '[' .. inspc(k, i + 1, refCounter, visited) .. '] : ' .. inspc(v, i + 1, refCounter, visited)
        end
        visited[data] = nil  -- Remove the mark for the current table
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
