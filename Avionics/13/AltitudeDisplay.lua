while true do
local pose = sublevel.getLogicalPose()
local height = pose.position.y

local mon = peripheral.wrap("monitor_2")
mon.setTextScale(0.5)
mon.setCursorPos(10,1)

DisplayAlt = string.format("%.2f", height)
mon.write(DisplayAlt)

sleep(0.1)
end
