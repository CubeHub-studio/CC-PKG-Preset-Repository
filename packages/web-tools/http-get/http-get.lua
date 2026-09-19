local u=arg[1]; if not u then print("Usage: http-get <url>") return end; local r,e=http.get(u); if not r then print(e) return end; print(r.readAll()); r.close()
