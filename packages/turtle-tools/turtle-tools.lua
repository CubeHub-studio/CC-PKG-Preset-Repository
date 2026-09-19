-- turtle-tools 1.0
-- One cohesive toolkit for common CC:Tweaked turtle work.
local t=turtle

local function usage()
 print("Turtle Tools 1.0")
 print("diagnostics: status inventory slot selected upgrades")
 print("movement: move <forward|back|up|down> [count], turn <left|right> [count], around")
 print("world: inspect [front|up|down], detect [front|up|down], compare [front|up|down]")
 print("world: dig [front|up|down] [count], place [front|up|down], attack [front|up|down]")
 print("inventory: select <1-16>, count [slot], space [slot], transfer <slot> [count], compact")
 print("storage: suck [front|up|down] [count], drop [front|up|down] [count]")
 print("fuel: fuel, refuel [count]")
 print("tools: craft [limit], equip <left|right>")
 print("automation: mine <count> --yes")
end

local function n(v,d)
 local x=tonumber(v)
 return x and math.floor(x) or d
end

local function slot(v)
 local x=n(v,0)
 if x<1 or x>16 then print("Slot must be 1-16."); return nil end
 return x
end

local function ok(a,b)
 if a then return true end
 print("Failed: "..tostring(b or "operation failed"))
 return false
end

local function detail(s)
 return t.getItemDetail(s,true)
end

local function item(d)
 return d and (d.displayName or d.name or "unknown") or "(empty)"
end

local function showSlot(s)
 local d=detail(s)
 print(("Slot %d: %s"):format(s,item(d)))
 print("  Count: "..t.getItemCount(s))
 print("  Space: "..t.getItemSpace(s))
 if d then
  if d.name then print("  ID: "..d.name) end
  if d.damage then print("  Damage: "..d.damage.."/"..tostring(d.maxDamage or "?")) end
  if d.nbt then print("  NBT: "..tostring(d.nbt)) end
 end
end

local function inventory()
 local used,total=0,0
 for s=1,16 do
  local c=t.getItemCount(s)
  if c>0 then
   used=used+1; total=total+c
   print(("%2d  %-38s %5d"):format(s,item(detail(s)),c))
  end
 end
 print("Occupied: "..used.."/16")
 print("Items:    "..total)
 print("Selected: "..t.getSelectedSlot())
end

local function fuel()
 print("Fuel: "..tostring(t.getFuelLevel()).."/"..tostring(t.getFuelLimit()))
end

local function upgrades()
 local l,r=t.getEquippedLeft(),t.getEquippedRight()
 print("Left:  "..item(l))
 print("Right: "..item(r))
end

local function status()
 print("=== Turtle Status ===")
 fuel()
 print("Selected slot: "..t.getSelectedSlot())
 print("Turtle type: "..(term.isColor and "advanced-compatible terminal" or "standard terminal"))
 upgrades()
 local modem=peripheral.find("modem")
 print("Modem: "..(modem and "available" or "none"))
end

local function directional(dir,front,up,down)
 if dir=="front" or dir=="forward" or not dir then return front() end
 if dir=="up" then return up() end
 if dir=="down" then return down() end
 print("Direction must be front, up or down."); return false
end

local function inspect(dir)
 local a,b=directional(dir,t.inspect,t.inspectUp,t.inspectDown)
 if not a then print("No block: "..tostring(b or "air")); return end
 print("Name: "..tostring(b.name or "unknown"))
 if b.state then print("State: "..textutils.serialize(b.state)) end
 if b.tags then print("Tags: "..textutils.serialize(b.tags)) end
end

local function detect(dir)
 local a=directional(dir,t.detect,t.detectUp,t.detectDown)
 print((dir or "front")..": "..(a and "blocked" or "clear"))
end

local function compare(dir)
 local a=directional(dir,t.compare,t.compareUp,t.compareDown)
 print("Compare: "..(a and "match" or "different"))
end

local function dig(dir,count)
 count=math.max(1,n(count,1))
 local f
 if dir=="front" or dir=="forward" or not dir then f=t.dig elseif dir=="up" then f=t.digUp elseif dir=="down" then f=t.digDown else print("Direction must be front, up or down."); return end
 local done=0
 for i=1,count do
  local a,b=f()
  if not a then
   if i==1 then print("Nothing dug: "..tostring(b or "no block")) end
   break
  end
  done=done+1
  if count>1 then os.sleep(0.05) end
 end
 print("Dug: "..done)
end

local function place(dir)
 local f
 if dir=="front" or dir=="forward" or not dir then f=t.place elseif dir=="up" then f=t.placeUp elseif dir=="down" then f=t.placeDown else print("Direction must be front, up or down."); return end
 ok(f())
end

local function attack(dir)
 local f
 if dir=="front" or dir=="forward" or not dir then f=t.attack elseif dir=="up" then f=t.attackUp elseif dir=="down" then f=t.attackDown else print("Direction must be front, up or down."); return end
 ok(f())
end

