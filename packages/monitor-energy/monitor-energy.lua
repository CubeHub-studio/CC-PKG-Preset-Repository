local m=peripheral.find("monitor"); if not m then print("No monitor."); return end
m.setTextScale(.5)
while true do m.clear(); m.setCursorPos(1,1); m.write("Energy"); local y=3; local _,h=m.getSize(); local total,cap=0,0
 for _,n in ipairs(peripheral.getNames()) do if peripheral.hasType(n,"energy_storage") and y<=h then local p=peripheral.wrap(n); local e,c=p.getEnergy(),p.getEnergyCapacity(); total=total+e; cap=cap+c; m.setCursorPos(1,y); m.write(("%s %.1f%%"):format(n,e/c*100)); y=y+1 end end
 if y<=h then m.setCursorPos(1,y); m.write(("TOTAL %.1f%%"):format(cap>0 and total/cap*100 or 0)) end; os.sleep(2) end