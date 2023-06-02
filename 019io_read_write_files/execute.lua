-- https://stopsopa.github.io/lua/ebook.pdf page 55
function execute(cmd)
    local success, exitOrSignal, exitCode = os.execute(cmd)
    if success ~= true then
        io.stderr:write("fn execute >" .. cmd .. "< failed", success, exitOrSignal, exitCode)
        os.exit(1)
    end
    return success, exitOrSignal, exitCode
end

local file = '__tmp.txt';
local dir = '__tmpdir';

print(execute('mkdir "' .. dir .. '"'))
print(execute('rm -rf "' .. dir .. '"'))