local function move(dir,count)
 count=math.max(1,n(count,1))
 local f={forward=t.forward,back=t.back,up=t.up,down=t.down}[dir or "forward"]
 if not f then print("Direction must be forward, back, up or down."); return end
 for i=1,count do
  local a,b=f()
  if not a then print("Stopped at "..i..": "..tostring(b or "blocked")); return end
 end
 print("Moved "..count.." "..(dir or "forward"))
end

local function turn(dir,count)
 count=math.max(1,n(count,1))
 local f=dir=="left" and t.turnLeft or dir=="right" and t.turnRight
 if not f then print("Turn must be left or right."); return end
 for i=1,count do f() end
 print("Turned "..count.." time(s)")
end

local function selectSlot(s)
 s=slot(s); if not s then return end
 t.select(s); showSlot(s)
end

local function count(s)
 if s then s=slot(s); if not s then return end; print(t.getItemCount(s)); return end
 local total=0
 for i=1,16 do total=total+t.getItemCount(i) end
 print("Total items: "..total)
end

local function space(s)
 s=slot(s or t.getSelectedSlot()); if s then print("Space: "..t.getItemSpace(s)) end
end

local function transfer(to,amount)
 to=slot(to); if not to then return end
 if to==t.getSelectedSlot() then print("Source and destination are identical."); return end
 ok(t.transferTo(to,amount and math.max(1,n(amount,1)) or nil))
end

local function compact()
 local selected=t.getSelectedSlot()
 local moved=0
 for a=1,16 do
  local da=detail(a)
  if da and da.name then
   for b=a+1,16 do
    local db=detail(b)
    if db and db.name==da.name and ((not da.nbt and not db.nbt) or da.nbt==db.nbt) then
     t.select(b)
     local before=t.getItemCount(b)
     t.transferTo(a)
     moved=moved+(before-t.getItemCount(b))
    end
   end
  end
 end
 t.select(selected)
 print("Moved "..moved.." item(s) into existing stacks.")
end

local function refuel(count)
 local wanted=math.max(1,n(count,64))
 local original=t.getSelectedSlot()
 if t.refuel(wanted) then fuel(); return end
 for s=1,16 do
  if t.getItemCount(s)>0 then
   t.select(s)
   if t.refuel(wanted) then
    print("Used fuel from slot "..s); fuel(); t.select(original); return
   end
  end
 end
 t.select(original); print("No usable fuel found.")
end

local function storage(kind,dir,count)
 local amount=count and math.max(1,n(count,1)) or nil
 local f
 if kind=="suck" then
  f=(dir=="up" and t.suckUp) or (dir=="down" and t.suckDown) or t.suck
 else
  f=(dir=="up" and t.dropUp) or (dir=="down" and t.dropDown) or t.drop
 end
 ok(f(amount))
end

local function craft(limit)
 limit=n(limit,64)
 if limit<0 or limit>64 then print("Limit must be 0-64."); return end
 ok(t.craft(limit))
end

local function equip(side)
 if side=="left" then ok(t.equipLeft())
 elseif side=="right" then ok(t.equipRight())
 else print("Side must be left or right.") end
end

local function mine(count,confirmed)
 count=math.max(1,n(count,1))
 if count>1 and not confirmed then
  print("Repeated mining changes the world. Add --yes to confirm.")
  return
 end
 local done=0
 for i=1,count do
  if t.getFuelLevel()~="unlimited" and t.getFuelLevel()<1 then print("Out of fuel."); break end
  t.dig()
  local a,b=t.forward()
  if not a then print("Mining stopped: "..tostring(b or "blocked")); break end
  done=done+1
 end
 print("Mined forward: "..done)
end

local c=(arg[1] or ""):lower()
if c=="" or c=="help" or c=="-h" or c=="--help" then usage()
elseif c=="status" then status()
elseif c=="inventory" or c=="inv" then inventory()
elseif c=="slot" then local s=slot(arg[2]); if s then showSlot(s) end
elseif c=="selected" then showSlot(t.getSelectedSlot())
elseif c=="upgrades" then upgrades()
elseif c=="fuel" then fuel()
elseif c=="refuel" then refuel(arg[2])
elseif c=="move" then move(arg[2],arg[3])
elseif c=="turn" then turn(arg[2],arg[3])
elseif c=="around" then t.turnLeft();t.turnLeft();print("Turned around.")
elseif c=="inspect" then inspect(arg[2])
elseif c=="detect" then detect(arg[2])
elseif c=="compare" then compare(arg[2])
elseif c=="dig" then dig(arg[2],arg[3])
elseif c=="place" then place(arg[2])
elseif c=="attack" then attack(arg[2])
elseif c=="select" then selectSlot(arg[2])
elseif c=="count" then count(arg[2])
elseif c=="space" then space(arg[2])
elseif c=="transfer" then transfer(arg[2],arg[3])
elseif c=="compact" then compact()
elseif c=="suck" then storage("suck",arg[2],arg[3])
elseif c=="drop" then storage("drop",arg[2],arg[3])
elseif c=="craft" then craft(arg[2])
elseif c=="equip" then equip(arg[2])
elseif c=="mine" then
 local yes=false
 for i=2,#arg do if arg[i]=="--yes" then yes=true end end
 mine(arg[2],yes)
else print("Unknown command: "..c); usage() end
