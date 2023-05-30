function inspect(data, i)
    i = i or 0;
    local t = type(data);
    local _ = string.rep('  ', i)
    if t == 'table' then
        local __ = string.rep('  ', i + 1)
        local buff = '{'
        for k, v in ipairs(data) do
            buff = buff .. '\n' .. __ .. '[' .. inspect(k) .. '] ' .. inspect(v, i + 1)
        end
        return buff .. '\n' .. _ .. '}'
    end
    return t .. ' >' .. data .. '<'
end

print(inspect('abc'))
print(inspect({'ab', 'cd', 'ef', 6, {'tt', 'zz', {'tt', 'zz'}, 7}, 'end'}))
