-- Make empty variables for each column
local lefties = {}
local righties = {}
--Read each line
for line in io.lines() do
    -- Look for number, separate by space, number
    local lefty,righty = line:match("^([0-9]+) +([0-9]+)$")
    -- general format is inserting second parameter into the first thing
    -- Take 1st string and covert to an actual number, then put in lefties group which is called a table
    table.insert(lefties, tonumber(lefty))
    -- Take 2nd string and convert to an actual number, then put in righties group (table)
    table.insert(righties, tonumber(righty))
end

--[[
local thing_what_returns_lines = io.lines()
local line = thing_what_returns_lines()
while line ~= nil do
    -- ... stuff goes here ...
    line = thing_what_returns_lines()
end
]]


-- Step 1: sort crap
-- table.sort does least to most (ascending) by default
-- if they're strings, it sorts them in ASCII order:
-- (control characters), (most symbols), 1-9, (some more symbols), A-Z, (some more symbols), a-z, (a few more symbols), aaaaand backspace
table.sort(lefties)
table.sort(righties)

-- Step 2: subtract each right number from each left number, and take the absolute value
-- we'll have every number n starting with 1 and ending with #lefties
-- # = the "length of" operator, so the number of entries in lefties
-- ... also, Lua table indices start at 1, which is easily the worst thing about
-- the language.
for n = 1, #lefties do
    -- If we do this, it prints the lists post-sorting.
    --print(lefties[n], righties[n])
    math.abs(????)
end
