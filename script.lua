-- // Mahoraga V107 - Luxury Gold Interactive Hub //
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

print("Whitelist Verified: Ryon_230808. Loading Luxury Gold Mahoraga Hub...")

-- Clean up old GUI if exists
if LocalPlayer.PlayerGui:FindFirstChild("MahoragaHub") then
    LocalPlayer.PlayerGui.MahoragaHub:Destroy()
end

-- Persistent Hub UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MahoragaHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer.PlayerGui

-- Main Frame (Luxury Dark & Gold Theme)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 250, 0, 340)
MainFrame.Position = UDim2.new(0.05, 0, 0.35, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0) -- Gold Border
MainFrame.Active = true
MainFrame.Draggable = true

-- Title Label with Gold Gradient / Accent
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(30, 25, 10)
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold
Title.Text = "⚡ MAHORAGA V107 HUB ⚡"

-- Wheel Container (Dharma Wheel Styling)
local Wheel = Instance.new("ImageLabel", MainFrame)
Wheel.Size = UDim2.new(0, 90, 0, 90)
Wheel.Position = UDim2.new(0.5, -45, 0, 50)
Wheel.BackgroundTransparency = 1
Wheel.Image = "rbxassetid://6023426915"

-- Action Button 1: Toggle Heal (Gold/Green Interactive)
local HealBtn = Instance.new("TextButton", MainFrame)
HealBtn.Size = UDim2.new(0, 210, 0, 38)
HealBtn.Position = UDim2.new(0.5, -105, 0, 155)
HealBtn.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
HealBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
HealBtn.TextSize = 14
HealBtn.Font = Enum.Font.SourceSansBold
HealBtn.Text = "Status: Auto-Heal Active"
HealBtn.BorderSizePixel = 1
HealBtn.BorderColor3 = Color3.fromRGB(255, 215, 0)

-- Action Button 2: Wheel Spin Toggle (Gold/Blue Interactive)
local ModeBtn = Instance.new("TextButton", MainFrame)
ModeBtn.Size = UDim2.new(0, 210, 0, 38)
ModeBtn.Position = UDim2.new(0.5, -105, 0, 205)
ModeBtn.BackgroundColor3 = Color3.fromRGB(30, 90, 160)
ModeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ModeBtn.TextSize = 14
ModeBtn.Font = Enum.Font.SourceSansBold
ModeBtn.Text = "Mode: Wheel Spin On"
ModeBtn.BorderSizePixel = 1
ModeBtn.BorderColor3 = Color3.fromRGB(255, 215, 0)

-- Status Footer Label
local StatusLabel = Instance.new("TextLabel", MainFrame)
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Position = UDim2.new(0, 0, 1, -35)
StatusLabel.BackgroundTransparency = 1
StatusLabel.TextColor3 = Color3.fromRGB(218, 165, 32) -- Goldenrod text
StatusLabel.TextSize = 12
StatusLabel.Font = Enum.Font.SourceSansItalic
StatusLabel.Text = "Owner: Ryon_230808 (Verified)"

-- Variables for Button Toggles
local autoHealEnabled = true
local wheelSpinEnabled = true

-- Button 1 Functionality (Toggle Auto-Heal)
HealBtn.MouseButton1Click:Connect(function()
    autoHealEnabled = not autoHealEnabled
    if autoHealEnabled then
        HealBtn.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
        HealBtn.Text = "Status: Auto-Heal Active"
    else
        HealBtn.BackgroundColor3 = Color3.fromRGB(165, 42, 42)
        HealBtn.Text = "Status: Auto-Heal Off"
    end
end)

-- Button 2 Functionality (Toggle Wheel Spin Animation)
ModeBtn.MouseButton1Click:Connect(function()
    wheelSpinEnabled = not wheelSpinEnabled
    if wheelSpinEnabled then
        ModeBtn.BackgroundColor3 = Color3.fromRGB(30, 90, 160)
        ModeBtn.Text = "Mode: Wheel Spin On"
    else
        ModeBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        ModeBtn.Text = "Mode: Wheel Spin Paused"
    end
end)

-- Continuous 3-Second Healing System (Controlled by Toggle)
task.spawn(function()
    while true do
        task.wait(3)
        if autoHealEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            local hum = LocalPlayer.Character.Humanoid
            if hum.Health > 0 and hum.Health < hum.MaxHealth then
                local healAmount = hum.MaxHealth * 0.4
                hum.Health = math.clamp(hum.Health + healAmount, 0, hum.MaxHealth)
            end
        end
    end
end)

-- Rotation Adaptation Loop (Controlled by Toggle)
task.spawn(function()
    local rot = 0
    while true do
        task.wait(0.03)
        if wheelSpinEnabled then
            rot = (rot + 4) % 360
            Wheel.Rotation = rot
        end
    end
end)

print("Mahoraga V107 Luxury Gold Hub Loaded Successfully!")
