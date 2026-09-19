local s=table.concat(arg," "); local ok,v=pcall(textutils.unserialize,s); if ok then print(textutils.serialize(v)) else print(v) end
