print("Running parallel demo."); parallel.waitForAll(function() for i=1,3 do print("Task A "..i); sleep(1) end end,function() for i=1,6 do print("Task B "..i); sleep(0.5) end end); print("Done.")
