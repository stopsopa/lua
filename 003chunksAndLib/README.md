
http://www.lua.org/pil/1.1.html

```

lua -la.txt -lb.lua

```

doesn't seem to work

where running

```

lua main.lua

```

will work

# loading lib

```

cat <<EEE | lua
dofile("lib1.lua")   -- load your library
n = norm(3.4, 1.0)
print(twice(n))      --> 7.0880180586677
EEE


```