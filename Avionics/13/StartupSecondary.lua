rednet.open("left")

shell.openTab("AltitudeDisplay")
shell.openTab("AltTooLowWarning")
shell.openTab("BankAngleWarning")
shell.openTab("VelocityDisplay")

local IsSecondaryStartedUp = true
rednet.send(12, IsSecondaryStartedUp)

print("Boolean sent.")
