--- http://www.lua.org/pil/5.2.html
function inspc(data, i)
    i = i or 0;
    local t = type(data);
    if t == 'table' then
        local buff = '{'
        for k, v in ipairs(data) do
            buff = buff .. '\n' .. string.rep('  ', i + 1) .. '[' .. inspc(k) .. '] : ' .. inspc(v, i + 1)
        end
        return buff .. '\n' .. string.rep('  ', i) .. '}'
    end
    return t .. ' >' .. tostring(data) .. '<'
end

-- starting from Lua 5.2, the arg table was removed
-- function myprint(...)
--     for i, v in ipairs(arg) do
--         print(i, ": >", tostring(v), "<");
--     end
-- end
function myprint(...)
    local args = {...}
    for i, v in ipairs(args) do
        v = tostring(v);
        print(i, ": >", tostring(v), "<")
    end
end

myprint('ab', 'cd', 'ef', 7)

print('--------------- select');
print(string.find("hello hello", " hel")) -- > 6  9
print('select(1, string.find("hello hello", " hel"))', select(1, string.find("hello hello", " hel"))) -- > 6 - NOT TRUE
print('select(2, string.find("hello hello", " hel"))', select(2, string.find("hello hello", " hel"))) -- > 9

function cselect(a, ...)
    return 'custom select>' .. a .. '<'
end
-- no difference to cselect()
function nselect(a) -- you might but don't have to use ... if you are interested only in first arg    
    return 'nselect select>' .. a .. '<'
end
function handle(...)
    local tmp = {...};
    return 'handle:' .. inspc(tmp);
end
function pass(int, ...)
    local tmp = '';
    tmp = tmp .. 'PASS1:' .. handle(int, table.unpack({...})) .. '\n'
    tmp = tmp .. 'PASS2:' .. handle(int, table.unpack({...}), int)
    return tmp
end

print('----- try custom select')
print('cselect:' .. cselect('ab', 'cd', 'ef', 'gh'))
print('nselect:' .. nselect('ab', 'cd', 'ef', 'gh'))
print(handle('ab', 'cd', 'ef', 'gh'))
print(pass(8888, 'ab', 'cd', 'ef', 'gh'))
