local sides={"top","bottom","left","right","front","back"}
local function snapshot()
  local t={}
  for _,side in ipairs(sides) do
    t[side]={power=redstone.getAnalogInput(side),active=redstone.getInput(side)}
  end
  return t
end
local function changed(a,b)
  for _,side in ipairs(sides) do
    if a[side].power~=b[side].power or a[side].active~=b[side].active then return true end
  end
  return false
end
print("Watching redstone. Press Q to stop.")
local old=snapshot()
while true do
  local e,k=os.pullEvent()
  if e=="redstone" then
    local now=snapshot()
    if changed(old,now) then
      for _,side in ipairs(sides) do
        if old[side].power~=now[side].power or old[side].active~=now[side].active then
          print(("%-6s: %s (%d -> %d)"):format(side,tostring(now[side].active),old[side].power,now[side].power))
        end
      end
      old=now
    end
  elseif e=="key" and k==keys.q then
    break
  end
end