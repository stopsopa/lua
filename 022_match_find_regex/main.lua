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

print '------------ string.find:'
-- https://stopsopa.github.io/lua/ebook.pdf page 77

do
    s = "hello world"
    i, j = string.find(s, "hello")
    print(i, j) -- > 1 5
    print(string.sub(s, i, j)) -- > hello
    print(string.find(s, "world")) -- > 7 11
    i, j = string.find(s, "l")
    print(i, j) -- > 3 3
    print(string.find(s, "lll")) -- > nil

    -- string.find("a [word]", "[") -- this will throw because "[" have special meaning
    --  stdin:1: malformed pattern (missing ']')

    string.find("a [word]", "[", 1, true) -- > 3 3
    -- fourth param - plain search
    -- third param - where to start

end

print '------------ string.match'
-- https://stopsopa.github.io/lua/ebook.pdf page 78

date = "Today is 17/7/1990"
d = string.match(date, "%d+/%d+/%d+")
print('string.match(date, "%d+/%d+/%d+"): ', d) -- > 17/7/1990

s = string.gsub("all lii", "l", "x")
print('string.gsub("all lii", "l", "x"): ', s) -- > axx xii
s = string.gsub("all lii", "l", "x", 2) -- 2 will allow to replace only twice
print('string.gsub("all lii", "l", "x", 2): ', s) -- > axx lii

print '------------ string.gmatch'
-- https://stopsopa.github.io/lua/ebook.pdf page 79
-- ^^^^^^^^^^^ go here to see all character classes
-- ^^^^^^^^^^^ go here to see all character classes

s = "some string"
words = {}
for w in string.gmatch(s, "%a+") do
    words[#words + 1] = w
end
print(inspc(words))

s = "Deadline is 30/05/1999, firm"
date = "%d%d/%d%d/%d%d%d%d"
print('string.match("Deadline is 30/05/1999, firm", "%d%d/%d%d/%d%d%d%d"): ', string.match(s, date)) -- > 30/05/1999
