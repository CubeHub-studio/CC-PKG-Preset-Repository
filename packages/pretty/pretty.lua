local t={}; for i,v in ipairs(arg) do t[i]=v end; print(textutils.serialize(t,{compact=false}))
