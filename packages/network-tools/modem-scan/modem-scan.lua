local rows={}
for _,n in ipairs(peripheral.getNames()) do if peripheral.hasType(n,"modem") then local m=peripheral.wrap(n); rows[#rows+1]={n,m.isWireless and m.isWireless() or false} end end
for _,r in ipairs(rows) do print(("%-24s %s"):format(r[1],r[2] and "wireless" or "wired")) end
print("Modems: "..#rows)