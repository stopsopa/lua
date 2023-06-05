-- from: https://www.tutorialspoint.com/what-is-the-difference-between-pairs-vs-ipairs-in-lua
-- from: https://stackoverflow.com/a/55109411/5560682
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

u = {}
u["start"] = 'aaaa'
u[1] = "a"
u[3] = "b"
u[2] = "c"
u[2.5] = "two an a half"
u[-1] = "minu one"
u[0] = "zero"
u[4] = "d"
u["aa"] = "zz"
u[7] = "e"
print("ipairs")
for key, value in ipairs(u) do
    print(key, value)
end
print("pairs")
for key, value in pairs(u) do
    print(key, value)
end

-- ipairs
-- 1       a
-- 2       c
-- 3       b
-- 4       d

-- pairs
-- 1       a
-- 2       c
-- 3       b
-- 4       d
-- 0       zero
-- -1      minu one
-- aa      zz
-- 2.5     two an a half
-- 7       e
-- start   aaaa

-- will iterate only through numerical (non numerical will be skipped)
-- gaps in between the indexes lead to halts -> will print only 123 from series 1237
-- numerical values smaller than 1 will be skipped too

-- about ipares:
-- and finding a nil value while iterating is exactly the ending condition for ipairs()

print '---- what about for x in pairs(y):'
for x in pairs(u) do
    print('x: ', x)
end

print '---- misterious pairsByKeys'

function pairsByKeys(t, f)
    local b = {}
    for x in pairs(t) do
        b[#b + 1] = x
    end
    table.sort(b, f)
    local i = 0
    return function()
        i = i + 1
        -- print(inspc({b[i], t[b[i]]}))
        return b[i], t[b[i]] -- I do not understand this line either?
    end
end

local function consistentSort(a, b)
    local at = type(a) == 'number' and a % 1 == 0 and a > 0;
    local bt = type(b) == 'number' and b % 1 == 0 and b > 0;

    -- Compare integers and > 0 values first
    if at and bt then
        return a < b
    end

    -- Numerical indices come before string indices
    if at then
        return true
    elseif bt then
        return false
    end

    -- Sort string indices alphabetically
    return tostring(a) < tostring(b)
end

for key, val in pairsByKeys(u, consistentSort) do
    print('key: >' .. key .. '< val >' .. val .. '<')
end


