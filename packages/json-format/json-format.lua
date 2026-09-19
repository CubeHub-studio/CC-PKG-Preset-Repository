local v=table.concat(arg," "); if v=="" then print("Usage: json-format <text>") return end; print(textutils.serialiseJSON({text=v}))
