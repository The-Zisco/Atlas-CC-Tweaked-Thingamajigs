rednet.open("left")

print("Waiting for secondary OS startup...")

local senderID, message, protocol = rednet.receive()

if type(message) == "boolean" then
print("Received boolean from secondary OS")
print("value: ", message)

if message == true then
shell.openTab("FlightMode")
end

else
print("Received something else from secondary OS: ", message)
end
