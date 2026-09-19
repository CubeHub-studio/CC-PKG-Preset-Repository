local k=arg[1]; if not k then print("Usage: settings-get <name>") return end; print(textutils.serialize(settings.get(k)))
