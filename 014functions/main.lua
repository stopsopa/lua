-- http://www.lua.org/pil/5.html


print('8*9, 9/8', 8 * 9, 9 / 8)
a = math.sin(3) + math.cos(10)
print('a: ', a)
print('os.date()', os.date())

function test(arg)
    print('arg: ', arg)
end

test('argvalue')
test 'argval2'

function incCount(count, n)
    n = n or 1
    return count + n;
end

print "----- incCount:"
print("incCount(4):", incCount(4))
print("incCount(4, 2):", incCount(4, 2))
