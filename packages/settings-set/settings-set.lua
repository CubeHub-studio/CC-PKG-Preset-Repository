local k=arg[1]; local v=arg[2]; if not k or not v then print("Usage: settings-set <name> <value>") return end; settings.set(k,v); settings.save(); print("Saved.")
