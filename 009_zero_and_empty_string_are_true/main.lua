-- http://www.lua.org/pil/2.2.html#:~:text=Lua%20considers%20both%20zero%20and%20the%20empty%20string%20as%20true%20in%20conditional%20tests

test = true;
if test then
    print('true - is true', test)
else
    print('true - is false', test)
end

test = "string";
if test then
    print('string - is true', test)
else
    print('string - is false', test)
end

test = "";
if test then
    print('empty string - is true', test)
else
    print('empty string - is false', test)
end

test = 1;
if test then
    print('one - is true', test)
else
    print('one - is false', test)
end

test = 0;
if test then
    print('zero - is true', test)
else
    print('zero - is false', test)
end

test = nil;
if test then
    print('nil - is true', test)
else
    print('nil - is false', test)
end

-- true - is true  true
-- string - is true        string
-- empty string - is true
-- one - is true   1
-- zero - is true  0
-- nil - is false  nil