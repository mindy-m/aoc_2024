-- As in other files, anywhere you see "_G.", you can just delete that. It's
-- just Solra making it visually obvious that it's a global variable being
-- accessed.

local invader_zim = {}
-- same as:
--invader_zim.__index = function(tabula, key)
function invader_zim.__index(tabula, key)
    _G.error(("attempted to read from undeclared global variable %q"):format(key), 2)
end
function invader_zim.__newindex(tabula, key, value)
    _G.error(("attempted to write to undeclared global variable %q"):format(key), 2)
end
-- first parameter: the thing we are acting upon
-- second parameter: the thing that we want to use as a metatable
_G.setmetatable(_G, invader_zim)

-- Steps of performing a table lookup in Lua:
-- (We are looking inside tabula for the key key: tabula[key])
-- 1. Check if the key is in tabula. If it's there, we're done.
-- 2. See if there's a METAtable for tabula.
-- 3. See if there's an __index entry in the METAtable.
-- 4. Call __index(tabula, key) and say whatever it returned is the result of the lookup.
-- 5. If there's not a METAtable, or not an __index entry in the METAtable, then just quietly return nil and move on with life.

-- (this code is hypothetical)
local function look_thing_up_in_table(tabula, key)
    local value = tabula[key]
    if value ~= nil then
        -- We found it! We done!
        return value
    end
    local metatable = getmetatable(tabula)
    if metatable ~= nil and metatable.__index ~= nil then
        return metatable.__index(tabula, key)
    end
    return nil
end

-- underscores at the beginning of an identifier tend to mean one of two things:
-- 1. (in good languages, like Rust) a single underscore at the beginning tells the compiler "I made this, I named it, but I don't have any plans to use it, so don't warn me if I didn't use it"
-- 2. (in all languages) multiple underscores at the beginning tells the language "I didn't choose this variable for personal use, I really do want to do the weird meaning you attached to this thing"
