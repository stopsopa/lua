
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



