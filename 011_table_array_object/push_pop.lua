
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

-- https://stopsopa.github.io/lua/ebook.pdf page 37 and 39

a = {}
a[#a + 1] = 'a'
a[#a + 1] = 'b'
a[#a + 1] = 'c'
table.insert(a, 'end') -- table.insert(a, 'end') is the same as a[#a + 1] = 'end'
-- but there is also table.insert(a, 2, 'end') - it will put 'end' string in index 2 and other will be moved "up"

print(inspc(a))
print('len before remove: ', #a)
a[2] = nil
print(inspc(a))
print('len after remove: ', #a)
a[20] = 'something'
print('len after adding key 20: ', #a)
print '------------- table.remove(x) ---------'
-- https://stopsopa.github.io/lua/ebook.pdf page 40
print(inspc(a))
table.remove(a) -- that's actually interesting: I would expect it will remove index 20 but it have removed index 4
print(inspc(a))

