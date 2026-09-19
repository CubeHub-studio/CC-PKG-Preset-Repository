local rows={}
for _,n in ipairs(peripheral.getNames()) do if peripheral.hasType(n,"energy_storage") then local p=peripheral.wrap(n); local e,c=p.getEnergy(),p.getEnergyCapacity(); rows[#rows+1]={n,e,c,c>0 and e/c*100 or 0} end end
table.sort(rows,function(a,b)return a[4]<b[4] end)
for _,r in ipairs(rows) do print(("%-24s %12d/%-12d %6.1f%%"):format(r[1],r[2],r[3],r[4])) end