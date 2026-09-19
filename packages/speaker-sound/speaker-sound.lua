local sound=arg[1] or "block.note_block.pling"; for _,s in ipairs(peripheral.getNames()) do if peripheral.getType(s)=="speaker" then peripheral.call(s,"playSound",sound,1,1) end end
