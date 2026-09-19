local y=tonumber(arg[1])
local m=tonumber(arg[2])
local now=os.date("*t")
y=y or now.year
m=m or now.month
if m<1 or m>12 then print("Month must be 1-12.") return end
local first=os.time{year=y,month=m,day=1}
local firstDay=os.date("*t",first).wday
local nextMonth=(m==12) and 1 or m+1
local nextYear=(m==12) and y+1 or y
local days=os.date("*t",os.time{year=nextYear,month=nextMonth,day=1}-86400).day
print(os.date("%B %Y",first))
print("Su Mo Tu We Th Fr Sa")
local line=string.rep("   ",firstDay-1)
for d=1,days do
  line=line..("%2d "):format(d)
  if (firstDay+d-1)%7==0 then print(line) line="" end
end
if line~="" then print(line) end