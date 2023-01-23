-- defines a factorial function
-- from: http://www.lua.org/pil/1.html
-- This first edition was written for Lua 5.0. While still largely relevant for later versions, there are some differences.
-- The fourth edition targets Lua 5.3 and is available at Amazon and other bookstores.
-- By buying the book, you also help to support the Lua project.

-- MORE ABOUT COMMENTS: http://www.lua.org/pil/1.3.html

function fact(n)
    if n == 0 then
        return 1
    else
        return n * fact(n - 1)
    end
end

print("enter a number:")
local a = io.read("*number") -- read a number
print(fact(a))
