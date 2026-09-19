local s=os.clock()
local function fmt(x)
  local h=math.floor(x/3600); x=x-h*3600
  local m=math.floor(x/60); local sec=x-m*60
  return ("%02dh %02dm %05.2fs"):format(h,m,sec)
end
print("Process uptime: "..fmt(s))
print("Computer ID: "..os.getComputerID())
print("Label: "..tostring(os.getComputerLabel()))