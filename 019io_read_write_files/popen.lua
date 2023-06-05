-- https://stopsopa.github.io/lua/ebook.pdf page 55
function inspc(data, i, refCounter, visited)
    refCounter = refCounter or 1
    i = i or 0
    visited = visited or {}  -- keep track of visited tables

    local t = type(data)
    if t == 'table' then
        -- Check if the current table has been visited before
        if visited[data] then
            return '■■■ ■■■ ■■■ CIRCULAR REFERENCE ■■■ '..visited[data]..' ■■■ ■■■ ■■■'
        end

        visited[data] = refCounter  -- Mark the current table as visited
        refCounter = refCounter + 1;

        local buff = '{'
        for k, v in pairs(data) do
            buff = buff .. '\n' .. string.rep('  ', i + 1) .. '[' .. inspc(k, i + 1, refCounter, visited) .. '] : ' .. inspc(v, i + 1, refCounter, visited)
        end
        visited[data] = nil  -- Remove the mark for the current table
        return buff .. '\n' .. string.rep('  ', i) .. '}'
    end
    return t .. ' >' .. tostring(data) .. '<'
end

function shell(command, mode)
    mode = mode or 'r'
    local handle = io.popen(command .. " 2>/dev/null", mode);
    local stdout = handle:read("*a");
    local success = handle:close();
    if success == nul then
        io.stderr:write("fn shell failed >", command, "< exit code: ")
        os.exit(1)
    end
    return stdout
end

local stdout = shell("ls -la", "r")

print('stdout:', inspc(stdout))

function shellLines(command, mode)
    mode = mode or 'r'
    local handle = io.popen(command .. " 2>/dev/null", mode);
    local stdout = handle:read("*a");
    local success = handle:close();
    if success == nul then
        io.stderr:write("fn shell failed >", command, "< exit code: ")
        os.exit(1)
    end
    local lines = {}
    for line in stdout:gmatch("[^\r\n]+") do
        table.insert(lines, line)
    end
    return lines
end

local lines = shellLines("ls -la", "r")

print('lines:', inspc(lines))

for _, line in ipairs(lines) do
    print('line: ', _, line)
end
