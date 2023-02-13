-- http://www.lua.org/pil/4.1.html
a = 20;
b = 30;

local math = require "math"

print("a: ", a);
print("b: ", b);

a, b = b, a

print('variables swapped');
print("a: ", a);
print("b: ", b);

a, b = 8;

print('nul was assigned to b');
print("a: ", a);
print("b: ", b);

-- http://www.lua.org/pil/4.2.html
c = 2
b = 3;
e = nil;
f = nil;
do
    local a2 = 2 * a
    d = a2
    local d = math.sqrt(b ^ 2 - 4 * a * c)
    f = d;
    x1 = (-b + d) / a2
    x2 = (-b - d) / a2
end -- scope of `a2' and `d' ends here
print(x1, x2, a2, e, f)
