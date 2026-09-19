local running=true
local start=os.clock()
local last=-1
term.clear()
term.setCursorPos(1,1)
print("Stopwatch")
print("Press Q to stop.")
while running do
  local elapsed=os.clock()-start
  if math.floor(elapsed*10)~=last then
    last=math.floor(elapsed*10)
    term.setCursorPos(1,3)
    write(("Elapsed: %8.1fs"):format(elapsed))
  end
  local timer=os.startTimer(0.05)
  local e,k=os.pullEvent()
  if e=="key" and k==keys.q then running=false end
  if e=="timer" and k~=timer then end
end
term.setCursorPos(1,5)
print(("Final: %.1fs"):format(os.clock()-start))