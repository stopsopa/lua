
-- from: https://www.tutorialspoint.com/what-is-the-difference-between-pairs-vs-ipairs-in-lua
-- from: https://stackoverflow.com/a/55109411/5560682
u={}
u["start"] = 'aaaa'
u[1]="a"
u[3]="b"
u[2]="c"
u[2.5]="two an a half"
u[-1] = "minu one"
u[0] = "zero"
u[4]="d"
u["aa"] = "zz"
u[7] = "e"
print("ipairs")
for key,value in ipairs(u) do print(key,value) end
print("pairs")
for key,value in pairs(u) do print(key,value) end

-- ipairs
-- 1       a
-- 2       c
-- 3       b
-- 4       d

-- pairs
-- 1       a
-- 2       c
-- 3       b
-- 4       d
-- 0       zero
-- -1      minu one
-- aa      zz
-- 2.5     two an a half
-- 7       e
-- start   aaaa

-- will iterate only through numerical (non numerical will be skipped)
-- gaps in between the indexes lead to halts -> will print only 123 from series 1237
-- numerical values smaller than 1 will be skipped too

-- about ipares:
  -- and finding a nil value while iterating is exactly the ending condition for ipairs()