-- http://www.lua.org/pil/4.3.1.html
if op == "+" then
    r = a + b
elseif op == "-" then
    r = a - b
elseif op == "*" then
    r = a * b
elseif op == "/" then
    r = a / b
else
    -- error("invalid operation")
    print('if last else')
end

-- http://www.lua.org/pil/4.3.2.html
local i = 4
while i > 0 do
    print('while:', i)
    i = i - 1
end

-- http://www.lua.org/pil/4.3.3.html
i = 4
repeat
    print('repeat until:', i)
    i = i - 1
until i == 0

-- http://www.lua.org/pil/4.3.4.html
for i = 0, 4, 1 do
    print('for:', i)
end

-- TODO: add also for with function example
-- http://www.lua.org/pil/4.3.5.html
days = {
    [0] = "Sunday",
    "Monday",
    [2] = 'two',
    test = 'val'
}
print('pairs for:')
for i, day in pairs(days) do
    print('>' .. i .. '< >' .. day .. '<')
end
print('ipairs for:')
for i, day in ipairs(days) do
    print('>' .. i .. '< >' .. day .. '<')
end
