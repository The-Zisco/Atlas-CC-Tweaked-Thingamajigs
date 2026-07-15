rednet.open("left")
local RollThreshold = 45.0

local function getRollDegrees(orientationObj)

    local str = tostring(orientationObj):gsub("%s+", "")
    
  
    local values = {}
    for num in str:gmatch("%-?%d+%.?%d*") do
        table.insert(values, tonumber(num))
    end

    if #values < 4 then return 0 end
    
    local w = values[1]
    local x = values[2]
    local y = values[3]
    local z = values[4]


    local right_y = 2 * (x * y + w * z)
    local right_z = 1 - 2 * (x * x + z * z)
    
    local RollRadians = math.atan2(right_y, right_z)
    return math.deg(RollRadians)
end

while true do
local senderID, message = rednet.receive()
local Flight = message [1]
local Ground = message [2]

local mon = peripheral.wrap("monitor_2")

    local poseTable = sublevel.getLastPose()

    if poseTable and poseTable.orientation then
        local CurrentRoll = getRollDegrees(poseTable.orientation)

        if Flight == true and math.abs(CurrentRoll) > RollThreshold then
            print("BANK ANGLE")
            mon.setCursorPos(1,2)
            mon.setTextColour(colors.red)
            mon.write("Bank Angle")
            shell.run("BankAngleAlertPlayer.lua")
        end
    end

    sleep(0.1)
end
