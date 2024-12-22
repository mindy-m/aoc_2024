local meta = {}
function meta.__index(t,k)
    error(("attempted to read from undeclared global variable %q"):format(k), 2)
end
function meta.__newindex(t,k,v)
    error(("attempted to write to undeclared global variable %q"):format(k), 2)
end
setmetatable(_ENV, meta)
