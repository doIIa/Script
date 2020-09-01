--[[
 
Made by dollar#0007
 
Logs all whsipers and hidden chats with a UI
 
Usage: +w, +e, +t, +team, +console, +whisper.
 
+clear - clears the text in the gui because im lazy to make it auto scroll
 
--]]
 
for i,v in pairs(game.CoreGui:GetChildren()) do
   if v.Name == "WhisperSpy" then
       v:Destroy()
   else
 
   end
end
 
local ScreenGui = Instance.new("ScreenGui")
local Scroll = Instance.new("ScrollingFrame")
ScreenGui.Name = "WhisperSpy"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Scroll.Name = "Scroll"
Scroll.Parent = ScreenGui
Scroll.BackgroundColor3 = Color3.new(0.337255, 0.337255, 0.337255)
Scroll.BackgroundTransparency = 0.89999997615814
Scroll.Position = UDim2.new(0.0159817338, 0, 0.631728053, 0)
Scroll.Size = UDim2.new(0, 405, 0, 222)
Scroll.CanvasPosition = Vector2.new(0, 484)
Scroll.CanvasSize = UDim2.new(0, 0, 1, 0)
Scroll.ScrollBarThickness = 10
function SCRIPT_KTFX73_FAKESCRIPT()
local script = Instance.new('LocalScript')
script.Parent = ScreenGui
 
local plr = game.Players.LocalPlayer
local Scroll = script.Parent.Scroll
 
local textnumber = 1
local prevOutputPos = 0
 
function output(plr, msg)
local colour = Color3.fromRGB(255,255,255)
local labels = Scroll:GetChildren()
 
if string.sub(msg, 1,2) == "+e" or string.sub(msg,1,2) == "+w"  or string.sub(msg,1,2) == "+t" or string.sub(msg,1,8) == "+console" or string.sub(msg,1,5) == "+team" or string.sub(msg,1,8) == "+whisper" then colour = Color3.fromRGB(255, 255, 0) else colour = Color3.fromRGB(255,255,255) end
local o = Instance.new("TextLabel",Scroll)
o.Name = textnumber
textnumber = textnumber + 1
o.Text = plr.Name .. ": " .. msg
o.Size = UDim2.new(0.95,0,.02,0)
o.Position = UDim2.new(0,0,.02 + prevOutputPos ,0)
o.Font = Enum.Font.SourceSansBold
o.TextColor3 = colour
o.TextStrokeTransparency = 0
o.BackgroundTransparency = 1
o.BackgroundColor3 = Color3.new(0,0,0)
o.BorderSizePixel = 0
o.BorderColor3 = Color3.new(0,0,0)
o.FontSize = "Size14"
o.TextXAlignment = Enum.TextXAlignment.Left
o.ClipsDescendants = true
prevOutputPos = prevOutputPos + 0.025
end
 
for i,v in pairs(game.Players:GetChildren()) do
v.Chatted:Connect(function(msg)
output(v, msg)
end)
end
 
game.Players.ChildAdded:Connect(function(plr)
if plr:IsA("Player") then
plr.Chatted:Connect(function(msg)
output(plr, msg)
end)
end
end)
 
plr.Chatted:Connect(function(msg)
if msg == "+clear" then
for i,v in pairs(Scroll:GetChildren()) do
if v:IsA("TextLabel") then
prevOutputPos = 0
v:Destroy()
textnumber = 1
end
end
end
end)
 
 
end
coroutine.resume(coroutine.create(SCRIPT_KTFX73_FAKESCRIPT))
