for _,n in ipairs(peripheral.getNames()) do if peripheral.getType(n)=="speaker" then peripheral.call(n,"playNote","block.note_block.bass",1,3) end end
