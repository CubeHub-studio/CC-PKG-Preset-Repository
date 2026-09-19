local manifest=arg[1] or "package.json"; if not fs.exists(manifest) then print("Manifest not found."); return end
local h=fs.open(manifest,"r"); local ok,m=pcall(textutils.unserialiseJSON,h.readAll()); h.close(); if not ok or type(m)~="table" then print("Invalid manifest."); return end
local missing=0
for _,f in ipairs(m.files or {}) do local p=f.source or f.path; if p and not fs.exists(p) then print("Missing: "..p); missing=missing+1 end end
print("Missing files: "..missing)