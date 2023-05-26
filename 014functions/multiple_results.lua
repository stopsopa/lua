-- http://www.lua.org/pil/5.1.html
local inspect = require 'inspect'

print ''

s, e = string.find("hello Lua users", "Lua")
print('returned from string.find("hello Lua users", "Lua") -> s & e', s, e);

function maximum(a)
    local mi = 1 -- maximum index
    local m = a[mi] -- maximum value
    for i, val in ipairs(a) do
        if val > m then
            mi = i
            m = val
        end
    end
    return m, mi
end
print ''

print("maximum({8,10,23,12,5}): m and mi: ", maximum({8, 10, 23, 12, 5})) -- > 23   3

print ''

-- Lua always adjusts the number of results from a function to the circumstances of the call. 
-- When we call a function as a statement, Lua discards all of its results. 
-- When we use a call as an expression, Lua keeps only the first result. 
-- We get all results only when the call is the last (or the only) expression
-- in a list of expressions. These lists appear in four constructions in Lua: 
-- multiple assignment, arguments to function calls, table constructors, 
-- and return statements. To illustrate all these uses, we will assume the 
-- following definitions for the next examples:
print("maximum({8,10,23,12,5}): m and mi BUT PRINT GETS SOMETHING AFTER CALL", maximum({8, 10, 23, 12, 5}), 'END') -- > 23   3

print ''

print('x,y,z = 10,foo2()');
x, y, z = 10, maximum({8, 10, 23, 12, 5})
print('values x y x:', x, y, z)

print ''
print ' - calling maximum NOT AS LAST will return only one value';

print('x,y,z = 10,foo2(), 5');
x, y, z = 10, maximum({8, 10, 23, 12, 5}), 5
print('values x y x:', x, y, z)

function twoStrings()
    return 'a', 'b'
end

print ''
print("twoStrings() .. 'z': ")
print(twoStrings() .. 'z')

print('--- collecting arguments in array')

a = {twoStrings(), 'zz'};
b = {'aa', twoStrings(), twoStrings()};

print(inspect(a))
print(inspect(b))

local unpack = require('table').unpack
-- or implement it in place (but it will be slower because natvie unpack is written in C):

-- function unpack(t, i)
--     i = i or 1
--     if t[i] ~= nil then
--         return t[i], unpack(t, i + 1)
--     end
-- end

function randRet(n)
    n = n or 0;
    if n == 0 then
        return twoStrings()
    end
    if n == 1 then
        return (twoStrings()) -- this will force to return only first argument but inside a function
    end
    if n == 2 then
        return table.unpack {8, 7, 6} -- and this is what I was thinking about
    end
    if n == 3 then
        return unpack {9, 5, 4} -- and this is what I was thinking about
    end
    return 'single_argument';
end

print('randRet(): ', randRet())
print('randRet(4): ', randRet(4))
print 'You can force a call to return exactly one result by enclosing it in an extra pair of parentheses:';
print('(randRet()): ', (randRet()))
print 'and what about this one:'
print('randRet(1): ', randRet(1))
print 'unpack'
print('randRet(2): ', randRet(2))
print('randRet(3): ', randRet(3))


