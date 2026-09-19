local f="/.motd";local msg="Welcome to CC:Tweaked!";if fs.exists(f) then local h=fs.open(f,"r");msg=h.readAll() or msg;h.close() end;print(msg)
