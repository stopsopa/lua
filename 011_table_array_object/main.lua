-- http://www.lua.org/pil/2.5.html
local inspect = require 'inspect'

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


a = {}
k = 'x';
a[k] = 'test';
print('just print', a)
print('inspect', inspect(a))

print('===reference:')
b = a
b['t'] = 'tval'

print(inspect(b))
print(inspect(a))

print('===syntactic sugar:')

a = {}
a['one'] = 'oneval';
a.two = 'twoval';

print(inspect(a))

print('===int key and str key are not the same:');
a = {};
a["10"] = '10string';
a[10] = '10int';
print(inspect(a))

print('===iterating using pairs: (WARNING: ORDER NOT RESPECTED)')
a.three = '3val';
a.four = '4val';
for i, line in pairs(a) do
    print('key type >' .. type(i) .. '<' .. '>' .. i .. '< >' .. line .. '<')
end

print('===nul values will skip iterating over that element')
print('===again:')
a.three = nil;
for i, line in pairs(a) do
    print('key type >' .. type(i) .. '<' .. '>' .. i .. '< >' .. line .. '<')
end

print('==using ipairs DOESNT WORK? ??? ')
for i, line in ipairs(a) do
    print('key type >' .. type(i) .. '<' .. '>' .. i .. '< >' .. line .. '<')
end

print('===create numeric: this will keep the order (WARNING; but only for elements with numerical keys)')
a = {}
a[2] = 'a'
a[1] = 'b'
a['3'] = 'c this will be treated as string'
a['four'] = 'd'
a[4] = 'four'
a['not end'] = nil
a['and this is end'] = 'end..' -- any other than number will be listed in random order, sometimes one way, sometimes another order
for i, line in pairs(a) do
    print('key type >' .. type(i) .. '<' .. '>' .. i .. '< >' .. line .. '<')
end

print('===table_with_holes');
table_with_holes = {
    [1] = "value_1",
    [3] = "value_3"
}

for i, line in pairs(table_with_holes) do
    print('key type >' .. type(i) .. '<' .. '>' .. i .. '< >' .. line .. '<')
end

-- http://www.lua.org/pil/3.6.html
print('===sequences notation (table constructors):')

days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday",}
for i, line in ipairs(days) do
    print('key type >' .. type(i) .. '<' .. '>' .. i .. '< >' .. line .. '<')
end

tab = {math.sin(1), math.sin(2), math.sin(3), math.sin(4), math.sin(5), math.sin(6), math.sin(7), math.sin(8)}
for i, line in ipairs(tab) do
    print('key type >' .. type(i) .. '<' .. '>' .. i .. '< >' .. line .. '<')
end

a = {
    x = 'some x',
    y = 'some y'
}
for i, line in pairs(a) do -- this will print it random, sometimes x first, sometimes y
    print('key type >' .. type(i) .. '<' .. '>' .. i .. '< >' .. line .. '<')
end

print('===linked list');

list = nil
lines = {"line1", "line2", "line3"}
for i = #lines, 1, -1 do
    line = lines[i]
    print(line)
    list = {
        next = list,
        value = line
    }
end

-- -- or provide from stdin
-- for line in io.lines() do
--     print(line)
--     list = {
--         next = list,
--         value = line
--     }
-- end

print('===then we can iterate through linked list:')
l = list
while l do
    print("linked value", l.value)
    l = l.next
end

-- http://www.lua.org/pil/3.6.html#:~:text=between%20square%20brackets
opnames = {
    ["+"] = "add",
    ["-"] = "sub",
    ["*"] = "mul",
    ["/"] = "div",
}
for i, line in pairs(opnames) do
    print('key type >' .. type(i) .. '<' .. '>' .. i .. '< >' .. line .. '<')
end
i = 20;
s = "-"
a = {
    [i + 0] = s,
    [i + 1] = s .. s,
    [i + 2] = s .. s .. s,
}
for i, line in pairs(a) do
    print('key type >' .. type(i) .. '<' .. '>' .. i .. '< >' .. line .. '<')
end

days = {
    [0] = "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
}
print(inspect(days))
for i, line in pairs(days) do
    print('key type >' .. type(i) .. '<' .. '>' .. i .. '< >' .. line .. '<')
end

polyline = {color="blue",
 thickness=2,
 npoints=4,
 {x=0, y=0}, -- polyline[1]
 {x=-10, y=0}, -- polyline[2]
 {x=-10, y=1}, -- polyline[3]
 {x=0, y=1} -- polyline[4]
 }

 print(inspc(polyline))

 print '----- safe navigation'

company = {
    director = {
        address = {
            zipcode = 'kt3 bt4'
        }
    }
}

-- https://stopsopa.github.io/lua/ebook.pdf page 39
E = {}
 zip = (((company or E).director or E).address or E).zipcode

 print('zip: ', zip)
 zip = (((company or E).director2 or E).address or E).zipcode
 print('zip: ', zip)