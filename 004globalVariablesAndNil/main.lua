-- http://www.lua.org/pil/1.2.html

print(b) -- nil
b = 10
print(b);
b = nil
print(b);



-- will print:
-- nil
-- 10
-- nil


-- IMPORTANT CONCLUSION: variable is existent if (and only if) it has a non-nil value.