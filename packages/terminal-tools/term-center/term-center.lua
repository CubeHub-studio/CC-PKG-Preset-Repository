local s=table.concat(arg," "); local w=select(1,term.getSize()); term.setCursorPos(math.max(1,math.floor((w-#s)/2)+1),select(2,term.getCursorPos())); print(s)
