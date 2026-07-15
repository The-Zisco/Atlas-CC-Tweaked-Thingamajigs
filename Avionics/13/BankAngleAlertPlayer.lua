local dfpwm = require("cc.audio.dfpwm")
local speaker = peripheral.find("speaker")
local fileName = "BankAngle.dfpwm"
local decoder = dfpwm.make_decoder()

if not speaker then
error("No speaker found")
end

for chunk in io.lines(fileName, 16384) do
local buffer = decoder(chunk)
if buffer and #buffer > 0 then
while not speaker.playAudio(buffer) do
os.pullEvent("speaker_audio_empty")
end
end
end

sleep(1.5)
shell.exit()
