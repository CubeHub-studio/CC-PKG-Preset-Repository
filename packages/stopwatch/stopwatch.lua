print("Press Q to stop.") local t=os.clock() while true do term.setCursorPos(1,2) write(("Elapsed: %.1fs"):format(os.clock()-t)) local e,k=os.pullEvent("key") if k==keys.q then break end end
