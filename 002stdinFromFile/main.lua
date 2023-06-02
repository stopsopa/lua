local file = io.open("input.txt", "r")

io.input(file) -- https://stopsopa.github.io/lua/ebook.pdf page 50

local contents = io.read("*all") -- https://stopsopa.github.io/lua/ebook.pdf page 50

print(contents)
io.close(file)


