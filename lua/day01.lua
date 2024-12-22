-- Usage: lua lua/day01.lua < inputs/sample01.txt
--    OR: lua lua/day01.lua < inputs/input01.txt

-- Make empty variables for each column - curly braces to create a table literal
local lefties = {}
local righties = {}
--Read each line from the input you specify when you run the initial command (see above)
for line in io.lines() do
    -- Look for number, separate by space, number - then check if it found a match

    -- assert has two meanings in lua:
    -- 1. (the common meaning) I am assuming that this condition is true, please check my assumption
    -- 2. (the weird Lua-specific meaning) I'm doing something that might fail. If it fails, it will return false or nil and I would like to explode if that happens.
    -- here we are using meaning 2
    local lefty,righty = assert(line:match("^([0-9]+) +([0-9]+)$"))
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
-- (control characters), (most symbols), 1-9, (some more symbols), A-Z, (some more symbols), a-z, (a few more symbols), aaaaand backspace - actually look at this more later!
table.sort(lefties)
table.sort(righties)

-- Step 2: subtract each right number from each left number, and take the absolute value

-- Also, check if the left list and the right list are actually the same length, because the rest of this assumes that.
-- (here we are using meaning 1 for assert, see above)
assert(#lefties == #righties)

-- `n` is the index number. It will start at 1 and count up until it reaches
-- `#lefties`.
-- # = the "length of" operator, so the number of entries in lefties
-- ... also, Lua table indices start at 1, which is easily the worst thing about
-- the language.

--Oh yeah, and make a variable to keep a running total as  we go through the list
local addinator = 0
for n = 1, #lefties do
    -- If we do this, it prints the lists post-sorting.
    --print(lefties[n], righties[n])

    -- Subtract left from right (or vice versa, whatever) and then get the absolute value of that
    -- Add up all of those differences to get a solution, and print that.
    addinator = addinator + math.abs(lefties[n] - righties[n])


    --math.abs(????)
end

-- DID WE SOLVE IT
-- `..` pastes two strings together (making them strings if they aren't already)
-- concatenation is a fun word to spell
-- `"Hello " .. "World!"` would become `"Hello World!"`
-- In Lua, `+` is always mathematical addition, and `..` is always string concatenation
print("Day 1 Part 1 solution: "..addinator)
