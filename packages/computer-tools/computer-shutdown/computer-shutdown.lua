local side=arg[1]; if not side then print("Usage: computer-shutdown <side>") return end; peripheral.call(side,"shutdown"); print("Shutdown requested.")
