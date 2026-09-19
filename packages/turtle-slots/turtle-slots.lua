if not turtle then print("Not a turtle.") return end; local n=0; for i=1,16 do if turtle.getItemCount(i)>0 then n=n+1 end end print("Occupied slots: "..n.."/16")
