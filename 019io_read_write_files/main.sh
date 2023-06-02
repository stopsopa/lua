

echo ""
echo 'perl -pe "system 'sleep .1'" input.txt | lua lines.lua'
perl -pe "system 'sleep .1'" input.txt | lua lines.lua

echo ""
echo 'perl -pe "system 'sleep .1'" input.txt| lua sort.lua'
perl -pe "system 'sleep .1'" input.txt| lua sort.lua

echo ""
echo 'lua io.open.lua'
lua io.open.lua

echo ""
echo 'lua file_size.lua'
lua file_size.lua

echo ""
echo 'lua execute.lua'
lua execute.lua