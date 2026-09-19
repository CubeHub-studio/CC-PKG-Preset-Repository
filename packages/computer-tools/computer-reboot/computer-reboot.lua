local side=arg[1]; if not side then print("Usage: computer-reboot <side>") return end; peripheral.call(side,"reboot"); print("Reboot requested.")
