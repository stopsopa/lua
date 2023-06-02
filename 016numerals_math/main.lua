-- https://stopsopa.github.io/lua/ebook.pdf :page15
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

print('0.4', 0.4)
print('4.57e-3', 4.57e-3)
print('0.3e12', 0.3e12)
print('5E+20', 5E+20)
-- will print
-- 0.4     0.4
-- 4.57e-3 0.00457
-- 0.3e12  300000000000.0
-- 5E+20   5e+20

print(inspc({
    [0.4] = 0.4,
    [4] = 4,
    [4.0] = 4.0, -- this will dissapear ( or override if you wish) previous value
    [4.57e-3] = 4.57e-3,
    [0.3e12] = 0.3e12,
    [5E+20] = 5E+20
}))
print('0.2e3 == 200::', 0.2e3 == 200 and true or false)
print('-3 == -3.0::', -3 == -3.0 and true or false)
-- will print
-- {
--     [number >300000000000<] : number >300000000000.0<
--     [number >5e+20<] : number >5e+20<
--     [number >0.4<] : number >0.4<
--     [number >0.00457<] : number >0.00457<
-- }

print('math.type(3):', math.type(3))
print('math.type(3.0):', math.type(3.0))

print('---- floor division -----')
print('3 // 2 :', 3 // 2)
print('-9 // 2 :', -9 // 2)

local a = -9;
local b = 2;

print('------ module -----')
-- https://stopsopa.github.io/lua/ebook.pdf :page17
-- The following equation defines the modulo operator:
if a % b == a - ((a // b) * b) then
    print('true')
else
    print('false')
end

print('----- rad to deg <-> deg to rad ----')
-- https://stopsopa.github.io/lua/ebook.pdf :page18
print('math.deg(math.pi * (3/2)): ', math.deg(math.pi * (3/2)))
print('math.deg(math.pi / 2): ', math.deg(math.pi / 2))
print('math.rad(1): ', math.rad (1))
print('math.rad(180): ', math.rad (180))
print('math.pi / 180 == math.rad(1):', math.pi / 180 == math.rad(1))
print('math.pi  == math.rad(180):', math.pi  == math.rad(180))