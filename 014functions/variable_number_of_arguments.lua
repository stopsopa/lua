--- http://www.lua.org/pil/5.2.html
-- function print (...)
--     for i,v in ipairs(arg) do
--       printResult = printResult .. tostring(v) .. "\t"
--     end
--     printResult = printResult .. "\n"
--   end
--
--
-- starting from Lua 5.2, the arg table was removed
-- function myprint(...)
--     for i, v in ipairs(arg) do
--         print(i, ": >", tostring(v), "<");
--     end
-- end
function myprint(...)
    local args = {...}
    for i, v in ipairs(args) do
        print(i, ": >", tostring(v), "<")
    end
end

print('go')
myprint('ab', 'cd', 'ef', 7)

