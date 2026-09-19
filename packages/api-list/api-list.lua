local a={} for k,v in pairs(_G) do if type(v)=="table" or type(v)=="function" then a[#a+1]=k end end table.sort(a) for _,k in ipairs(a) do print(k) end
