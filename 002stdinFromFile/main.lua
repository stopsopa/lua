local file = io.open("input.txt", "r")
io.input(file)
local contents = io.read("*all")
print(contents)
io.close(file)


