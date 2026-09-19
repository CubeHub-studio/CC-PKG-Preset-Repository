local ok,m=pcall(require,"cc.audio.dfpwm"); print("Available: "..tostring(ok)); if ok then print("Module loaded.") else print(m) end
