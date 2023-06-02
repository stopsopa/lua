-- https://stopsopa.github.io/lua/ebook.pdf page 51
-- print('math.huge', math.huge)

-- for count = 1, math.huge do
--     local line = io.read("L")
--     if line == nil then
--         break
--     end
--     io.write(string.format("%6d ", count), line)
-- end



local count = 0
 for line in io.lines() do
 count = count + 1
 io.write(string.format("%6d ", count), line, "\n")
 end

