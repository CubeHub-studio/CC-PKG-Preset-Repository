local b=require("cc.base64"); local s=table.concat(arg," "); if arg[1]=="decode" then print(b.decode(table.concat(arg," ",2))) else print(b.encode(s)) end
