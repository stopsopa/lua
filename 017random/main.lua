-- https://stopsopa.github.io/lua/ebook.pdf :page18
print('math.random():', math.random()) -- float between 0 and 1
print('math.random(2):', math.random(2)) -- 1 or 2, that's all - no float
print('math.random(2, 4):', math.random(2, 4)) -- 2,3 or 4 - no float

-- math.randomseed(os.time());
print('--- fiexed seed for pseudo-random gen -----')
math.randomseed(1);
print('math.random():', math.random()) -- always 0.81558781554723
print('math.random(2):', math.random(2)) -- always 2
print('math.random(2, 4):', math.random(2, 4)) -- always 3

print('---- round ----');
-- https://stopsopa.github.io/lua/ebook.pdf :page19
function round(x)
    local f = math.floor(x)
    if (x == f) or (x % 2.0 == 0.5) then
        return f
    else
        return math.floor(x + 0.5)
    end
end

print('3.5 + 0.5: ', math.floor(3.5 + 0.5)) --> 4 (ok)
print('2.5 + 0.5: ', math.floor(2.5 + 0.5), '(wrong)') --> 3 (wrong)
print('round(2.5): ', round(2.5)) -- > 2
print('round(3.5): ', round(3.5)) -- > 4
