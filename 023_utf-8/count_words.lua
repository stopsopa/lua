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

function lpad(str, len, char)
    str = tostring(str)
    local res = string.rep(char or ' ', len - #str) .. str

    return res, res ~= str
end

-- pad the right side
function rpad(str, len, char)
    str = tostring(str)
    local res = str .. string.rep(char or ' ', len - #str)

    return res, res ~= str
end

-- https://stopsopa.github.io/lua/ebook.pdf page 90
local counter = {}

for line in io.lines() do
    for word in string.gmatch(line, "%w+") do
        counter[word] = (counter[word] or 0) + 1
    end
end

local words = {} -- list of all words found in the text

for w in pairs(counter) do
    words[#words + 1] = w
end

-- https://stopsopa.github.io/lua/ebook.pdf page 90
table.sort(words, function(w1, w2)
    return counter[w1] > counter[w2] or (counter[w1] == counter[w2] and w1 < w2)
end)

-- number of words to print
local n = math.min(tonumber(arg[1]) or math.huge, #words)

local longestwordlen = 0
for i = 1, n do
    local w = words[i];
    if w and #w > longestwordlen then
        longestwordlen = #w
    end
end

for i = 1, n do
    io.write(lpad(i, 5, '.'), ': ', rpad(words[i], longestwordlen + 1), counter[words[i]], "\n")
end
