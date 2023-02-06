

s = "╔╦╗\n╚╩╝"
for i = 1, #s do
  print(string.byte(s, i))
end

numbers = {226,149,148,226,149,166,226,149,151,10,226,149,154,226,149,169,226,149,157}
s = ""
for i = 1, #numbers do
  s = s .. string.char(numbers[i])
end
print(s)

-- will print the same as
-- print("╔╦╗")
-- print("╚╩╝")

print('\97lo\04923"')
print('\xE2\x82\xAC')

-- encoding from chatgpt 
-- https://unicode-table.com/en/1F602/
-- do this online: https://www.browserling.com/tools/utf8-encode
local str = "😂"
local hex_str = ""
for i = 1, #str do
  hex_str = hex_str .. string.format("\\x%X", string.byte(str, i))
end
print(hex_str)
print('result >\xF0\x9F\x98\x82<')



s = "😂"
for i = 1, #s do
  print(string.byte(s, i))
end