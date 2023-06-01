
# ebook
Programming_in_Lua,_4th_ed._(2017)_.pdf
Downloaded from https://www.lua.org/pil/#:~:text=of%20the%20language.-,The%20book%20is%20available%20at%20the%20main%20online%20stores%20and%20also%20as%20an%20e%2Dbook.,-Third%20edition
g(The fourth edition updates the book to Lua 5.3 and marks a complete reorganization of the text. Building on many years of experience teaching Lua, Roberto has restructured the book to present the material in a growing order of complexity, allowing the reader to better absorb the character of the language. The book is available at the main online stores and also as an e-book.)

url: https://stopsopa.github.io/lua/ebook.pdf

to refer use notation https://stopsopa.github.io/lua/ebook.pdf :page67
WARNING/NOTE: use pages of the book not pages of pdf in browser
WARNING/NOTE: use pages of the book not pages of pdf in browser
WARNING/NOTE: use pages of the book not pages of pdf in browser

# setup

Just use .vscode/README.md

# lua formatter for vscode

https://github.com/Koihik/vscode-lua-format
https://marketplace.visualstudio.com/items?itemName=Koihik.vscode-lua-format

vscode-lua-format
v1.3.8
by -> Koihik

# basic truths about lua

- The condition expression of a control structure may result in any value. Lua treats as true all values different from false and nil.
  from: http://www.lua.org/pil/4.3.html

```
local inspect = require 'inspect'
print(inspect(arg))
days = {
    [0] = "Sunday",
    "Monday",
    [2] = 'two',
    test = 'val'
}
print('pairs for:')
for i, day in pairs(days) do
    print('>' .. i .. '< >' .. day .. '<')
end
print('ipairs for:')
for i, day in ipairs(days) do
    print('>' .. i .. '< >' .. day .. '<')
end
-- pairs for:
-- >1< >Monday<
-- >0< >Sunday<
-- >2< >two<
-- >test< >val<

-- ipairs for:
-- >1< >Monday<
-- >2< >two<

```  

# package manager

```

export HOMEBREW_NO_AUTO_UPDATE=1 && brew install luarocks

```

https://formulae.brew.sh/formula/luarocks

more: https://luarocks.org/#quick-start

# useful links
- [find latest version - just go to homepage - ](https://www.lua.org/)
- [reference manual v 5.1 - documentation version](https://www.lua.org/manual/5.1)
- [reference manual v 5.4 - latest version](https://www.lua.org/manual/5.4/)

# where to contiune:
http://www.lua.org/pil/4.1.html



