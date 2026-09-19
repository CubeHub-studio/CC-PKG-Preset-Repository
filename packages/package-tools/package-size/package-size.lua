local manifest=arg[1] or "package.json"; if not fs.exists(manifest) then print("Manifest not found."); return end
local h=fs.open(manifest,"r"); local ok,m=pcall(textutils.unserialiseJSON,h.readAll()); h.close(); if not ok then print("Invalid manifest."); return end
local total=0; for _,f in ipairs(m.files or {}) do local p=f.source or f.path; if p and fs.exists(p) and not fs.isDir(p) then total=total+fs.getSize(p) end end
print("Declared package size: "..total.." bytes"); print("Files: "..#(m.files or {}))