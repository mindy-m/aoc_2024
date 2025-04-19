--[[
The engineers are trying to figure out which reports are safe. The Red-Nosed reactor safety systems can only tolerate levels that are either gradually increasing or gradually decreasing. So, a report only counts as safe if both of the following are true:

    The levels are either all increasing or all decreasing.
    Any two adjacent levels differ by at least one and at most three.
]]


-- Use curly braces to create a table literal
local reports = {}

-- Read lines, stolen from day 1
-- Alternative option spelling out its a global
-- for line in _G.io.lines() do
for line in io.lines() do
    -- we want to read a report which consists of numbers delimited by space
    local line_report = {} -- this makes a table / object thingy

    -- take the thing
    -- tease out the numbers
    -- ignore the spaces, the spaces are what separates one number from another number
    -- gmatch is like match, but we can loop over it, instead of just getting one answer
    for doodad in line:gmatch("[^ ]+") do
        -- convert to number
        -- save the list of them
        table.insert(line_report, tonumber(doodad))

--[[  
    Previous pattern:

    _G.table.insert(lefties, _G.tonumber(lefty))
    -- Take 2nd string and convert to an actual number, then put in righties group (table)    _G.table.insert(lefties, _G.tonumber(lefty))
]]


    end
end


-- The levels are either all increasing or all decreasing.


-- Any two adjacent levels differ by at least one and at most three.