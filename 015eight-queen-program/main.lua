-- https://stopsopa.github.io/lua/ebook.pdf :page13
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

-- board size
-- N = 8 
N = 4

-- check whether position (n,c) is free from attacks
function isplaceok(a, n, c)
    for i = 1, n - 1 do -- for each queen already placed
        if (a[i] == c) or -- same column?
        (a[i] - i == c - n) or -- same diagonal?
        (a[i] + i == c + n) then -- same diagonal?
            return false -- place can be attacked
        end
    end
    return true -- no attacks; place is OK
end

-- print a board
function printsolution(a)
    -- print(inspc(a))
    for i = 1, N do -- for each row
        local b = ''
        for j = 1, N do -- and for each column
            -- write "X" or "-" plus a space
            -- io.write(a[i] == j and "X" or "-", " ")
            b = b .. (a[i] == j and "X" or "-") .. ' '
        end
        -- io.write("\n")
        print(b)
    end
    print('')
    -- io.write("\n")
end

-- add to board 'a' all queens from 'n' to 'N'
function addqueen(a, n)
    if n > N then -- all queens have been placed?
        printsolution(a)
    else -- try to place n-th queen
        for c = 1, N do
            if isplaceok(a, n, c) then
                a[n] = c -- place n-th queen at column 'c'
                addqueen(a, n + 1)
            end
        end
    end
end

-- run the program
-- addqueen({["test"]='xxx'}, 1)
addqueen({
    ["test"] = 'xxx' -- this doesn't change anything, but during debugging we can see that only one table is used
}, 1)
