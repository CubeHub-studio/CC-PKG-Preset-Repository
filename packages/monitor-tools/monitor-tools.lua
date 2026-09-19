-- CC-PKG Monitor Tools
-- Main monitor CLI

local args = {...}
local command = table.remove(args, 1) or "help"

local function monitors()
  local result = {}
  for _, name in ipairs(peripheral.getNames()) do
    local isMonitor = false
    if peripheral.hasType then
      isMonitor = peripheral.hasType(name, "monitor") == true
    else
      isMonitor = peripheral.getType(name) == "monitor"
    end
    if isMonitor then
      local m = peripheral.wrap(name)
      if m then table.insert(result, {name=name, monitor=m}) end
    end
  end
  return result
end

local function fail(message)
  print("CC Monitor Tools: " .. message)
end

local function requireText()
  if #args == 0 then fail("Usage: monitor-tools text <text>"); return nil end
  return table.concat(args, " ")
end

local function list()
  local found = monitors()
  if #found == 0 then print("No monitors found."); return end
  for _, item in ipairs(found) do
    local w, h = item.monitor.getSize()
    print(item.name .. " " .. w .. "x" .. h .. " scale=" .. item.monitor.getTextScale())
  end
end

local function write(clearFirst)
  local value = requireText()
  if not value then return end
  local found = monitors()
  if #found == 0 then fail("No monitor found."); return end
  for _, item in ipairs(found) do
    local m = item.monitor
    if clearFirst then m.clear(); m.setCursorPos(1, 1) end
    m.write(value)
  end
  print("Wrote text to " .. #found .. " monitor(s).")
end

local function clear()
  local found = monitors()
  if #found == 0 then fail("No monitor found."); return end
  for _, item in ipairs(found) do item.monitor.clear() end
  print("Cleared " .. #found .. " monitor(s).")
end

local function size()
  local found = monitors()
  if #found == 0 then fail("No monitor found."); return end
  for _, item in ipairs(found) do
    local w, h = item.monitor.getSize()
    print(item.name .. ": " .. w .. "x" .. h)
  end
end

local function scale()
  local value = tonumber(args[1])
  if not value then fail("Usage: monitor-tools scale <0.5-5>"); return end
  if value < 0.5 or value > 5 or value * 2 ~= math.floor(value * 2) then
    fail("Scale must be a multiple of 0.5 between 0.5 and 5."); return
  end
  local found = monitors()
  if #found == 0 then fail("No monitor found."); return end
  for _, item in ipairs(found) do item.monitor.setTextScale(value) end
  print("Set scale to " .. tostring(value) .. " on " .. #found .. " monitor(s).")
end

local function center()
  local value = requireText()
  if not value then return end
  local found = monitors()
  if #found == 0 then fail("No monitor found."); return end
  for _, item in ipairs(found) do
    local m = item.monitor
    local w, h = m.getSize()
    m.clear()
    m.setCursorPos(math.max(1, math.floor((w - #value) / 2) + 1), math.max(1, math.floor(h / 2) + 1))
    m.write(value)
  end
  print("Centered text on " .. #found .. " monitor(s).")
end

local function test()
  local found = monitors()
  if #found == 0 then fail("No monitor found."); return end
  for _, item in ipairs(found) do
    local m = item.monitor
    local w, h = m.getSize()
    m.clear()
    m.setCursorPos(1, 1); m.write("CC Monitor Tools")
    m.setCursorPos(1, 2); m.write(item.name .. " " .. w .. "x" .. h)
    m.setCursorPos(1, 3); m.write("Monitor test OK")
  end
  print("Monitor test complete.")
end

local function help()
  print("CC Monitor Tools")
  print("Usage: monitor-tools <command> [arguments]")
  print("  list                 List monitors")
  print("  write <text>         Write at current cursor")
  print("  text <text>          Clear and write at 1,1")
  print("  clear                Clear monitors")
  print("  size                 Show monitor sizes")
  print("  scale <0.5-5>        Set text scale")
  print("  center <text>        Center text")
  print("  test                 Run monitor test")
  print("  help                 Show this help")
end

if command == "list" or command == "info" then list()
elseif command == "write" then write(false)
elseif command == "text" then write(true)
elseif command == "clear" then clear()
elseif command == "size" then size()
elseif command == "scale" then scale()
elseif command == "center" then center()
elseif command == "test" then test()
else help() end
