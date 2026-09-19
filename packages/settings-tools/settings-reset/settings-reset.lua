local k=arg[1]; if not k then print("Usage: settings-reset <name>") return end; settings.unset(k); settings.save(); print("Removed.")
