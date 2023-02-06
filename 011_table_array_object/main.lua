-- http://www.lua.org/pil/2.5.html
local inspect = require 'inspect'

a = {}
k = 'x';
a[k] = 'test';
print(a)
print(inspect(a))

print('reference:')
b = a
b['t'] = 'tval'

print(inspect(b))
print(inspect(a))

print('syntactic sugar:')

a = {}
a['one'] = 'oneval';
a.two = 'twoval';

print(inspect(a))

print('int key and str key are not the same:');
a = {};
a["10"] = '10string';
a[10] = '10int';
print(inspect(a))

print('iterating using pairs: (WARNING: ORDER NOT RESPECTED)')
a.three = '3val';
a.four = '4val';
for i, line in pairs(a) do
    print('>' .. i .. '< >' .. line .. '<')
end

print('again:')
a.three = nil;
for i, line in pairs(a) do
    print('>' .. i .. '< >' .. line .. '<')
end

print('nul values will skip iterating over that element')
a.three = nil;
for i, line in ipairs(a) do
    print('>' .. i .. '< >' .. line .. '<')
end

print('create numeric: this will keep the order (WARING; but only for elements with numerical keys)')
a = {}
a[2] = 'a'
a[1] = 'b'
a['3'] = 'c'
a['four'] = 'd'
a[4] = 'four'
a['not end'] = nil
a['and this is end'] = 'end..'
for i, line in pairs(a) do
    print('>' .. i .. '< >' .. line .. '<')
end

print('table_with_holes');
table_with_holes = {
    [1] = "value_1",
    [3] = "value_3"
}

for i, line in pairs(table_with_holes) do
    print('>' .. i .. '< >' .. line .. '<')
end

-- http://www.lua.org/pil/3.6.html
print('sequences notation (table constructors):')

days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
for i, line in ipairs(days) do
    print('>' .. i .. '< >' .. line .. '<')
end

tab = {math.sin(1), math.sin(2), math.sin(3), math.sin(4), math.sin(5), math.sin(6), math.sin(7), math.sin(8)}
for i, line in ipairs(tab) do
    print('>' .. i .. '< >' .. line .. '<')
end

a = {
    x = 'some x',
    y = 'some y'
}
for i, line in pairs(a) do
    print('>' .. i .. '< >' .. line .. '<')
end

print('linked list');

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

print('then we can iterat through linked list:')
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
    ["/"] = "div"
}
for i, line in pairs(opnames) do
    print('>' .. i .. '< >' .. line .. '<')
end
i = 20;
s = "-"
a = {
    [i + 0] = s,
    [i + 1] = s .. s,
    [i + 2] = s .. s .. s
}
for i, line in pairs(a) do
    print('>' .. i .. '< >' .. line .. '<')
end

days = {
    [0] = "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
}
for i, line in pairs(days) do
    print('>' .. i .. '< >' .. line .. '<')
end
