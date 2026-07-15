rednet.open("right")
local mon = peripheral.wrap("monitor_2")

local function getSpeed(velocityObj)
    local str = tostring(velocityObj):gsub("%s+", "")
    
    local values = {}
    for num in str:gmatch("%-?%d+%.?%d*") do
        table.insert(values, tonumber(num))
    end

    if #values < 3 then return "0.0" end
    
    local vx = values[1]
    local vy = values[2]
    local vz = values[3]

    local totalSpeed = math.sqrt(vx*vx + vy*vy + vz*vz)
    
    return string.format("%.1f", totalSpeed)
end

while true do
    local velocity = sublevel.getLinearVelocity()

    if velocity then
        local currentSpeed = getSpeed(velocity)

        mon.setCursorPos(9, 2)
        mon.write("       ") 
        mon.setCursorPos(9, 2)
        mon.write(currentSpeed .. " m/s")
    end

    sleep(0.1)
end
