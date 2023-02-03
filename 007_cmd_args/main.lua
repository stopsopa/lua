-- http://www.lua.org/pil/1.4.html#:~:text=The%20script%20name%20goes%20into%20index%200


print('running main.lua')
print(type(arg))
print(arg)
local inspect = require 'inspect'
print(inspect(arg))



