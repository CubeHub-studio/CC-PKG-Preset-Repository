local total,used=0,0
for s=1,16 do local c=turtle.getItemCount(s); if c>0 then used=used+1; total=total+c; local d=turtle.getItemDetail(s,true); print(("%2d %5d %s"):format(s,c,d and (d.displayName or d.name) or "unknown")) end end
print(("Occupied: %d/16 Items: %d"):format(used,total))