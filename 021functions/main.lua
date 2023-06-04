Lib = {}
function Lib.foo(x, y)
    return x + y
end
function Lib.goo(x, y)
    return x - y
end

print(Lib.foo(2, 3), Lib.goo(2, 3)) -- > 5 -1

local fact -- this have to be separate ...
fact = function(n)
    if n == 0 then
        return 1
    else
        return n * fact(n - 1) -- ... for this to work https://stopsopa.github.io/lua/ebook.pdf page 70
    end
end

print '---- indirect recursion and definition of functions'

local f -- "forward" declaration

local function g()
    -- code
end

function f()
    -- code
end

print '----------- lexical scoped counter'

function newCounter()
    local count = 0
    return function() -- anonymous function
        count = count + 1
        return count
    end
end

c1 = newCounter()
print(c1()) -- > 1
print(c1()) -- > 2
print(c1()) -- > 3

-- https://stopsopa.github.io/lua/ebook.pdf page 73
do
    local oldOpen = io.open
    local access_OK = function(filename, mode)
        -- check access
    end
    io.open = function(filename, mode)
        if access_OK(filename, mode) then
            return oldOpen(filename, mode)
        else
            return nil, "access denied"
        end
    end
end

print '---- exercise'

function F(x)
    return {
        set = function(y)
            x = y
        end,
        get = function()
            return x
        end
    }
end

o1 = F(10)
o2 = F(20)
print(o1.get(), o2.get())
o2.set(100)
o1.set(300)
print(o1.get(), o2.get())
