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

print '------------ string.gsub'

s = string.gsub("all lii", "l", "x")
print('string.gsub("all lii", "l", "x"): ', s) -- > axx xii
s = string.gsub("all lii", "l", "x", 2) -- 2 will allow to replace only twice
print('string.gsub("all lii", "l", "x", 2): ', s) -- > axx lii

print '------------ string.gmatch'
-- https://stopsopa.github.io/lua/ebook.pdf page 79
-- ^^^^^^^^^^^ go here to see all character classes
-- ^^^^^^^^^^^ go here to see all character classes

-- https://stopsopa.github.io/lua/ebook.pdf page 80
-- %d the same as [0-9]
-- %x the same as [0-9a-fA-F] - HEXADECIMAL
-- [^%x] or %X the same as [^0-9a-fA-F] - HEXADECIMAL
-- %u the same as [A-Z]

-- %w the same as [a-zA-Z0-9]
-- print(string.match(".# jfdsjs_jffjjf 874", '[%w_]+')) -- %w  will match only "jfdsjs" not "jfdsjs_jffjjf"

-- %a the same as [A-Za-z]
-- %l the same as [a-z]

-- below is from chatGPT - to subject for double checking
-- %c the same as [\n\r\t\b] YOU MIGHT NEED TO ADD % THOUG - BUT NOT SURE
-- %p the same as [.,:;!?"'-()[]{}~@_] BUT YOU HAVE TO ADD ESCAPING WITH % BEFORE EACH character
-- %g	all printable characters except space (not Lua 5.1) (NOT CLEAR REALLY TO ME)

s = "some string"
words = {}
for w in string.gmatch(s, "%a+") do
    words[#words + 1] = w
end
print(inspc(words))

s = "Deadline is 30/05/1999, firm"
date = "%d%d/%d%d/%d%d%d%d"
print('string.match("Deadline is 30/05/1999, firm", "%d%d/%d%d/%d%d%d%d"): ', string.match(s, date)) -- > 30/05/1999

print '-------- magic characters'
-- https://stopsopa.github.io/lua/ebook.pdf page 79
-- ( ) . % + - * ? [ ] ^ $

-- https://stopsopa.github.io/lua/ebook.pdf page 80
print('string.match("g1771a990b end", "[a-z][%da-z]*[a-z]"): ', string.match("g1771a990b end", "[a-z][%da-z]*[a-z]")) -- > g1771a990b
print('string.match("g1771a990b end", "[a-z][%da-z]-[a-z]"): ', string.match("g1771a990b end", "[a-z][%da-z]-[a-z]")) -- > g1771a
-- lazy repeatitin (I would call it non greedy)

print '--------------%b'
-- https://stopsopa.github.io/lua/ebook.pdf page 81
s = print('string.gsub("a (enclosed (in) parentheses) line", "%b()", ""): ',
    string.gsub("a (enclosed (in) parentheses) line", "%b()", ""))
-- it seems to be greedy ONLY

print '------------ frontier pattern'
-- https://stopsopa.github.io/lua/ebook.pdf page 81

print('string.gsub("the anthem is the theme", "%f[%w]the%f[%W]", "one"): ',
    string.gsub("the anthem is the theme", "%f[%w]the%f[%W]", "one"))
-- > one anthem is one theme

print '--------- captures'
-- https://stopsopa.github.io/lua/ebook.pdf page 82

key, value = string.match("name = Anna", "(%a+)%s*=%s*(%a+)")
print(inspc({key, value}))

s = [[then he said: "it's all right"!]]
q, quotedPart = string.match(s, "([\"'])(.-)%1")
print(quotedPart) -- > it's all right
print(q) -- > "

s = [=[
aa
[==[ one
two]==]
mid
[==[ two
three ]==]
zz
]=]

for a, b, c, d in string.gmatch(s, '%[(=*)%[(.-)%](%1)(%])') do
    print(inspc({a, b, c, d}))
end

print('string.gsub("hello Lua!", "%a", "%0-%0")', string.gsub("hello Lua!", "%a", "%0-%0")) -- > h-he-el-ll-lo-o L-Lu-ua-a!
print((string.gsub("hello Lua", "(.)(.)", "%2%1"))) -- > ehll ouLa

print '------------------- trim:'
-- https://stopsopa.github.io/lua/ebook.pdf page 83
function trim(s)
    s = string.gsub(s, "^%s*(.-)%s*$", "%1")
    return s
end
print("trim: >" .. trim("    test     ") .. "<")
print("trim: >" .. trim([[ 

abc
dofile

]]) .. "<")

function expand(s)
    return (string.gsub(s, "$([%w_]+)", _G))

    -- optionally also like this:
    -- return (string.gsub(s, "$([%w_]+)", function(n)
    --     return tostring(_G[n])
    -- end))

end

name = "Lua";
_G.__status = "great"
print(expand("$name is $__status, isn't it?")) -- > Lua is great, isn't it?

print '-------------- recirsive latex converter'
-- https://stopsopa.github.io/lua/ebook.pdf page 84
function toxml(s)
    s = string.gsub(s, "\\(%a+)(%b{})", function(tag, body)
        body = string.sub(body, 2, -2) -- remove the brackets
        body = toxml(body) -- handle nested commands
        return string.format("<%s>%s</%s>", tag, body, tag)
    end)
    return s
end
print('from: ', "\\title{The \\bold{big} example}")
print('to  : ', toxml("\\title{The \\bold{big} example}"))
-- > <title>The <bold>big</bold> example</title>

print '---------------------- url encoding'

-- https://stopsopa.github.io/lua/ebook.pdf page 84
function unescape(s)

    s = string.gsub(s, "+", " ")
    s = string.gsub(s, "%%(%x%x)", function(h)
        return string.char(tonumber(h, 16))
    end)
    return s
end

print('unescape("a%2Bb+%3D+c"): ', unescape("a%2Bb+%3D+c")) -- > a+b = c

-- https://stopsopa.github.io/lua/ebook.pdf page 85
function decode(s)
    local cgi = {}
    for name, value in string.gmatch(s, "([^&=]+)=([^&=]+)") do
        name = unescape(name)
        value = unescape(value)
        cgi[name] = value
    end
    return cgi;
end

print('decode("abc=def&ghi=jkl"): ', inspc(decode("abc=def&ghi=jkl")));

function escape(s)
    s = string.gsub(s, "[&=+%%%c]", function(c)
        return string.format("%%%02X", string.byte(c))
    end)
    s = string.gsub(s, " ", "+")
    return s
end

function encode(t)
    local b = {}
    for k, v in pairs(t) do
        b[#b + 1] = (escape(k) .. "=" .. escape(v))
    end
    -- concatenates all entries in 'b', separated by "&"
    return table.concat(b, "&")
end

t = {
    name = "al",
    query = "a+b = c",
    q = "yes or no"
}
print(encode(t)) -- > q=yes+or+no&query=a%2Bb+%3D+c&name=al

print '------------------ tab expansion:'
print('string.match("hello", "()ll()"): ', string.match("hello", "()ll()")) -- > 3 5
