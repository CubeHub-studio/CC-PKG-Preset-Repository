local t=os.epoch("utc"); math.randomseed(t); local s=""; for i=1,16 do s=s..("%x"):format(math.random(0,15)) end print(s)
