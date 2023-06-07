function inspc(data, i, refCounter, visited)
    refCounter = refCounter or 1
    i = i or 0
    visited = visited or {} -- keep track of visited tables

    local t = type(data)
    if t == 'table' then
        -- Check if the current table has been visited before
        if visited[data] then
            return '■■■ ■■■ ■■■ CIRCULAR REFERENCE ■■■ ' .. visited[data] ..
                       ' ■■■ ■■■ ■■■'
        end

        visited[data] = refCounter -- Mark the current table as visited
        refCounter = refCounter + 1;

        local buff = '{'
        for k, v in pairs(data) do
            buff = buff .. '\n' .. string.rep('  ', i + 1) .. '[' .. inspc(k, i + 1, refCounter, visited) .. '] : ' ..
                       inspc(v, i + 1, refCounter, visited)
        end
        visited[data] = nil -- Remove the mark for the current table
        return buff .. '\n' .. string.rep('  ', i) .. '}'
    end
    return t .. ' >' .. tostring(data) .. '<'
end

-- function expandTabs(s, tab)
--     tab = tab or 8 -- tab "size" (default is 8)
--     local corr = 0 -- correction
--     s = string.gsub(s, "()\t", function(p)
--         local sp = tab - ((p - 1 + corr) % tab)
--         corr = corr - 1 + sp
--         return string.rep(" ", sp)
--     end)
--     return s
-- end

-- https://stopsopa.github.io/lua/ebook.pdf page 86
function expandTabs(s, tab)
    tab = tab or 8 -- tab "size" (default is 8)
    local corr = 0 -- correction
    -- correction is needed because we have to remember how many spaces we have added
    -- processing previous tabs
    -- remember that when processing next tabs we are still processing ORIGINAL string
    -- which means we are getting positions of each consecutive tab still in ORIGINAL string
    s = string.gsub(s, "()\t", function(p)
        local c = corr
        local tmp1 = p - 1 + c
        local mod = (tmp1 % tab);
        local howManySpacesAddToCurrentPositionToEvenOutWithNextClosesColumn = tab - mod
        corr = c - 1 + howManySpacesAddToCurrentPositionToEvenOutWithNextClosesColumn
        local cc = corr;
        return string.rep(" ", howManySpacesAddToCurrentPositionToEvenOutWithNextClosesColumn)
        -- return string.rep(" ", howManySpacesAddToCurrentPositionToEvenOutWithNextClosesColumn - 1) .. '|'
    end)
    return s
end
-- my implementations - matching above, but above is smarter
function extendTabz(s, tab)
    tab = tab or 8
    while true do
        local pos = string.find(s, "\t");
        if pos == null then
            break
        end
        pos = pos - 1;
        local mod = pos % tab;
        local spaces = tab - mod
        s = string.sub(s, 0, pos) .. string.rep(" ", spaces) .. string.sub(s, pos + 2)
        -- s = string.sub(s, 0, pos) .. string.rep(".", spaces - 1) .. '|' .. string.sub(s, pos + 2)
    end
    return s
end
function tt(s)
    print('a: >' .. expandTabs(s) .. '<')
    print('b: >' .. extendTabz(s) .. '<')
end
print(tt(''))
print(tt('a'))
print(tt('abcd'))
print(tt('abcdefg'))
print(tt("start\t\tmid\t\tend"))
print(tt("start\t\t\tmid\t\t\tend"))
print(tt("start\t\t\t\tmid\t\tend"))
print(tt("start\t\t\t\tmid\t\t\tend"))

function unexpandTabs(s, tab)
    tab = tab or 8
    s = expandTabs(s, tab)
    local pat = string.rep(".", tab)
    s = string.gsub(s, pat, "%0\1")
    s = string.gsub(s, " +\1", "\t")
    s = string.gsub(s, "\1", "")
    return s
end

print('unexpandTabs: ', unexpandTabs('startjklhkjlhu           mid             end'))