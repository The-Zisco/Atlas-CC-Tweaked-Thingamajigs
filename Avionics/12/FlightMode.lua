while true do
rednet.open("left")

local Situ = redstone.getAnalogInput("top")

local mon = peripheral.wrap("monitor_1")
mon.setTextScale(0.5)
mon.setCursorPos(1,7)
mon.clear()

term.clear()

local Flight = false
local Ground = false
local targetID = 12

if Situ > 0 then
Flight = true
Ground = false
term.setCursorPos(1,1)
term.write("Flight Mode")
mon.write("Flight Mode")
end

if Situ < 1 then
Fight = false
Ground = true
term.setCursorPos(1,1)
term.write("Ground Mode")
mon.write("Ground Mode")
end

local package = { Flight, Ground }
rednet.send(13, package)

sleep(1)
mon.clear()
end
