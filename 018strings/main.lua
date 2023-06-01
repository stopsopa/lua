-- https://stopsopa.github.io/lua/ebook.pdf page24
local str1 = 'abcdef';

print '----- string length in bytes:'
print('str1 len: ', #str1)
print('raw string len: ', #"kot")
print('#"💀👿🎩💥" :', #'💀👿🎩💥')
print('string.len("💀👿🎩💥") :', string.len('💀👿🎩💥')) -- the same as #"string" it counts bytes not characters (end of page 27)

print "---- concatanation:"
print('6 .. 3: ', 6 .. 3, type(6 .. 3))

local long = [[
    abc
    def
mid
    end    
]]

local long_special = [===[
    abc
    def
mid
    end    
]===]

print('long_special: ', long_special)

print '----- string format:'

print('string.format("x = %d y = %d", 10, 20): ', string.format("x = %d y = %d", 10, 20))
print('string.format("pi = %.5f", math.pi): ', string.format("pi = %.5f", math.pi))
print('string.format("<%s>%s</%s>", "div", "html", "div"): ', string.format("<%s>%s</%s>", "div", "html", "div"))
d = 5;
m = 11;
y = 1990
print('string.format("%02d/%02d/%04d", d, m, y):', string.format("%02d/%02d/%04d", d, m, y))

print '---- utf8:'

print('utf8.len("💀👿🎩💥"): ', utf8.len("💀👿🎩💥"))
