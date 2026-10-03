-- // Mahoraga V107 - Full UI Hub & Whitelist Verified //
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Whitelist Security Check
if LocalPlayer.Name ~= "Ryon_230808" then
    local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    local blur = Instance.new("BlurEffect", game.Lighting)
    blur.Size = 24
    
    local sound = Instance.new("Sound", game.Workspace)
    sound.SoundId = "rbxassetid://9069151008"
    sound.Volume = 5
    sound:Play()
    
    task.wait(2.5)
    LocalPlayer:Kick("Unauthorized User - Security Violation")
    return
end

print("Whitelist Verified: Ryon_230808. Loading Mahoraga V107 Hub...")

-- Clean up old GUI if exists
if LocalPlayer.PlayerGui:FindFirstChild("MahoragaHub") then
    LocalPlayer.PlayerGui.MahoragaHub:Destroy()
end

-- Persistent Hub UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MahoragaHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer.PlayerGui

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 240, 0, 320)
MainFrame.Position = UDim2.new(0.05, 0, 0.35, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(220, 160, 40)
MainFrame.Active = true
MainFrame.Draggable = true

-- Title Label
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold
Title.Text = "MAHORAGA V107 HUB"

-- Wheel Container (Transparent & Clean)
local Wheel = Instance.new("ImageLabel", MainFrame)
Wheel.Size = UDim2.new(0, 90, 0, 90)
Wheel.Position = UDim2.new(0.5, -45, 0, 45)
Wheel.BackgroundTransparency = 1
Wheel.Image = "rbxassetid://6023426915"

-- Action Button 1: Toggle Heal
local HealBtn = Instance.new("TextButton", MainFrame)
HealBtn.Size = UDim2.new(0, 200, 0, 35)
HealBtn.Position = UDim2.new(0.5, -100, 0, 145)
HealBtn.BackgroundColor3 = Color3.fromRGB(40, 140, 40)
HealBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
HealBtn.TextSize = 14
HealBtn.Font = Enum.Font.SourceSansBold
HealBtn.Text = "Status: Auto-Heal Active"

-- Action Button 2: Teleport / Mode Switch
local ModeBtn = Instance.new("TextButton", MainFrame)
ModeBtn.Size = UDim2.new(0, 200, 0, 35)
ModeBtn.Position = UDim2.new(0.5, -100, 0, 190)
ModeBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
ModeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ModeBtn.TextSize = 14
ModeBtn.Font = Enum.Font.SourceSansBold
ModeBtn.Text = "Adaptation Mode: Normal"

-- Status Label
local StatusLabel = Instance.new("TextLabel", MainFrame)
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Position = UDim2.new(0, 0, 1, -35)
StatusLabel.BackgroundTransparency = 1
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusLabel.TextSize = 12
StatusLabel.Font = Enum.Font.SourceSans
StatusLabel.Text = "User: Ryon_230808 (Verified)"

-- Continuous 3-Second Healing System (40% Heal Logic)
task.spawn(function()
    while true do
        task.wait(3)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            local hum = LocalPlayer.Character.Humanoid
            if hum.Health > 0 and hum.Health < hum.MaxHealth then
                local healAmount = hum.MaxHealth * 0.4
                hum.Health = math.clamp(hum.Health + healAmount, 0, hum.MaxHealth)
            end
        end
    end
end)

-- Rotation Adaptation Loop
task.spawn(function()
    local rot = 0
    while true do
        rot = (rot + 3) % 360
        Wheel.Rotation = rot
        task.wait(0.03)
    end
end)

print("Mahoraga V107 Hub Loaded Successfully with Full UI!")
