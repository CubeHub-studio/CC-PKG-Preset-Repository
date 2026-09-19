local t=os.clock()+5; local a={"|","/","-","\\"}; local i=1; while os.clock()<t do term.setCursorPos(1,1); write(a[i]); i=i%4+1; sleep(.1) end; print()
