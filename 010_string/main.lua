-- http://www.lua.org/pil/2.4.html


a = "one string"
a = 'one string' -- single or double quotes

b = string.gsub(a, "one", "another") -- change string parts
print(a) -- > one string
print(b) -- > another string

page = [[
<HTML>
<HEAD>
<TITLE>An HTML Page</TITLE>
</HEAD>
<BODY>
    <A HREF="http://www.lua.org">Lua</A>
 </BODY>
</HTML>
]]
    
print(page)

-- concatenate strings

print('concatenate strings:')
a = 'abc'
b = 'def'
c = a .. b
print(c)

print('convert string to number:')
-- line = io.read()     -- read a line
line = '10' -- will work for that
-- line = 'a8' -- 8h, a8, 10b -> any of those will not work
n = tonumber(line)   -- try to convert it to a number
if n == nil then
    error(line .. " is not a valid number")
else
    print(n*2)
end

print('convert number to string');
a = 10
b = a .. "";
print(type(b))
print(b)