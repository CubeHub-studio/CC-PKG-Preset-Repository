local path=arg[1]; if not path then print("Usage: fs-protect <file>"); return end
if not fs.exists(path) then print("File not found."); return end
if fs.isReadOnly(path) then print("Already read-only."); return end
print("CC:Tweaked does not expose a general writable-file permission bit. Read-only status is filesystem-provider controlled.")